xquery version "1.0-ml";

declare namespace json="http://marklogic.com/xdmp/json";

let $title := 'List Workspace Queries'

let $workspace := xdmp:get-request-field('workspace', 'sever-side-javascript-examples.xml')
let $num := xs:positiveInteger(xdmp:get-request-field('num', ''))
let $mode := xdmp:get-request-field('mode', '')

let $file-path := concat('/workspaces/', $workspace)
(: /workspaces/sever-side-javascript-examples.xml :)
let $workspace-doc := doc($file-path)/export/workspace
let $query := $workspace-doc/query[$num]



(: this is where we execute JavaScript query on the server :)
let $query-results := xdmp:javascript-eval($query)

let $types := xdmp:type($query-results)
      
let $node-count := count($query-results)

(: <query name="Hello World" focus="false" active="false" mode="javascript">
:)
let $set-html-content := xdmp:set-response-content-type("text/html")
return
<html>
   <head>
      <title>{$title}</title>
      <link rel="stylesheet" href="../resources/css/bootstrap.min.css"/>
      <link rel="stylesheet" href="../resources/css/site.css"/>
      <style type="text/css">
          .name {{font-weight: bold;}}
          .query-text {{font-name:courier;}}
          .block-label {{font-weight: bold}}
          .type {{float:right; border:solid silver 1px;}}
      </style>
   </head>
   <body>
      <div class="container">
      <h4>{$title}</h4>
      Database = {xdmp:database-name(xdmp:database())}<br/>
      URI = {$file-path}<br/>
      num = {$num}<br/>    
      node-count = {$node-count}<br/>
            <div class="query">
               <div class="name">{$query/@name/string()}</div>
               <div class="block-label">Query</div>
               <div class="query-text">
                  <pre>{$query/text()}</pre>
                </div>
               <div><span class="block-label">Results</span> <span> types = {$types}</span></div>
               <div class="results">
                  {for $result in $query-results
                    return
                      <div class="result">
                         <span class="type">{xdmp:type($result)}</span>
                         <pre>{xdmp:quote($result)}</pre>
                      </div>
                  }
               </div>
            </div>
        </div>
    </body>
</html>