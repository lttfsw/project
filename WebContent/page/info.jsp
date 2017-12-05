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
  <form method="post" action="http://120.55.40.199:80/yyt_app/WebMainServlet">
			<input type="text" name="method" value="searchUserWeb" style="display:none">
			<div class="demoTable">
					关键字查询：
					<div class="layui-inline">
						<input class="layui-input" name="keyword" id="demoReload"
							autocomplete="off" style="height:25px;">
					</div>
					 <input type="button" class="layui-btn" lay-filter="*" data-type="reload" value="搜索"
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


				   element.init();
				var urlRootContext = (function() {
					var strPath = window.document.location.pathname;
					var postPath = strPath.substring(0, strPath.substr(1).indexOf('/') + 1);
					return postPath;
				})();
				$(".layui-btn").click(function(){
					var name=$("#demoReload").val();
					table.render({
						id : "demo",
						elem : "#demo",
						url :'http://120.55.40.199:80/yyt_app/WebMainServlet',
						where: {method: 'searchGoodWeb',keyword:name}, //如果无需传递额外参数，可不加该参数
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
									width: 80,
									templet: '#usernameTpl',
									title: '商品名称'
								},
								{
									field: 'store_id',
									width: 180,
									sort: true,
									title: '商家账号'
								},
								{
									field: 'start_date',
									width: 135,
									title: '服务档期开始时间'
								},
								{
									field: 'end_date',
									width: 135,
									sort: true,
									style: 'background-color: #e2e2e2;',
									title: '服务档期结束时间'
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
							where: {method: 'searchAllGoodsWeb'}, //如果无需传递额外参数，可不加该参数
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
									title: '商品名称'
								},
								{
									field: 'store_id',
									width: 80,
									sort: true,
									title: '商家账号'
								},
								{
									field: 'start_date',
									width: 135,
									title: '服务档期开始时间'
								},
								{
									field: 'end_date',
									width: 135,
									sort: true,
									style: 'background-color: #e2e2e2;',
									title: '服务档期结束时间'
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
						var datastring = JSON.stringify(data);
							sessionStorage.setItem("data",datastring);
							parent.layer.open({
							title: '<div style="font-size:x-large"><b>商品信息详情</b></div>',
							type: 2,
							area: ['580px', '600px'],
							fixed: false, //不固定
							maxmin: true,							
							content: urlRootContext + '/view/nav/Goods.html'
							});
						layer.full(index);
					}
					if(layEvent == 'delete') { //删除
					 	parent.layer.confirm('删除之后，该商品记录将从数据库中删除', function(index){
        				obj.del();
        				layer.close(index);
        				$.ajax({
                    		url: "http://120.55.40.199:80/yyt_app/WebMainServlet",
                    		type: "POST",
                    		data:{method: 'deleteGoodByIdWeb',"store_id":data.store_id,"title":data.title},
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
			<a class="layui-btn layui-btn-mini" lay-event="delete">删除</a>
	</script>
  </body>
  
</html>
