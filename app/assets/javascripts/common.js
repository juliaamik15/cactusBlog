$(window).scroll(function(){
	var st= $(this).scrollTop();

	$(".header_text").css({
		"transform" : "translate(-180px-50%, "+ st*2 +"%)"
	});
	
});