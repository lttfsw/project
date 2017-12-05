<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>注册界面</title>
 <style>
        *{padding:0;margin:0}
        .header{width:100%;background-color:#99d5e9;padding-top:100px;padding-bottom:100px;text-align:center;}
        .header p{font-size:75px; color:white}
        
          .content{text-align:center;margin-top:50px}
         .bd{padding-top:50px}
         .bd font{font-size:40px}
         .bd input{font-size:35px;padding:10px;border:1px solid black;outline:none;border-radius:10px}
        .submit{text-align:center;margin-top:200px}
        .submit p{font-size:30px;padding-top:10px}
        .submit img{width:50%}
        .bd{padding-top:50px}
        
         .submit{text-align:center;margin-top:100px}
	         .submit img{width:57%}
	         .submit p{font-size:45px;padding-top:60px}
        </style>
</head>
<body>
<div class="header">
<p>演艺通后台管理系统</p>
</div>

<div class="content">
<form name="form1" method="post" action="../../integrityAlliance">
   
    <div class="bd">
        <font>账&ensp;&ensp;号:</font>
        <input type="text" name="phone">
    </div>
    <div class="bd">
        <font>密&ensp;&ensp;码:</font>
        <input type="text" name="wechat">
    </div>
    
   
      <div class="submit">
			    	<input type="submit" value="注册" style="border-radius:10px;width:400px;height:100px;font-size:53px;background-color:#99d5e9;"></input>
			    	
			    </div>
    </form>
       
</div>

</body>
</html>