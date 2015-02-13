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
          .name {{font-weight: bold}}
          .query-text {{font-name:courier;}}
      </style>
   </head>
   <body>
      <div class="container">
      <h4>{$title}</h4>
      Database = {xdmp:database-name(xdmp:database())}<br/>
      URI = {$file-path}<br/>
      Query Count = {count($queries)}<br/>
      {
        for $query at $count in $queries
            return
            <div class="query">
               <div class="Count">Example {$count}</div>
               <div class="name">{$query/@name/string()}</div>
               <div class="query-text"><pre>{$query/text()}</pre></div>
               <div class="run-link"><a href="run-query.xqy?workspace={$workspace}&amp;num={$count}">run</a></div>
            </div>
            
        }
        </div>
    </body>
</html>