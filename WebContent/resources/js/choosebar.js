$(function(){
	var url1="";
	$(".lid").click(function(){
		alert("点击");
		if($(this).index()==0);
		{
			url1 = urlRootContext + "/resources/json/test.json";
		}
		if($(this).index()==1)
		{
			url1 = "http://120.55.40.199/demo/test?callback=?";
		}
			 table.render({
					id: "demo",
					elem: "#demo",
					method:'GET',
					url:url1,
					contentType:"application/x-www-urlencoded",
					cols: [
						[

							{
							field: 'id',
							width: 100,
							sort: true,
							title: 'ID'
						},
						{
							field: 'username',
							width: 150,
							templet: '#usernameTpl',
							title: '名称'
						}
						]
					],
					height: 200,
					sort: true,

				});	
				
				  table.render({
					id: "demo2",
					elem: "#demo2",
					method:'GET',
					url: url1,
					contentType:"application/x-www-urlencoded",
					cols: [
						[

							{
							field: 'id',
							width: 100,
							sort: true,
							title: 'ID'
						},
						{
							field: 'username',
							width: 150,
							templet: '#usernameTpl',
							title: '名称'
						}
						]
					],
					height: 300,
					sort: true,
				});	
	})
})