xquery version "1.0-ml";



declare function local:assemble-page($title as xs:string, $content as element()) as node()* {
<html>
   <head>
      <title>{$title}</title>
      <link rel="stylesheet" href="resources/css/bootstrap.min.css"/>
      <link rel="stylesheet" href="resources/css/site.css"/>
   </head>
   <body>
     <div class="container-fluid">
         {$content}
     </div>
   </body>
</html>
};


let $set-html-content := xdmp:set-response-content-type("text/html")
let $title := 'Learn Server Side JavaScript'

let $content :=
<div class="content">
   <h2>Learn ServerSide JavaScript</h2>
   
   <h4>Sample JavaScript Programs</h4>
   
   <a href="views/list-aws-autoscale.xqy">List AWS AutoScale Files</a><br/>
   
   <a href="views/list-workspace-queries.xqy">List Workspace Queries</a><br/>
   <a href="views/list-workspace-queries-table.xqy">List Workspace Queries Table</a><br/>
   

</div>

return local:assemble-page($title, $content)