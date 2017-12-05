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
  <body>
 
			<div class="demoTable">
					
						<button id = "add" class="layui-btn" data-type="reload"
					style="height:25px;line-height: 25px;background-color: #066cad;">新增</button>
				</div>
   <table id="demo" lay-filter="demo">
   </table>
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
				$("#add").click(function(){
					parent.layer.open({
						title:  '<div style="font-size:x-large"><b>新增管理员</b></div>',
						type: 2,
						area: ['565px', '550px'],
						fixed: false, //不固定
						maxmin: true,							
						content: urlRootContext + '/view/nav/addadmin.html',

					});
					layer.full(index);
				});	
					table.render({
							id: "demo",
							elem: "#demo",
							url :'http://120.55.40.199:80/yyt_app/WebMainServlet',
							where: {method: 'searchAlladminsWeb'}, //如果无需传递额外参数，可不加该参数
							method: 'post' ,//如果无需自定义HTTP类型，可不加该参数
							cols: [
								[

								
								{
									field: 'nickname',
									width: 80,
									templet: '#usernameTpl',
									title: '姓名'
								},
								{
									field: 'sex',
									width: 80,
									sort: true,
									title: '性别'
								},
								/* {
									field: 'role',
									width: 100,
									title: '角色'
								}, */
								{
									field: 'account',
									width: 200,
									title: '账号'
								},
								{
									field: 'status',
									width: 135,
									sort: true,
									style: 'background-color: #e2e2e2;',
									title: '状态'
								},
								{
									field: 'phone',
									width: 200,
									sort: true,
									title: '手机号码'
								},
								{
									field: 'qq',
									width: 150,
									sort: true,
									title: 'QQ号'
								},
								{
									field: 'identity',
									width: 120,
									sort: true,
									title: '身份证'
								},
								{
									field: 'bank',
									width: 120,
									sort: true,
									title: '银行账号'
								},
								{
									field: 'worktime',
									width: 120,
									sort: true,
									title: '工作时间'
								},
								{
									fixed: 'right',
									width: 170,
									align: 'center',
									toolbar: '#barDemo'
								}
								]
							],
							height: 500,
							sort: true,
							/* page: true,
							limits: [10, 20],
							limit: 10 */

						});		
					var checkStatus = table.checkStatus('demo');		
					table.on('tool(demo)', function(obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
					var data = obj.data; //获得当前行数据
					var layEvent = obj.event; //获得 lay-event 对应的值
					var tr = obj.tr; //获得当前行 tr 的DOM对象

					if(layEvent === 'detail') { //查看
						//数据传输
						//把json对象转换成json字符串
						var datastring = JSON.stringify(data);
						//alert(datastring);
						//传json字符串
						sessionStorage.setItem("data",datastring);
						parent.layer.open({
							title:  '<div style="font-size:x-large"><b>员工详情</b></div>',
							type: 2,
							area: ['565px', '550px'],
							fixed: false, //不固定
							maxmin: true,							
							content: urlRootContext + '/view/nav/adminInfo.html',

						});
						layer.full(index);
					}
					
				 if(layEvent == 'del') { //删除
					 //删除商户
					 	alert(data.id);
					 	parent.layer.confirm('删除之后，该管理员无法登录演艺通后台管理系统', function(index){
        				obj.del();
        				layer.close(index);
        				$.ajax({
        				url: "http://120.55.40.199:80/yyt_app/WebMainServlet",
                    	type: "POST",
                    	data:{method: 'deleteUserByIdWeb',"account":data.account,"type":"admin"},
                		dataType: "json",
                		success: function(data){
                    	if(data.code==0){
                       		//删除这一行
                        	obj.del();
                       		//关闭弹框
                        	layer.close(index);
                        	parent.layer.msg("删除成功", {icon: 6});
                    	}
                    	else{
                        		parent.layer.msg("删除失败", {icon: 5});
                    		}
               		 	}

            			});
        			});
				}	
			});		
								
		});
</script>
	<script type="text/html" id="barDemo">
			<a class="layui-btn layui-btn-mini" lay-event="detail">查看</a>
	</script>
  </body>
  
</html>
