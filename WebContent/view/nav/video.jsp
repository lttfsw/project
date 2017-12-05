<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>视频播放界面</title>
     <link rel="stylesheet" href="../../resources/css/video.css" type="text/css"></link>
     <script type="text/javascript" src="../../jquery-1.11.3.min.js"></script>
  </head>
  
  <body style="margin:0xp;background-color:#CBE8EF;">
    <div class="divClass">
      <div class="input">
         <div class="inputName">
                                  主标题：<input type="text" class="inputNameInfo" id ="title" disabled="disabled">
         </div>
         <div class="inputLine">
           &nbsp;&nbsp;&nbsp;商户ID：<input type="text" class="solderId" id ="store_id" disabled="disabled">
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;结束时间：<input type="text" class="solderId" id ="end_time" disabled="disabled">
         </div>
      </div>
      <div class="video">     
  
          <video height="100%" width="100%" controls="controls" id="video">
             <source src="" type="video/ogg">
             <source src="" type="video/mp4">
           </video>
      </div>
       <div class="textarea">
       <input class="inputTextarea" id="suggestion"></input>
      </div>
       <div style="float:left;margin-left:75%;margin-top:5px;">
                	<input type="Button"  id= "btok1" value="通过">
                </div>
                <div style="float:left;margin-left:10px;margin-top:5px;">
                	<input type="Button"  id= "btok2" value="不通过">
                </div>
      <!-- <div class="button">
        <input type="Button" class="btok" id= "btok1" value="通过" >
        <input type="Button" class="cancel" id= "btok2" value="不通过">
      </div> -->
    </div>
  </body>
  <script type="text/javascript">
	//取出json字符串
	var data = sessionStorage.getItem("data");
    //把json字符串解析成json对象
	var obj = JSON.parse(data);
	//给文本框复制
	$("#title").val(obj.title);
	$("#store_id").val(obj.store_id);
	$("#end_time").val(obj.end_time);
	
	$("#video").attr("src",obj.video_url);
	//$("#suggestion").val(obj.suggestion);
	var title=$("#title").val();
	
	$("#btok1").click(function(){
		var suggestion=$("#suggestion").val();
		$.ajax({
			url: "http://120.55.40.199:80/yyt_app/WebMainServlet",
  			type: "POST",
            data:{"method":"auditVideoWeb","title":title,"suggestion":suggestion,"is_audit":"2"},
            dataType: "json",
            success: function(data){
            	if(data.code==0){
               	alert("已进行审核,审核结果为通过");
            	}
            	else{
            		alert("失败");
            		}
       		 }
         }); 
	});
	$("#btok2").click(function(){
		var suggestion=$("#suggestion").val();
		$.ajax({
			url: "http://120.55.40.199:80/yyt_app/WebMainServlet",
  			type: "POST",
            data:{"method":"auditVideoWeb","title":title,"suggestion":suggestion,"is_audit":"1"},
            dataType: "json",
            success: function(data){
            	if(data.code==0){
               	alert("已进行审核，审核结果为不通过");
            	}
            	else{
            		alert("失败");
            		}
       		 }
         }); 
	});
	//显示完清空数据
	sessionStorage.clear();
	

	</script>
</html>
