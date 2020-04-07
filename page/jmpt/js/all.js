// JavaScript Document

//首页文字无缝向上滚动
jQuery("#txtMarqueeTop").slide({ mainCell:"ul",autoPlay:true,effect:"topMarquee",interTime:70,vis:5  });

//最新作品
jQuery(".zp-gd").slide({ mainCell:"ul",autoPlay:true,effect:"leftMarquee",interTime:50,vis:4  });

$("a#example2").fancybox({
				'overlayShow'	: false,
				'transitionIn'	: 'elastic',
				'transitionOut'	: 'elastic',
				'overlayShow'	: true,
			});