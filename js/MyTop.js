document.writeln("<div id=\"MyBackTop_item\">");
document.writeln("        <a id=\"MyBackTop\" onclick=\"return false;\" title=\"返回顶部\"></a>");
document.writeln("        <a class=\"qr\"></a>");
document.writeln("  	<div class=\"qr-popup\">");
document.writeln("    	<a class=\"code-link\"><img class=\"code\" src=\"/images/QRCode.png\" width=\'150\' height=\'150\' alt=\'QRCode\'/></a>");
document.writeln("        <span>微信扫一扫 关注我们</span>");
document.writeln("    <div class=\"arr\"></div>");
document.writeln("  </div>");
document.writeln("  ");
document.writeln("</div>");
document.writeln("");

$(function() {
	$(window).scroll(function(){
		var scrolltop=$(this).scrollTop();		
		if(scrolltop>=200){		
			$("#MyBackTop_item").show();
		}else{
			$("#MyBackTop_item").hide();
		}
	});		
	$("#MyBackTop").click(function(){
		$("html,body").animate({scrollTop: 0}, 500);	
	});		
	$(".qr").hover(function(){
		$(".qr-popup").show();
	},function(){
		$(".qr-popup").hide();
	});	
});
