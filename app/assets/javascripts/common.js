$(window).scroll(function(){
	var st= $(this).scrollTop();
	$(".section_title").css({
		"transform" : "translate(-50%, "+ st*1.5 +"%"

	});
});