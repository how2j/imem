<%@page contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="js/all.js"></script>
<link href="css/all.css" rel="stylesheet">



<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>重要又紧急</title>
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
  table.sortableTable td{
/*   	border:1px solid red; */
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
  

	div.action{
		display:inline-block;
		float:right;
		z-index: 100;
	}
  
  div.action span.glyphicon{
  	cursor:pointer;
  	font-size1:20px;
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
 

  <script>
  $( function() {
	  var height1 = 0;
	  var height2 = 0;
	  var fadeTime =1000;
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
    
    
    function sync2db(){
    	var arr = new Array(); 
    	
    	$("ul.sortable li").each(function(){
    		li =  $(this);
    		var lijson = li2json(li);
    		arr.push(lijson);
    	});
    	
    	var lijsons = arr.join();
    	lijsons = arr.toString();
    	lijsons = JSON.stringify(arr);
    	
    	var lijsonObject = $.parseJSON(lijsons);
    	  
    	var page = "jsonsTask";
    	 $.ajax({
             url: page,
             method: "post",
             data:{"taskJsons":lijsons},
             success: function(result){

            	 var tasks = $.parseJSON(result) ;
            	 $.each(tasks, function (n, task) {
            		 var id = task.id;
            		 var uuid = task.uuid;
            		 $("li[uuid="+uuid+"]").attr("id",id)

                 });
             }
         });    	
    }
    
    function li2json(li){
    	var sample = '{id:"#id#",quadrant:"#quadrant#",uuid:"#uuid#",name:"#name#",index:"#index#",status:"#status#"}';
    	var id = li.attr("id");
    	if(undefined==id)
    		id=-1;
    	var quadrant = li.attr("quadrant");
    	var uuid = li.attr("uuid");
    	if(undefined==uuid)
    		uuid = "no-uuid";
    	var name =li.find("span.taskName").html();
    	var index = li.find("span.index").html().replace(".","");
    	
    	var status =li.parents("div.statusDiv").attr("status");
    	
    	
    	var jsonString = sample;
    	jsonString = jsonString.replace("#id#",id);
    	jsonString = jsonString.replace("#quadrant#",quadrant);
    	jsonString = jsonString.replace("#uuid#",uuid);
    	jsonString = jsonString.replace("#name#",name);
    	jsonString = jsonString.replace("#index#",index);
    	jsonString = jsonString.replace("#status#",status);
    	
    	return jsonString;
    	
    	
    }
    
    
    
    
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
    	 
    	 height1=0;
    	 sync2db();
    }
       
    
    $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
		sync();
    });    
    
    
     var sample = $("ul.sortable li").eq(0).html();
     
     
     
     
     $("ul.sortable li").html(sample);
    

     
     $(".taskName").each(function(){
    	 var randomId=       Math.round(Math.random() *10000);
    	 $(this).attr("tid",randomId);
    	 $(this).parent("li").find("div.action span.glyphicon").attr("tid",randomId);
     });
     
     

     

     
     function editTask(){
    	 var tid = $(this).attr("tid");
    	 var taskName= $("span.taskName[tid="+tid+"]").html();
    	 $(".editTaskName").attr("tid",tid);
    	 $(".editTaskName").val(taskName);
    	 $("#myModal").modal('show');
     };
     
     function deleteTask(){
    	 var li= $(this).parents("li");
    	 li.fadeOut(fadeTime,function(){
    		 li.prependTo("ul.sortable.delete");
    	 });
    	 li.fadeIn(function(){
    		 sync();	 
    	 });       	 
    	 

     };
     
     function finishTask(){
    	 var li= $(this).parents("li");
    	 li.fadeOut(fadeTime,function(){
    		 li.prependTo("ul.sortable.finish");
    	 });
    	 
    	 li.fadeIn(function(){
    		 sync();	 
    	 });     	 
     };
     
     function refreshTask(){
    	 var li= $(this).parents("li");
    	 li.fadeOut(fadeTime,function(){
        	 var quadrant = li.attr("quadrant");
        	 li.prependTo("ul.sortable.doing[quadrant="+quadrant+"]");
    	 });
    	 
    	 li.fadeIn(function(){
    		 sync();	 
    	 });    
    	 
     };
     
     function dblTask(){
    	 var tid = $(this).attr("tid");
    	 $("div.action span.glyphicon-edit[tid="+tid+"]").trigger("click");    	 
     }
     
    
     
     function registerAction(){
    	 $("div.action span.glyphicon-trash").off("click",deleteTask);
    	 $("div.action span.glyphicon-thumbs-up").off("click",finishTask);
    	 $("div.action span.glyphicon-edit").off("click",editTask);
    	 $("div.action span.glyphicon-refresh").off("click",refreshTask);    	 
    	 $(".taskName").off("dblclick",dblTask);    	 
    	 
    	 $("div.action span.glyphicon-trash").on("click",deleteTask);
    	 $("div.action span.glyphicon-thumbs-up").on("click",finishTask);
    	 $("div.action span.glyphicon-edit").on("click",editTask);
    	 $("div.action span.glyphicon-refresh").on("click",refreshTask);
    	 $(".taskName").on("dblclick",dblTask);
     };
     
     registerAction();


     $("#myModal").on("shown.bs.modal",function(){
    	 $(".editTaskName").focus();
       });     
     $("#myAddModal").on("shown.bs.modal",function(){
    	 $(".addTaskNameInput").focus();
       });     
     
     $("#submitModuleTaskName").click(function(){
    	 var tid = $(".editTaskName").attr("tid");
    	 var taskName = $(".editTaskName").val();
    	 if(0==taskName.length)
    		 return;
    	 $("span.taskName[tid="+tid+"]").html(taskName);
    	 $("#myModal").modal('hide');
     });
     
     $(".editTaskName").keypress(function (e) { 
    	  var key = e.which; 
    	    if (key == 13) {
    	    	$("#submitModuleTaskName").trigger("click");
    	    }
    	});     
     
     
     $(".addTaskNameInput").keypress(function (e) { 
   	  var key = e.which; 
   	    if (key == 13) {
   	    	$("#submitModuleAddTaskName").trigger("click");
   	    }
   	});      
     
     $("button.addTaskButton").click(function(){
    	 $(".addTaskNameInput").val("");
    	 $("#myAddModal").modal('show');
     });
     
     $("#submitModuleAddTaskName").click(function(){
    	 $("#myAddModal").modal('hide');
    	 
    	 var taskName= $(".addTaskNameInput").val();
    	 
    	 if(0==taskName.length)
    		 return;
    	 
    	 var sample = $("#liSample").html();
    	 
    	 var newLi = sample;
    	 newLi = newLi.replace("#taskName#",taskName);
    	 newLi = newLi.replace("#uuid#",uuid());
    	 
    	 $("#sortable1").prepend(newLi);
    	 
    	 
    	 registerAction();
    	 sync();
     });
     
     function uuid(){
    	 var s = [];
         var hexDigits = "0123456789abcdef";
         for (var i = 0; i < 36; i++) {
             s[i] = hexDigits.substr(Math.floor(Math.random() * 0x10), 1);
         }
         s[14] = "4";  // bits 12-15 of the time_hi_and_version field to 0010
         s[19] = hexDigits.substr((s[19] & 0x3) | 0x8, 1);  // bits 6-7 of the clock_seq_hi_and_reserved to 01
         s[8] = s[13] = s[18] = s[23] = "-";
         var uuid = s.join("");
         return uuid;
    	 
     }
    
     $("div.tasksOnServer li").each(function(){
    	 
    	 var status= $(this).attr("status");
    	 var quadrant= $(this).attr("quadrant");

    	 
    	 if("doing"==status){
    		 var ul = $("ul.sortable[quadrant="+quadrant+"]");
    		 $(this).appendTo(ul);
    	 }
    	 
    	 if("finish"==status){
    		 var ul = $("div[status="+status+"] ul.sortable");
    		 $(this).appendTo(ul);    		 
    	 }
    	 
    	 if("delete"==status){
    		 var ul = $("div[status="+status+"] ul.sortable");
    		 $(this).appendTo(ul);    		 
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
   <div  status="doing" class="statusDiv tab-pane fade in active" id="doing">

		   <table class="sortableTable" align="center">
			 <tr style="height:80px">
				 <td colspan="5" style="text-align:center"><span class="label label-danger">重要</span>
					 <br>
					 <br>
					 <br>
				 <button class="btn btn-success addTaskButton">新增</button>
				 </td>
			 </tr>
<tr>
			 <td colspan="5" style="text-align:center"></td>
			 </tr>		
		 	<tr class="row1">
		 		<td></td>
		 		<td class="leftRight">
					<ul id="sortable1" class="sortable connectedSortable doing" quadrant="1">
					</ul> 		
		 		</td>
		 		<td class="tdline">
		 		
		 		</td>
		 		<td class="leftRight">
					<ul id="sortable2" class="sortable connectedSortable doing" quadrant="2">

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

					</ul>		
		 		</td>
		 		<td class="tdline">
		 		</td>
		 		<td>
					 <ul id="sortable4" class="sortable connectedSortable doing" quadrant="4">

					</ul>		
		 		</td>
		 		<td></td>
		 	</tr> 	
		 	
			 <tr>
			 <td colspan="5" style="text-align:center"><span class="label label-default">不重要</span></td>
			 </tr> 	
		 </table>
 	</div>

			
			
	<div  status="finish"  class="statusDiv tab-pane fade" id="finish">
		   <ul id="sortableFinish" class="sortable connectedSortable finish nodoing">

			</ul>
   </div>
   <div  status="delete" class="statusDiv tab-pane fade" id="delete">
		   <ul id="sortableFinish" class="sortable connectedSortable delete nodoing">
			</ul>   
   </div>
</div>
 
 

			 	
<div style="text-align: center">
<a href="http://how2j.cn">由how2j.cn制作</a>
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
   
   
<div class="modal fade" id="myAddModal" tabindex="-1" role="dialog" aria-labelledby="myAddModalLabel">
<div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
            <h4 class="modal-title">新增</h4>
          </div>
          <div class="modal-body">
            <p>新增任务名称</p>
            <input class="form-control addTaskNameInput">
          </div>
          <div class="modal-footer">
            <button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
            <button class="btn btn-primary" id="submitModuleAddTaskName" type="button">提交</button>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
</div>   

<div id="liSample" class="hidden">
					   <li class="ui-state-default" uuid="#uuid#" id="-1">
					  	<span class="index">index</span>
					  	
					  	<span class="taskName">#taskName#</span>
					  	
					  	<div class="action">
						  	<span class="glyphicon glyphicon-thumbs-up"></span>
						  	<span class=" glyphicon glyphicon-edit"></span>
						  	<span class="glyphicon glyphicon-trash"></span>
						  	<span class="glyphicon glyphicon-refresh"></span>			  	
					  	</div>	
					  	</li>
</div>


<div class="hidden1 tasksOnServer" >


<c:forEach items="${tasks}" var="t">

  <li id="${t.id}" class="ui-state-default" status="${t.status}" quadrant="${t.quadrant}" >
  	<span class="index">${t.index}</span>
  	
  	<span class="taskName">${t.name}</span>
  	
  	<div class="action">
	  	<span class="glyphicon glyphicon-thumbs-up"></span>
	  	<span class=" glyphicon glyphicon-edit"></span>
	  	<span class="glyphicon glyphicon-trash"></span>
	  	<span class="glyphicon glyphicon-refresh"></span>			  	
  	</div>	
  	</li>	

</c:forEach>



</div>
 
</body>
</html>


