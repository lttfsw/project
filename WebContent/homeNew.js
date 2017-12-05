$(function () {
    //导航切换
    $(".menuson li").click(function () {
        $(".menuson li").removeClass("liactive")
        $(this).addClass("liactive");
    });

    $('.title').click(function () {
        var $ul = $(this).next('ul');
        $('dd').find('ul').slideUp();
        if ($ul.is(':visible')) {
            $(this).next('ul').slideUp();
        } else {
            $(this).next('ul').slideDown();
        }
    });
    
    $("#nav1").click(function(){
    	$("#1").css("display","display");
    	$("#2").css("display","display");
    	$("#3").css("display","display");
    	$("#4").css("display","none");
    	$("#5").css("display","none");
    	$("#6").css("display","none");
    	$("#7").css("display","none");
    	
    })
     $("#nav2").click(function(){

    	$("#1").css("display","none");
    	$("#2").css("display","none");
    	$("#3").css("display","none");
    	$("#4").css("display","none");
    	$("#5").css("display","none");
    	$("#6").css("display","none");
    	$("#7").css("display","display");
    	
    })
})