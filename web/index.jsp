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
  ul.sortable.nodoing span.taskName{
  	width:700px;
  }
  

  ul.sortable.nodoing span.glyphicon-refresh{
  	display:inline;
  }
  
    
  ul.sortable.doing span.glyphicon-refresh{
  	display:none;
  }  
  
  ul.sortable.nodoing span.glyphicon-thumbs-up{
  	display:none;
  }

  ul.sortable.nodoing span.glyphicon-edit{
  	display:none;
  }
    ul.sortable.nodoing span.glyphicon-trash{
  	display:none;
  }  
  
  
  
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
   		word-wrap: break-word;
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
  
  div.workingarea{
  	margin:50px auto;
/*   	border:1px solid red; */
  	width:960px;
  	height:960px;  
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
    $( "ul.sortable" ).sortable({
      connectWith: ".connectedSortable",
      placeholder: "my-ui-state-highlight",
      cursor: "move",
      update: function( event, ui ) {
    	  sync();
    	  height1=0;
    	  height2=0;
      }
    
    }).disableSelection();
    
    
    
    
    function sync(){
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
    		 var  quadrant = $(this).attr("quadrant");
    		     		 
    		 $(this).children("li").each(function(){
    			 index++;
    			 $(this).children("span.index").html( new String( index +'. ' ));
    			 
    			 if(undefined!=quadrant)
    			 $(this).attr("quadrant",quadrant);
    		 });

    	 });
    	 
    	 var doingCount = 0;
    	 $("ul.sortable.doing li").each(function(){
    		 doingCount++;
    	 });
    	 
    	 $("span.doingCount").html(doingCount);
    	 
    	 var finishCount = 0;
    	 $("ul.sortable.finish li").each(function(){
    		 finishCount++;
    	 });
    	 
    	 $("span.finishCount").html(finishCount);

    	 var deleteCount = 0;
    	 $("ul.sortable.delete li").each(function(){
    		 deleteCount++;
    	 });
    	 
    	 $("span.deleteCount").html(deleteCount);
    	 
    	 
    	 
    	       
    }
       
    
    $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
        // 获取已激活的标签页的名称
        var activeTab = $(e.target).text();
        // 获取前一个激活的标签页的名称
        var previousTab = $(e.relatedTarget).text();
        $(".active-tab span").html(activeTab);
        $(".previous-tab span").html(previousTab);
    });    
    
    
     var sample = $("ul.sortable li").eq(0).html();
     $("ul.sortable li").html(sample);
    

     
     $(".taskName").each(function(){
    	 var randomId=       Math.round(Math.random() *10000);
    	 $(this).attr("tid",randomId);
    	 $(this).parent("li").find("div.action span.glyphicon").attr("tid",randomId);
     });
     
     
     $(".taskName").dblclick(function(){
    	 
    	 var tid = $(this).attr("tid");
    	 $("div.action span.glyphicon-edit[tid="+tid+"]").trigger("click");
    	 
     });
     
     $("div.action span.glyphicon-edit").click(function(){
    	 var tid = $(this).attr("tid");
    	 var taskName= $("span.taskName[tid="+tid+"]").html();
    	 $(".editTaskName").attr("tid",tid);
    	 $(".editTaskName").val(taskName);
    	 $("#myModal").modal('show');
     });
     
     $("div.action span.glyphicon-thumbs-up").click(function(){
    	 var li= $(this).parents("li");
    	 li.prependTo("ul.sortable.finish");
    	 sync();
     });
     
     $("div.action span.glyphicon-trash").click(function(){
    	 var li= $(this).parents("li");
    	 li.prependTo("ul.sortable.delete");
    	 sync();
     });      
     
     $("div.action span.glyphicon-refresh").click(function(){
    	 var li= $(this).parents("li");
    	 var quadrant = li.attr("quadrant");
    	 console.log(quadrant);
    	 console.log($("ul.sortable.doing[quadrant="+quadrant+"]"));
    	 
    	 li.prependTo("ul.sortable.doing[quadrant="+quadrant+"]");
    	 sync();
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
     
    sync();
    
    
    
  } );
  
  
  </script>
</head>
<body>
 
 
<div class="workingArea">


 <div id="msg"></div>
 
 <ul id="myTab" class="nav nav-tabs">
   <li class="active">
      <a href="#doing" data-toggle="tab">
         进行中(<span class="doingCount">0</span>)
      </a>
   </li>
   <li><a href="#finish" data-toggle="tab">已完成
   (<span class="finishCount">0</span>)
   </a></li>
   <li><a href="#delete" data-toggle="tab">已删除
   (<span class="deleteCount">0</span>)
   </a></li>
