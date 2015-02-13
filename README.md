# learn-ml-server-side-javascript

This is a collection of MarkLogic Server Side JavaScript example programs.  I am storing them as a series of "workspaces" that could be loaded into the MarkLogic Query Console.  This interface is OK, however I find it difficult to use especially when I want to scroll through a large number of short programs.  So I have provided a mini-front end that will list the workspaces and then allow you to view and execute each of queries in your web browser.

The program app/views/list-workspaces.xqy will display a HTML table that will list of all the workspaces that begin with the /workspaces/ in the URI.  This program has links to the following that lists all the queries in a workspace:

views/list-workspace-queries.xqy?workspace=sever-side-javascript-examples.xml

Directly under each query is a link called "run":

views/run-query.xqy?workspace=sever-side-javascript-examples.xml&num=1

This will run the nth query in a workspace.

Let me know if this is useful for learning MarkLogic Server-Side JavaScript.

- Dan


