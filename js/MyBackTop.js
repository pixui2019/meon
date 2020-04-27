$(function() {
	// 悬浮窗口
	$(".My_conct").hover(function() {
		$(".My_conct").css("right", "5px");
		$(".My_bar .My_ercode").css('height', '200px');
	}, function() {
		$(".My_conct").css("right", "-127px");
		$(".My_bar .My_ercode").css('height', '53px');
	});
	// 返回顶部
	$(".My_top").click(function() {
		$("html,body").animate({
			'scrollTop': '0px'
		}, 300)
	});
});


document.writeln("<div class=\'My_conct\'>");
document.writeln("  <div class=\'My_bar\'>");
document.writeln("    <ul>");
document.writeln("      <li class=\'My_top\'>返回顶部</li>");
document.writeln("      <li class=\'My_phone\'>4008-888-888</li>");
document.writeln("      <li class=\'My_QQ\'>");
document.writeln("      	<a target=\'_blank\' href=\'tencent://message/?uin=800010000&Site=www.My.com&Menu=yes\' title=\'即刻发送您的需求\'>在线咨询</a>");
document.writeln("      </li>");
document.writeln("      <li class=\'My_ercode\' style=\'height:53px;\'>微信二维码 <br>");
document.writeln("        <img class=\'hd_qr\' src=\'/images/QRCode.png\' width=\'125\' alt=\'扫码关注我们\'> </li>");
document.writeln("    </ul>");
document.writeln("  </div>");
document.writeln("</div>");
document.writeln("");