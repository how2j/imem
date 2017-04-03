<%@page contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" import="java.util.*"%>

<script src="/js/all.js"></script>
<link href="/css/all.css" rel="stylesheet">



<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>jQuery UI Draggable - Default functionality</title>
<style>
div#content{
 display:block;
 width:500px;
 border:1px solid red !important;
 margin:50px auto !important;
}

</style>
  <style>
  .sortable {
    border: 1px solid #eee;
    width: 100%;
    min-height: 200px;
    min-width:200px;
    list-style-type: none;
    margin: 0;
    padding: 5px 0 0 0;
    float: left;
    margin-right: 10px;
  }
  .sortable li {
    margin: 0 5px 5px 5px;
    padding: 5px;
    font-size: 1.2em;
    width: 120px;
  }
  table.sortableTable td{
/*   	border:1px solid gray; */
/*   	width:500px; */
/*   	margin:50px auto; */
  	vertical-align: top;
  	
  }
  
   
  .my-ui-state-highlight{
  	border: 1px solid #dad55e;
	background: #fffa90;
	color: #777620;
	height:36px;
  }
  
  </style>
<!--   <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<!--   <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
  <script>
  $( function() {
    $( "#sortable1, #sortable2, #sortable3,#sortable4" ).sortable({
      connectWith: ".connectedSortable",
      placeholder: "my-ui-state-highlight"
    }).disableSelection();
  } );
  
  
  </script>
</head>
<body>
 
 <table class="sortableTable" align="center">
 	<tr>
 		<td>
			<ul id="sortable1" class="sortable connectedSortable">
			  <li class="ui-state-default">Item 1</li>
			  <li class="ui-state-default">Item 2</li>
			  <li class="ui-state-default">Item 3</li>
			  <li class="ui-state-default">Item 4</li>
			  <li class="ui-state-default">Item 5</li>
			</ul> 		
 		</td>
 		<td>
			<ul id="sortable2" class="sortable connectedSortable">
			  <li class="ui-state-default">Item 1</li>
			  <li class="ui-state-default">Item 2</li>
			  <li class="ui-state-default">Item 3</li>
			  <li class="ui-state-default">Item 4</li>
			  <li class="ui-state-default">Item 5</li>
			</ul> 		
 		</td>
 	</tr>
 	<tr>
 		<td>
			 <ul id="sortable3" class="sortable connectedSortable">
			  <li class="ui-state-default">Item 1</li>
			  <li class="ui-state-default">Item 2</li>
			  <li class="ui-state-default">Item 3</li>
			  <li class="ui-state-default">Item 4</li>
			  <li class="ui-state-default">Item 5</li>
			</ul>		
 		</td>
 		<td>
			 <ul id="sortable4" class="sortable connectedSortable">
			  <li class="ui-state-default">Item 1</li>
			  <li class="ui-state-default">Item 2</li>
			  <li class="ui-state-default">Item 3</li>
			  <li class="ui-state-default">Item 4</li>
			  <li class="ui-state-default">Item 5</li>
			</ul>		
 		</td>
 	</tr> 	
 </table>

 

 
 
 
</body>
</html>