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
  <form method="post" action="">
			<!-- <input type="text" name="method" value="searchStoreWeb" style="display:none"> -->
			<div class="demoTable">
					关键字查询：
					<div class="layui-inline">
						<input class="layui-input" name="keyword" id="demoReload"
							autocomplete="off" style="height:25px;">
					</div>
					 <input type="button" id ="input" class="layui-btn" data-type="reload" value="搜索"
						style="height:25px;line-height: 25px;background-color: #066cad;"> 
						
				</div>
			</form>
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
				$("#input").click(function(){
					var name=$("#demoReload").val();
					table.render({
						id : "demo",
						elem : "#demo",
						url :'http://120.55.40.199:80/yyt_app/WebWebMainServlet',
						where: {method: 'searchStoreWeb',keyword:name}, //如果无需传递额外参数，可不加该参数
						method: 'post' ,//如果无需自定义HTTP类型，可不加该参数
						cols : [ [

						/* {
									field: 'id',
									width: 80,
									sort: true,
									title: 'ID'
								}, */
								{
									field: 'title',
									width: 180,
									templet: '#usernameTpl',
									title: '视频主标题'
								},
								{
									field: 'store_id',
									width: 180,
									sort: true,
									title: '商家账号'
								},
								{
									field: 'start_time',
									width: 135,
									sort: true,
									title: '开始时间'
								},
								{
									field: 'end_time',
									width: 135,
									sort: true,
									//style: 'background-color: #e2e2e2;',
									title: '结束时间'
								},
								{
									field: 'is_audit',
									width: 120,
									sort: true,
									title: '是否审核'
								},
								{
									field: 'remark',
									width: 120,
									sort: true,
									title: '备注'
								},
								{
									fixed: 'right',
									width: 170,
									align: 'center',
									toolbar: '#barDemo'
								} ] ],
					     /* page: false, */
						height : 500,
						sort : true,
						
					});
				});
					table.render({
							id: "demo",
							elem: "#demo",
							url :'http://120.55.40.199:80/yyt_app/WebMainServlet',
							where: {method: 'searchAllVideosWeb'}, //如果无需传递额外参数，可不加该参数
							method: 'post' ,//如果无需自定义HTTP类型，可不加该参数
							cols: [
								[

									/* {
									field: 'id',
									width: 80,
									sort: true,
									title: 'ID'
								}, */
								{
									field: 'title',
									width: 80,
									templet: '#usernameTpl',
									title: '视频主标题'
								},
								{
									field: 'store_id',
									width: 80,
									sort: true,
									title: '商家账号'
								},
								{
									field: 'start_time',
									width: 135,
									sort: true,
									title: '开始时间'
								},
								{
									field: 'end_time',
									width: 135,
									sort: true,
									//style: 'background-color: #e2e2e2;',
									title: '结束时间'
								},
								{
									field: 'is_audit',
									width: 120,
									sort: true,
									title: '是否审核'
								},
								{
									field: 'remark',
									width: 120,
									sort: true,
									title: '备注'
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
							title:  '<div style="font-size:x-large"><b>视频秀详情</b></div>',
							type: 2,
							area: ['565px', '550px'],
							fixed: false, //不固定
							maxmin: true,							
							content: urlRootContext + '/view/nav/video.jsp',

						});
						layer.full(index);
					}	
			});		
								
		});
</script>
	<script type="text/html" id="barDemo">
			<a class="layui-btn layui-btn-mini" lay-event="detail">查看</a>
	</script>
  </body>
  
</html>
