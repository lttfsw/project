<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <link rel="stylesheet" href="../resources/css/layui.css">
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<link rel="stylesheet" href="../homeNew.css" />
  <script src="../resources/js/closable-tab-div.js"></script>
	<script src="../resources/js/jquery-3.1.1.min.js"></script>
	<script src="../resources/layui.js"></script>
	<script src="../resources/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="../resources/js/bootstrap.min.js"></script></head>
  <style>
.lid {
	text-indent: 8px;
	margin-right: 5px;
}

.lid:hover {
	cursor: pointer;
}
</style>
  <body>
   <table id="demo" lay-filter="demo">
   <div id="tableshow">
				<ul class="layui-nav "
					style="height:30px;line-height:30px;padding:0px;margin-top:3px;background-color:#066Cad;">
					<li class="layui-nav-item lid"
						style="height:30px;line-height:30px;">演艺经纪</li>
					<li class="layui-nav-item lid"
						style="height:30px;line-height:30px;">舞台设备</li>
					<li class="layui-nav-item lid"
						style="height:30px;line-height:30px;">套餐服务</li>
				</ul>
			</div>
   </table>
   			<div id="demo2div">
					<table id="demo2" lay-lay-filter="demo">

					</table>
				</div>
   <!--动态生成tab-->
	<script src="../resources/js/closable-tab-div.js"></script>
	<script src="../resources/js/jquery-3.1.1.min.js"></script>
	<!--引入layui-->
	<script src="../resources/layui.js"></script>
	<!-- <script src="../resources/js/closable-tab-div.js"></script> -->
	<script src="../resources/js/bootstrap.min.js"></script>
  <script>
   	layui.use(['layer', 'laydate', 'table', 'element'], function() {
				var layer = layui.layer,
					laydate = layui.laydate,
					table = layui.table,
					form = layui.form;
					element = layui.element;
/*****************************************************************/

/****************************************************************/

				   element.init();
				var urlRootContext = (function() {
					var strPath = window.document.location.pathname;
					var postPath = strPath.substring(0, strPath.substr(1).indexOf('/') + 1);
					return postPath;
				})();
				
					table.render({
							id: "demo",
							elem: "#demo",
							url :'http://120.55.40.199:80/yyt_app/WebMainServlet',
							where: {method: 'searchCatelogue2Web',"keyword":"1"}, //如果无需传递额外参数，可不加该参数
							method: 'post' ,//如果无需自定义HTTP类型，可不加该参数
							cols: [
								[

									{
									field: 'id',
									width: 100,
									sort: true,
									title: 'ID'
								},
								{
									field: 'name',
									width: 150,
									templet: '#usernameTpl',
									title: '名称'
								},
								{
									fixed: 'right',
									width: 170,
									align: 'center',
									toolbar: '#barDemo'
								}
								]
							],
							height: 200,
							sort: true,

						});	
						$(".lid").click(function(){
 						var url1="http://120.55.40.199:80/yyt_app/WebMainServlet";
 						var value="1";
  						 if($(this).index()==0)
   						{
      						url1="http://120.55.40.199:80/yyt_app/WebMainServlet";
     						
   						}
   						if($(this).index()==1)
   						{
     						 url1="http://120.55.40.199:80/yyt_app/WebMainServlet";
     						 value ="2";
   						}
   						if($(this).index()==2)
   						{
      						url1="http://120.55.40.199:80/yyt_app/WebMainServlet";
      						value ="3";
   						}
   
           				$("#tableshow").show();
						$("#demo2div").show();
						table.render({
							id: "demo",
							elem: "#demo",
							url :'http://120.55.40.199:80/yyt_app/WebMainServlet',
							where: {method: 'searchCatelogue2Web',"keyword":value}, //如果无需传递额外参数，可不加该参数
							method: 'post' ,//如果无需自定义HTTP类型，可不加该参数
							cols: [
								[

									{
									field: 'id',
									width: 100,
									sort: true,
									title: 'ID'
								},
								{
									field: 'name',
									width: 150,
									templet: '#usernameTpl',
									title: '名称'
								},
								{
									fixed: 'right',
									width: 170,
									align: 'center',
									toolbar: '#barDemo'
								}
								]
							],
							height: 300,
							sort: true,
						});	
					var checkStatus = table.checkStatus('demo');		
					table.on('tool(demo)', function(obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
					var data = obj.data; //获得当前行数据
					var layEvent = obj.event; //获得 lay-event 对应的值
					var tr = obj.tr; //获得当前行 tr 的DOM对象

					if(layEvent == 'search')
					{
					   //取得主键id;
					   //ajax发送请求到后台数据库
					   //得到数据在三级菜单标题显示
					   /**********三级菜单重新显示************/
					   //数据传输
						//把json对象转换成json字符串
						var datastring = JSON.stringify(data);
						//alert(datastring);
						//传json字符串
						sessionStorage.setItem("data",datastring);
						//alert(data.name);
					    table.render({
							id: "demo2",
							elem: "#demo2",
							url :'http://120.55.40.199:80/yyt_app/WebMainServlet',
							where: {"method":'searchCatelogue3Web',"keyword":data.id}, //如果无需传递额外参数，可不加该参数
							method: 'post' ,//如果无需自定义HTTP类型，可不加该参数                                          
							cols: [
								[

									{
									field: 'id',
									width: 100,
									sort: true,
									title: 'ID'
								},
								{
									field: 'name',
									width: 150,
									templet: '#usernameTpl',
									title: '名称'
								}
								]
							],
							height: 300,
							sort: true,
						});	        
					}
						
			});		
		});					
		});
</script>
	<script type="text/html" id="barDemo">
			<a class="layui-btn layui-btn-mini" lay-event="search">查看子菜单</a>
	</script>
  </body>
  
</html>
