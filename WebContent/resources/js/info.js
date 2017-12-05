$(function(){
	
	$(".menu").click(function(){
		var index=$(this).index();
		$(".menu").removeClass("active");
		$(this).addClass("active");
		
		$(".infoPageCon").hide();
		$(".infoPageCon").eq(index).show();
	})
	var input = document.getElementById('account');
	//console.log(str);
	//input.setAttribute('value', getElement(account));
	
})
