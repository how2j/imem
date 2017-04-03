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
  ul.sortable {
/*     border: 1px solid #eee; */
/*      background-color:lightblue;  */
    width: 100%;
    min-height: 200px;
    min-width:200px;
    list-style-type: none;
    margin: 0;
    float: left;
    margin-right: 10px;
    padding:50px;
    
  }
  .sortable li {
    margin: 0 5px 5px 5px;
    padding: 5px;
    font-size: 1.2em;
    cursor:pointer;
/*     width: 120px; */
  }
  table.sortableTable td{
/*    	border:1px solid gray;  */
/*    	width:500px;  */

  	vertical-align: top;
/*   	padding:10px; */
  	
  }
  table.sortableTable{
  	margin:50px auto;
/*   	border:1px solid red; */
  	width:960px;
  	height:960px;
  }
  
   
  td.leftRight{
  	width:478px;
  }
  tr.trline{
  	height:4px;
  	background: lightgray;
  }
  td.tdline{

	background: lightgray;
  }
  
    .my-ui-state-highlight{
  	border: 1px solid #dad55e;
	background: #fffa90;
	color: #777620;
	height:36px;
  }
  
  span.taskName{
  	
  }

   
  </style>
<!--   <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<!--   <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
  <script>
  $( function() {
	  var height1 = 0;
	  var height2 = 0;
    $( "#sortable1, #sortable2, #sortable3,#sortable4" ).sortable({
      connectWith: ".connectedSortable",
      placeholder: "my-ui-state-highlight",
      cursor: "move",
      update: function( event, ui ) {
    	  adjustSortableHeight();
    	  height1=0;
    	  height2=0;
      }
    
    });
//     .disableSelection();
    
    
    
    
    function adjustSortableHeight(){
    	$("table.sortableTable tr.row1 ul.sortable").each(function(){
    		var thisHeight  = $(this).height();
    		var expectedHeight = 0;
    		
    		$(this).children("li").each(function(){
    			var liHeight = $(this).height()+12;
    			expectedHeight+=liHeight;
    		});
    		expectedHeight +=100;
    		if(expectedHeight>height1)
    			height1 = expectedHeight;
    		
    	});
    	$("table.sortableTable tr.row1 ul.sortable").each(function(){
    		var thisHeight  = $(this).height();
   			$(this).height(height1);
			$(this).parent("td").height(height1+10);
    	});


    	 $("ul.sortable li span.index").css("color","blue");
    	 
    	 
    	 $("ul.sortable ").each(function(){
    		 var index = 0;
    		 $(this).children("li").each(function(){
    			 index++;
    			 $(this).children("span.index").html( new String( index +'. ' ));	 
    		 });

    	 });
    	 
    	       
    }
       
    
//     var t = setInterval(adjustSortableHeight,1000);
    
    $("ul.sortable li").html("");
    $("ul.sortable li").prepend("<span contenteditable='true' class='taskName'>taskName</span>");
    $("ul.sortable li").prepend("<span class='index'>index</span>");
    
//     $("ul.sortable li").apend("<p class='taskName'></p>");
    
    
    
    
    
    adjustSortableHeight();
    
    $("span.taskName").attr("contenteditable",true);
    
  } );
  
  
  </script>
</head>
<body>
 
 
 <div id="msg"></div>
 
 <table class="sortableTable" align="center">
 	<tr class="row1">
 		<td class="leftRight">
			<ul id="sortable1" class="sortable connectedSortable">
			  <li class="ui-state-default">Item 1<span contenteditable='true' >fjkdaslfjaskl;</span></li>
			  <li class="ui-state-default">Item 2</li>
			  <li class="ui-state-default">Item 3</li>
			  <li class="ui-state-default">Item 4</li>
			  <li class="ui-state-default">Item 5</li>
			</ul> 		
 		</td>
 		<td class="tdline" >
 		
 		</td>
 		<td  class="leftRight">
			<ul id="sortable2" class="sortable connectedSortable">
			  <li class="ui-state-default">Item 1</li>
			  <li class="ui-state-default">Item 2</li>
			  <li class="ui-state-default">Item 3</li>
			  <li class="ui-state-default">Item 4</li>
			  <li class="ui-state-default">Item 5</li>
			</ul> 		
 		</td>
 	</tr>
 	<tr class="trline" >
 		<td  class="tdline" colspan="3"></td>
 	</tr>
 	<tr  class="row2">
 		<td>
			 <ul id="sortable3" class="sortable connectedSortable">
			  <li class="ui-state-default">Item 1</li>
			  <li class="ui-state-default">Item 2</li>
			  <li class="ui-state-default">Item 3</li>
			  <li class="ui-state-default">Item 4</li>
			  <li class="ui-state-default">Item 5</li>
			</ul>		
 		</td>
 		<td  class="tdline">
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
