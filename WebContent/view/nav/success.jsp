<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>视频播放界面</title>
     <link rel="stylesheet" href="../../resources/css/success.css" type="text/css"></link>
     <script type="text/javascript" src="../../jquery-1.11.3.min.js"></script>
  </head>
  
  <!-- <body style="margin:0xp;background-color:#CBE8EF;">
    <form action="http://120.55.40.199:80/yyt_app/UploadStoreServlet" enctype="multipart/form-data" method="post" id="form1"> -->
    <!-- <input type="hidden" name="method" value="auditWeb"> -->
    <div class="divClass" id="divClass">
    
     <div class="top">
         <div class="topclass" >图文案例</div>
        <!--  <div class="topclass">视频案例</div> -->
     </div>
     
     <div id="content1">
      <div class="input">
         <div class="inputName">
                   &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp商业名称：<input type="text" class="inputNameInfo" disabled="disabled" name="title" id="title">
         </div>
         <div class="inputLine">
           &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp商户ID：<input type="text" class="solderId" id="store_id" disabled="disabled">
           &nbsp&nbsp&nbsp&nbsp发布时间：<input type="text" class="solderId" id="release_time" disabled="disabled">
         </div>
      </div>
      
        <div class="list">
          <div class="add" >
           <img id="add" src="" style="height:100%;width:100%;border:1px solid #93b9d2;" ></img>
          </div>
          <div class="textarea">
             <textarea class="textarea1" placeholder="文字说明" name="introduce" id="introduce"></textarea>
             <textarea class="textarea1" style="margin-bottom: 0px;" placeholder="失败原因" id="suggestion" name="suggestion"></textarea>
          </div>
        </div>
       <div class="bottom">
          <input type="submit" class="btok" value="通过" name="is_audit">
          <input type="submit" class="btcancel" value="不通过" name="is_audit">
       </div>
       </div>
    </div>
    
    <div class="divClass" style="display:none;" id="divClass1" >
      
      <div class="top">
         <div class="topclass" >图文案例</div>
         <div class="topclass" >视频案例</div>
     </div>
     
       <div id="content2" style="height:440px;width:550px;">
          <video height="100%" width="100%" controls="controls">
               <source src="" type="video/ogg">
               <source src="" type="video/mp4">
          </video>
       </div>
    </div>
  <!--   </form> -->
  </body>
  <script type="text/javascript">
    $(function(){
          $(".topclass").click(function(){
             
             if($(this).index()==0)
             {
                
                  $("#divClass").css("display","block");
                  $("#divClass1").css("display","none");
             }
             if($(this).index()==1)
             {
                 
                  $("#divClass1").css("display","block");
                  $("#divClass").css("display","none");
             }
          })
    })
    //取出json字符串
	var data = sessionStorage.getItem("data");
    //把json字符串解析成json对象
	var obj = JSON.parse(data);
	//给文本框复制
	
	$("#title").val(obj.title);
	$("#store_id").val(obj.store_id);
	$("#release_time").val(obj.release_time);
	$("#add").attr("src",obj.img_url_main);
	$("#introduce").val(obj.introduce);
	var title=$("#title").val();
	$(function(){
		
		
		$(".btok").click(function(){
			var introduce=$("#introduce").val();
			var suggestion=$("#suggestion").val();
			$.ajax({
			url: "http://120.55.40.199:80/yyt_app/WebMainServlet",
			type: "POST",
	        data:{"method":"auditWeb","title":title,"suggestion":suggestion,"is_audit":"2"},
	        dataType: "json",
	        success: function(data){
            	if(data.code==0){
               	alert("已进行审核，审核结果为通过");
            	}
            	else{
            		alert("失败");
            		}
       		 }
	     	}); 
		});	
		$(".btcancel").click(function(){
			//var introduce=$("#introduce").val();
			var suggestion=$("#suggestion").val();
			$.ajax({
			url: "http://120.55.40.199:80/yyt_app/WebMainServlet",
			type: "POST",
	        data:{"method":"auditWeb","title":title,"suggestion":suggestion,"is_audit":"1"},
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
	}); 

  </script>
</html>