</ul>
<div id="myTabContent" class="tab-content">
   <div class="tab-pane fade in active" id="doing">

		   <table class="sortableTable" align="center">
			 <tr>
			 <td colspan="5" style="text-align:center"><span class="label label-danger">重要</span></td>
			 </tr>
		
		 	<tr class="row1">
		 		<td></td>
		 		<td class="leftRight">
					<ul id="sortable1" class="sortable connectedSortable doing" quadrant="1">
					  <li class="ui-state-default">
					  	<span class="index">index</span>
					  	
					  	<span class="taskName">taskName</span>
					  	
					  	<div class="pull-right action" display="inilne-block;">
						  	<span class="glyphicon glyphicon-thumbs-up"></span>
						  	<span class=" glyphicon glyphicon-edit"></span>
						  	<span class="glyphicon glyphicon-trash"></span>
						  	<span class="glyphicon glyphicon-refresh"></span>			  	
					  	</div>	
					  	</li>
					  <li class="ui-state-default"><span class="index">index</span><span></span>Item 2</li>
					  <li class="ui-state-default"><span class="index">index</span>Item 3</li>
					  <li class="ui-state-default"><span class="index">index</span>Item 4</li>
					  <li class="ui-state-default"><span class="index">index</span>Item 5</li>
					</ul> 		
		 		</td>
		 		<td class="tdline">
		 		
		 		</td>
		 		<td class="leftRight">
					<ul id="sortable2" class="sortable connectedSortable doing" quadrant="2">
					  <li class="ui-state-default">Item 1</li>
					  <li class="ui-state-default">Item 2</li>
					  <li class="ui-state-default">Item 3</li>
					  <li class="ui-state-default">Item 4</li>
					  <li class="ui-state-default">Item 5</li>
					</ul> 		
		 		</td>
		 		<td></td>
		 	</tr>
		 	<tr class="trline">
		 		<td style="text-align:left"><span class="label label-danger">紧&nbsp;&nbsp;&nbsp;&nbsp;急</span></td>
		 		<td></td>
		 		<td class="tdline centertd"></td>
		 		<td></td>
		 		<td style="text-align:right"><span class="label label-default">不紧急</span></td>
		 	</tr>
		 	<tr class="row2">
		 		<td></td>
		 		<td>
					 <ul id="sortable3" class="sortable connectedSortable doing" quadrant="3">
					  <li class="ui-state-default">Item 1</li>
					  <li class="ui-state-default">Item 2</li>
					  <li class="ui-state-default">Item 3</li>
					  <li class="ui-state-default">Item 4</li>
					  <li class="ui-state-default">Item 5</li>
					</ul>		
		 		</td>
		 		<td class="tdline">
		 		</td>
		 		<td>
					 <ul id="sortable4" class="sortable connectedSortable doing" quadrant="4">
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
 	</div>

			
			
	<div class="tab-pane fade" id="finish">
		   <ul id="sortableFinish" class="sortable connectedSortable finish nodoing">
					  <li class="ui-state-default" quadrant="1">
			
					  	</li>
					  <li quadrant="1" class="ui-state-default"><span class="index">index</span><span></span>Item 2</li>
					  <li quadrant="1" class="ui-state-default"><span class="index">index</span>Item 3</li>
					  <li quadrant="1" class="ui-state-default"><span class="index">index</span>Item 4</li>
					  <li quadrant="1" class="ui-state-default"><span class="index">index</span>Item 5</li>
			</ul>
   </div>
   <div class="tab-pane fade" id="delete">
		   <ul id="sortableFinish" class="sortable connectedSortable delete nodoing">
					  <li class="ui-state-default" quadrant="1">
					  	</li>
					  <li quadrant="1" class="ui-state-default"><span class="index">index</span><span></span>Item 2</li>
					  <li quadrant="1" class="ui-state-default"><span class="index">index</span>Item 3</li>
					  <li quadrant="1" class="ui-state-default"><span class="index">index</span>Item 4</li>
					  <li quadrant="1" class="ui-state-default"><span class="index">index</span>Item 5</li>
			</ul>   
   </div>
</div>
 
 

			 	

</div>

 

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


