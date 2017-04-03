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
      /*background-color:;*/  
    width: 100%;
    min-height: 100px;
    min-width:200px;
    list-style-type: none;
    margin: 0;
    float: left;
    margin-right: 10px;
    padding:50px;
    
    
  }
  

   ul.sortable li span.index{
   		color:DeepSkyBlue;
   }
   ul.sortable li span.taskName{
   		color:MidnightBlue;
   }   
   
   
   
  .sortable li {
    margin: 0 5px 5px 5px;
    padding: 5px;
    font-size: 1.2em;
    cursor:move;
    background-color: AliceBlue;
    border-color:Feldspar;
/*     width: 120px; */
  }
  table.sortableTable td{
/*     	border:1px solid gray;   */
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
  	border-bottom: 1px dashed lightgray;
/*   	background: lightgray; */
  }
  td.tdline{
	width:1px;
	border-left: 1px dashed lightgray;
  }
  
    
  
    .my-ui-state-highlight{
  	border: 1px solid #dad55e;
	background: #fffa90;
	color: #777620;
	height:36px;
  }
  div.action span{
  	cursor:pointer;
  	font-size:12px;
  	margin-left:10px;
  }

 	
	div.action span.glyphicon-thumbs-up{
  		color:DarkCyan;
	}  
  	div.action span.glyphicon-edit{
  		color:CornflowerBlue;
	}  
  	div.action span.glyphicon-trash{
  		color:LightSalmon;
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
    		expectedHeight +=50;
    		if(expectedHeight>height1)
    			height1 = expectedHeight;
    		
    	});
    	$("table.sortableTable tr.row1 ul.sortable").each(function(){
    		var thisHeight  = $(this).height();
   			$(this).height(height1);
			$(this).parent("td").height(height1+10);
    	});



    	 
    	 
    	 $("ul.sortable ").each(function(){
    		 var index = 0;
    		 $(this).children("li").each(function(){
    			 index++;
    			 $(this).children("span.index").html( new String( index +'. ' ));	 
    		 });

    	 });
    	 
    	       
    }
       
    
//     var t = setInterval(adjustSortableHeight,1000);
    
//     $("ul.sortable li").html("");
//     $("ul.sortable li").prepend("<span contenteditable='true' class='taskName'>taskName</span>");
//     $("ul.sortable li").prepend("<span class='index'>index</span>");
    
//     $("ul.sortable li").apend("<p class='taskName'></p>");
    
    
    
     var sample = $("ul.sortable li").eq(0).html();
     $("ul.sortable li").html(sample);
    
    
    adjustSortableHeight();
    
    $("span.taskName").attr("contenteditable",true);
    
  } );
  
  
  </script>
</head>
<body>
 
 
 <div id="msg"></div>
 
 <table class="sortableTable" align="center">
	 <tr>
	 <td colspan="5" style="text-align:center"><span class="label label-danger">重要</span></td>
	 </tr>

 	<tr class="row1">
 		<td></td>
 		<td class="leftRight">
			<ul id="sortable1" class="sortable connectedSortable">
			  <li class="ui-state-default">
			  	<span class='index'>index</span><span contenteditable='true' class='taskName'>taskName</span>
			  	
			  	<div class="pull-right action">
				  	<span class="glyphicon glyphicon-thumbs-up"></span>
				  	<span class=" glyphicon glyphicon-edit"></span>
				  	<span class="glyphicon glyphicon-trash"></span>			  	
			  	
			  	
			  	</div>

			  	</li>
			  <li class="ui-state-default"><span class='index'>index</span><span></span>Item 2</li>
			  <li class="ui-state-default"><span class='index'>index</span>Item 3</li>
			  <li class="ui-state-default"><span class='index'>index</span>Item 4</li>
			  <li class="ui-state-default"><span class='index'>index</span>Item 5</li>
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
 		<td></td>
 	</tr>
 	<tr class="trline" >
 		<td style="text-align:left"><span class="label label-danger">紧&nbsp;&nbsp;&nbsp;&nbsp;急</span></td>
 		<td></td>
 		<td  class="tdline centertd" ></td>
 		<td></td>
 		<td style="text-align:right"><span class="label label-default">不紧急</span></td>
 	</tr>
 	<tr  class="row2">
 		<td></td>
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
 		<td></td>
 	</tr> 	
 	
	 <tr>
	 <td colspan="5" style="text-align:center"><span class="label label-default">不重要</span></td>
	 </tr> 	
 </table>

 

 
 
 
</body>
</html>


