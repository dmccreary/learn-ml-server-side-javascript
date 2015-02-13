xquery version "1.0-ml";

let $title := 'List workspaces'

(: don't do this for large collections, put documents into collection called workspace :)
let $all-uris := cts:uris()

(: remove URIs that do not start with '/workspaces' and are not the collection :)
let $workspaces :=
 for $uri in $all-uris
    return
    if (starts-with($uri, '/workspaces') and $uri ne '/workspaces/')
       then $uri
       else ()
return
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
         Workspace count = {count($workspaces)} <br/>
         Total Queryies = {count(doc()//query)}<br/>
         <table class="table table-striped table-bordered table-hover">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Workspace Name</th>
                    <th>Query Count</th>
                </tr>
            </thead>
            <tbody>
            {for $uri at $count in $workspaces
                let $workspace-doc := doc($uri)/export
                let $workspace-name := replace(substring-after($uri, '/workspaces/'), '/', '')
                return
                  <tr>
                     <td>{$count}</td>
                     <td><a href="list-workspace-queries.xqy?workspace={$workspace-name}">
                        {$workspace-doc/workspace/@name/string()}</a>
                     </td>
                     <td>{count($workspace-doc//query)}</td>
                  </tr>
            }
            </tbody>
        </table>
      </div>
    </body>
</html>