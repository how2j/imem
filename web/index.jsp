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
   		vertical-align: top;
   }
   ul.sortable li span.taskName{
   		color:MidnightBlue;
   		width:180px;
   		display:inline-block;
   		cursor:move;
   }   
   
   
   
  .sortable li {
    margin: 0 5px 5px 5px;
    padding: 5px;
    font-size: 1.2em;
    
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
  

  
  div.action span.glyphicon{
  	cursor:pointer;
  	font-size1:14px;
 	padding:0px 0px;
  }

 	
 	div.action span.glyphicon:hover{
 		
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
    
    }).disableSelection();
    
    
    
    
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
    

     
     $(".taskName").each(function(){
    	 var randomId=       Math.round(Math.random() *10000);
    	 $(this).attr("tid",randomId);
    	 $(this).parent("li").find("div.action span.glyphicon").attr("tid",randomId);
     });
     
     $("div.action span.glyphicon-edit").click(function(){
    	 var tid = $(this).attr("tid");
    	 var taskName= $("span.taskName[tid="+tid+"]").html();
    	 $(".editTaskName").attr("tid",tid);
    	 $(".editTaskName").val(taskName);
    	 $("#myModal").modal('show');
    	     	 
     });
     
     $("#myModal").on("shown.bs.modal",function(){
    	 $(".editTaskName").focus();
       });     
     
     $("#submitModuleTaskName").click(function(){
    	 var tid = $(".editTaskName").attr("tid");
    	 var taskName = $(".editTaskName").val();
    	 $("span.taskName[tid="+tid+"]").html(taskName);
    	 $("#myModal").modal('hide');
     });
     
     $(".editTaskName").keypress(function (e) { 
    	  var key = e.which; 
    	    if (key == 13) {
    	    	$("#submitModuleTaskName").trigger("click");
    	    }
    	});     
     
    adjustSortableHeight();
    
    
    
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
			  	<span class='index'>index</span>
			  	
			  	<span class='taskName'>taskName</span>
			  	
			  	<div class="pull-right action" display="inilne-block;">
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

 <script>
$(function(){
   $("#open").click(function(){
      $("#myModal").modal('show');
   });
   $("#submit").click(function(){
      $("#myModal").modal('hide');
   });
   $("#toggle").click(function(){
      $("#myModal").modal('toggle');
   });
});
</script>
 
<button  class="btn btn-default" id="open"> 打开模态窗口</button>
<button class="btn btn-default"  id="close"> 关闭模态窗口</button>
<button class="btn btn-default"  id="toggle"> 切换模态窗口</button>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
<div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
            <h4 class="modal-title">编辑</h4>
          </div>
          <div class="modal-body">
            <p>修改任务名称</p>
            <input class="form-control editTaskName">
          </div>
          <div class="modal-footer">
            <button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
            <button class="btn btn-primary" id="submitModuleTaskName" type="button">提交</button>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
</div>
   
 
 
</body>
</html>


