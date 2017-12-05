<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
      <title>添加图片广告界面</title>
    <link rel="stylesheet" href="../../resources/css/addimg.css" type="text/css"></link></head>
  <script type="text/javascript" src="../../jquery-1.11.3.min.js"></script>
   <script language=javascript>
        $(function () {
            $(".file").change(function () {
            	var id = $(this).attr("id");
                var file = this.files[0] // 获取input上传的图片数据;
                url = window.URL.createObjectURL(file) // 得到bolb对象路径，可当成普通的文件路径一样使用，赋值给src;
                if (id=="file1") 
                {
                    $(".img1").attr("src", url);
                    $("#file1").css("display","none");
                    $("#file2").css("display","block");
                    $("#file3").css("display","none");
                } else if (id=="file2") 
                {
                    $(".img2").attr("src", url);
                    $("#file1").css("display","none");
                    $("#file2").css("display","none");
                    $("#file3").css("display","block");
                } else if ((id=="file3")) {
                    $(".img3").attr("src", url);
                    $("#file1").css("display","none");
                    $("#file2").css("display","none");
                    $("#file3").css("display","block");
                } else {
                    alert("文件已经选择齐全");
                }
            })
            
            $("#btg1").click(function(){
            	$(".bt1").attr('value','公众号');
            	//alert($(".bt1").attr('value'));
            })
            
            $("#btw1").click(function(){
            	$(".bt1").attr('value','网站');
            	//alert($(".bt1").attr('value'));
            })
            $("#btg2").click(function(){
            	$(".bt2").attr('value','公众号');
            	//alert($(".bt2").attr('value'));
            })
            
            $("#btw2").click(function(){
            	$(".bt2").attr('value','网站');
            	//alert($(".bt2").attr('value'));
            })
            $("#btg3").click(function(){
            	$(".bt3").attr('value','公众号');
            	//alert($(".bt3").attr('value'));
            })
            
            $("#btw3").click(function(){
            	$(".bt3").attr('value','网站');
            	//alert($(".bt3").attr('value'));
            })
        })
</script>
  <body>
  <form action="http://120.55.40.199:80/yyt_app/UploadBannerServlet" enctype="multipart/form-data" method="post">
 <!--  <input type="hidden" name="" value=""> -->
    <div class="maindiv">
       <div class="bodydiv">
          <div class="onediv">
             <div class="cast">
              <img alt="" src="" style="height:100%;width:100%;" class="img1"/>
             </div>
             <div class="title">
                                     跳转类型 : <input type="button" value="公众号" name="type" class="button" id="btg1">
                               <input type="hidden" name="type1" class="bt1">
                   <input type="button" value="网   站" name="type" class="button setcolor" id="btw1">
             </div>
             <div class="input">
                <input type="text" class="textclass" name="link1">
             </div>
          </div>
          <div class="onediv2">
                    <div class="cast">
                     <img alt="" src="" style="height:100%;width:100%;" class="img2">
                    </div>
             <div class="title">
                               跳转类型 :  <input type="button" value="公众号" name="type" class="button " id="btg2">
                               <input type="hidden" name="type2" class="bt2" >
                   <input type="button" value="网   站" name="type" class="button setcolor" id="btw2">
             </div>
             <div class="input">
                <input type="text" class="textclass" name="link2">
             </div>
          </div>
          <div class="onediv">
                    <div class="cast">
                    <img alt="" src="" style="height:100%;width:100%;" class="img3">
                    </div>
             <div class="title">
                                     跳转类型 :  <input type="button" value="公众号" name="type" class="button" id="btg3">
                                     <input type="hidden" name="type3" class="bt3" >
                     <input type="button" value="网   站" name="type" class="button setcolor" id="btw3">
             </div>
             <div class="input">
                <input type="text" class="textclass" name="link3">
             </div>
          </div>
          <div class="onediv2">
                <div class="cast">
                       <input type="file" id="file1" name="img_url1" class="file">
                       <input type="file" id="file2" name="img_url2" class="file" style="display:none;">
                       <input type="file" id="file3" name="img_url3" class="file" style="display:none;">
                </div>
          </div>
       </div>
       
       <div class="bottomdiv">
           <input type="submit" value="提交" class="btcancel setcolor">
       </div> 
    </div>
    </form>
  </body>
</html>
