xquery version "1.0-ml";

module namespace workspaces = "http://marklogic.com/danmccreary/workspaces";
(:
import module namespace workspaces = "http://rbi.com/ares-modules/style" at "/modules/workspaces.xqy";
:)

declare variable $workspaces:version := '0.1';

declare variable $workspaces:list := collection('workspaces');

