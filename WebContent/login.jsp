<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>欢迎登录后台管理系统</title>

<link rel="stylesheet" href="{pageContext.request.contextPath}/resources/css/login.css" type="text/css"></link>

<script type="text/javascript" src="{pageContext.request.contextPath}/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="{pageContext.request.contextPath}/resources/js/cloud.js"></script>
<link rel="stylesheet" href="resources/css/login.css" type="text/css"></link>
<script type="text/javascript" src="jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="resources/js/cloud.js"></script>
<script language="javascript">
	$(function(){
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
	$(window).resize(function(){  
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
    });
    
   $(function(){
      $(".loginbtn").click(function(){
      var username = $(".loginuser").val();
      var userpass = $(".loginpwd").val();
      if((username.length!=11)||(userpass.length<6))
      {
         alert("信息输入不完整，请重新输入！");
         return;
      }
      
            $.ajax
           (
                {
                    type: "post",
                    url:"http://120.55.40.199:80/yyt_app/WebMainServlet",
                    data:{"method":"loginWeb","account":username,"password":userpass,"type":"admin"},
                    dataType: "json",
                     success: function(mydata) 
                    {
                        if(mydata.code==0)
                        {
                        	window.location.href='${pageContext.request.contextPath }/view/homepage.html';
                        }
                        if(mydata.code==1)
                        {
                        	alert("输入不正确，请重新输入！");
                        }
                    },
                    error: function(mydata) 
                    {
                        alert("失败"+mydata.data[0][0]);
                    } 
                 	
                 });
      })
   })
});  
</script> 


</head>

<body style="background-color:#1c77ac; background-image:url({pageContext.request.contextPath}/resources/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">



    <div id="mainBody">
      <div id="cloud1" class="cloud"></div>
      <div id="cloud2" class="cloud"></div>
    </div>  


<div class="logintop">    
    <span>欢迎登录后台管理界面平台</span>     
    </div>
    
    <div class="loginbody">
    
    <span class="systemlogo"></span> 
       
    <div class="loginbox">
    
    <ul>
    <li><input name="" type="text" class="loginuser"  /></li>
    <li><input name="" type="text" class="loginpwd" /></li>
    <li><input name="" type="button" class="loginbtn" value="登录"  onclick="javascript:"  /><label id="reset"><a href="/shop/view/nav/modify.html" >重置密码</a></label></li>
    </ul>
    
    
    </div>
    
    </div>
    
    <script type="text/javascript">
      $(function(){
    	  $("#reset").click(function(){
    		  var name = $(".loginuser").val();
    		  sessionStorage.setItem("data",name);
    	  })
      })
    </script>
    
    <div class="loginbm">演艺通版权所有</div>
	
    
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>
