xquery version "1.0-ml";

let $title := 'List Workspace Queries'

let $workspace := xdmp:get-request-field('workspace', 'sever-side-javascript-examples.xml')

let $file-path := concat('/workspaces/', $workspace)
(: /workspaces/sever-side-javascript-examples.xml :)
let $workspace-doc := doc($file-path)/export/workspace
let $queries := $workspace-doc/query

let $set-html-content := xdmp:set-response-content-type("text/html")

(: <query name="Hello World" focus="false" active="false" mode="javascript">
:)
return
<html>
   <head>
      <title>{$title}</title>
      <link rel="stylesheet" href="../resources/css/bootstrap.min.css"/>
      <link rel="stylesheet" href="../resources/css/site.css"/>
      <style type="text/css">
          
          .query-text {{font-name:courier;}}
      </style>
   </head>
   <body>
      <div class="container">
      <h4>{$title}</h4>
      Database = {xdmp:database-name(xdmp:database())}<br/>
      URI = {$file-path}<br/>
      Query Count = {count($queries)}<br/>
      <table class="table table-striped">
            <thead>
               <tr>
                  <th>#</th>
                  <th>name</th>
                  <th>type</th>
                  <th>size</th>
                  <th>run</th>
               </tr>
            </thead>
            <tbody>
               {for $query at $count in $queries
                     return
                     <tr>
                        <td>{$count}</td>
                        <td>{$query/@name/string()}</td>
                        <td>{$query/@mode/string()}</td>
         
                        <td>{string-length($query)}</td>
                        <td><a href="run-query.xqy?workspace={$workspace}&amp;num={$count}">run</a></td>
                    </tr>
                     
                 }
           </tbody>
        </table>
        </div>
    </body>
</html>