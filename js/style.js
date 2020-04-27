$(function(){
	$(".s_nav ul li").hover(function () {
	    var _index = $(this).index(),
	        dataheight = $(".smenu .nav_con .slide" + _index).attr("data-height");
	        $(this).addClass("hov").siblings("hov").removeClass("hov");
	    $(".smenu .nav_con .slide").stop().animate({ height: 0 }, 500)
	    $(".smenu .nav_con .slide" + _index).stop().animate({ height: dataheight }, 500);
	    $(".smenu .nav_con").stop().animate({ height: dataheight }, 500);
	}, function () {
		$(this).removeClass('hov')
	    $(".smenu .nav_con .slide").hover(function () {
	    	var _index=$(this).index()
	        var dataheight = $(this).attr("data-height");
	        $(".s_nav li").eq(_index).addClass("hov")
	        $(".smenu .nav_con .slide").stop().animate({ height: 0 }, 500)
	        $(this).stop().animate({ height: dataheight }, 500);
	        $(".smenu .nav_con").stop().animate({ height: dataheight }, 500);
	        return false;
	    }, function () {
	        $(".smenu .nav_con .slide").stop().animate({ height: 0 }, 500);
	        $(".smenu .nav_con").stop().animate({ height: 0 }, 500);
	        $(".s_nav li").removeClass("hov")
	    })
	    $(".smenu .nav_con .slide").stop().animate({ height: 0 }, 500);
	    $(".smenu .nav_con").stop().animate({ height: 0 }, 500);
	})
	$(".smenu .nav_con .slide").each(function () {
	    $(this).attr("data-height", $(this).outerHeight(true));
	})
	$(".gy .sup .list li").mouseover(function() {
		$(this).addClass('active')
	})
	$(".gy .sup .list li").mouseout(function() {
		$(this).removeClass('active')
	});
	$(".news .list li").mouseover(function() {
		$(this).addClass('active')
	})
	$(".news .list li").mouseout(function() {
		$(this).removeClass('active')
	});
	$(".cu .list td").hover(function(){
		$(this).addClass("active")
	},function(){
		$(this).removeClass("active")
	})
	var h=$(".hf .cf .bot .right").outerHeight()
	$(".hf .cf .bot .left").height(h)
	$(".index .js li").mouseover(function(){
		$(".index .js li").removeClass('active')
		$(this).addClass('active')
	})
	$(".index .firm .list .img2").mouseover(function(){
		$(this).addClass('del')
	})
	$(".index .firm .list .img2").mouseout(function(){
		$(this).removeClass('del')
	});
	$(".hf .list li").mouseover(function(){
		$(this).addClass('bl')
	})
	$(".hf .list li").mouseout(function(){
		$(this).removeClass('bl')
	});
	$(".index .al .list li .img").mouseover(function(){
		$(this).addClass('active')
	})
	$(".index .al .list li .img").mouseout(function(){
		$(this).removeClass('active')
	})
	$(".index .vid .list li").mouseover(function(){
		$(".index .vid .list li").removeClass('active')
		$(this).addClass('active')
	})
	$(".mer .list li").mouseover(function(){
		$(this).addClass('active')
	})
	$(".mer .list li").mouseout(function(){
		$(this).removeClass('active')
	});
	$(".design .cust li").mouseover(function(){
		$(this).addClass('active')
	})
	$(".design .cust li").mouseout(function(){
		$(this).removeClass('active')
	});
	$(".design .pro li").mouseover(function(){
		$(this).addClass('active')
	})
	$(".design .pro li").mouseout(function(){
		$(this).removeClass('active')
	});
	$(".design .case li").mouseover(function(){
		$(this).addClass('bl')
	});
	$(".design .case li").mouseout(function(){
		$(this).removeClass('bl')
	})
	$(".qyjs .pro li").mouseover(function(){
		$(this).addClass('active')
	})
	$(".qyjs .pro li").mouseout(function(){
		$(this).removeClass('active')
	});
	$(".qyjs .sys li").mouseover(function(){
		$(this).addClass('active')
	});
	$(".qyjs .sys li").mouseout(function(){
		$(this).removeClass('active')
	});
	$(".hyxh .fun .right td").mouseover(function(){
		$(this).addClass('active')
	});
	$(".hyxh .fun .right td").mouseout(function(){
		$(this).removeClass('active')
	})
	$(".dsdp li").hover(function() {
		$(this).addClass('active')
	}, function() {
		$(this).removeClass('active')
	});
	$(".gxdz .sol li").mouseover(function(){
		$(this).addClass('active')
	});
	$(".gxdz .sol li").mouseout(function(){
		$(this).removeClass('active')
	})
	$(".mhjj .fun td .inner").mouseover(function(){
		$(this).addClass('active')
	});
	$(".mhjj .fun td .inner").mouseout(function(){
		$(this).removeClass('active')
	})
	$(".ppwz .plan li").mouseover(function(){
		$(this).addClass('active')
	});
	$(".ppwz .plan li").mouseout(function(){
		$(this).removeClass('active')
	})
	$(".ppwz .pro li").mouseover(function(){
		$(this).addClass('active')
	});
	$(".ppwz .pro li").mouseout(function(){
		$(this).removeClass('active')
	})
	$(".cert li").mouseover(function(){
		$(this).addClass('active')
	});
	$(".cert li").mouseout(function(){
		$(this).removeClass('active')
	})
	$(".design .ser li").hover(function(){
		$(this).addClass('active')
	},function(){
		$(this).removeClass('active')
	});

	$(".index .js .sort").mouseover(function(){
		$(this).addClass('on')
	});
	$(".index .js .sort").mouseout(function(){
		$(this).removeClass('on')
	})
	$(".website .view li").mouseover(function(){
		$(this).addClass('active')
	});
	$(".website .view li").mouseout(function(){
		$(this).removeClass('active')
	});
	$(".website .mar li").mouseover(function(){
		$(this).addClass('active')
	});
	$(".website .mar li").mouseout(function(){
		$(this).removeClass('active')
	})
	$(".website .str li").mouseover(function(){
		$(this).addClass('active')
	});
	$(".website .str li").mouseout(function(){
		$(this).removeClass('active')
	});
	$(".website .ens li").mouseover(function(){
		$(this).addClass('active')
	});
	$(".website .ens li").mouseout(function(){
		$(this).removeClass('active')
	});
	$(".modu .sort").mouseover(function(){
		$(this).addClass('active')
	});
	$(".modu .sort").mouseout(function(){
		$(this).removeClass('active')
	})
	$(".super .li_con .li_tit").mouseover(function(){
		$(this).addClass('active')
	});
	$(".super .li_con .li_tit").mouseout(function(){
		$(this).removeClass('active')
	});
	$(".super .li_con .li_txt").mouseover(function(){
		$(this).addClass('active')
	});
	$(".super .li_con .li_txt").mouseout(function(){
		$(this).removeClass('active')
	});
	$(".jzlc .wz li").mouseover(function(){
		$(this).addClass('active')
	});
	$(".jzlc .wz li").mouseout(function(){
		$(this).removeClass('active')
	});
	$(".jzlc .list li").mouseover(function(){
		$(this).addClass('active')
	});
	$(".jzlc .list li").mouseout(function(){
		$(this).removeClass('active')
	});
	$(".website .why li").mouseover(function(){
		$(this).addClass('active')
	});
	$(".website .why li").mouseout(function(){
		$(this).removeClass('active')
	});
	$(".website .pro li").mouseover(function(){
		$(this).addClass('active')
	});
	$(".website .pro li").mouseout(function(){
		$(this).removeClass('active')
	})
	$(".gwsc .web td").mouseover(function(){
		$(this).addClass('active')
	})
	$(".gwsc .web td").mouseout(function(){
		$(this).removeClass('active')
	});
	$(".gwsc .str td .inner").mouseover(function(){
		$(this).addClass('active')
	});
	$(".gwsc .str td .inner").mouseout(function(){
		$(this).removeClass('active')
	});
	$(".gwsc .ys .left li").mouseover(function(){
		$(this).addClass('active')
	});
	$(".gwsc .ys .left li").mouseout(function(){
		$(this).removeClass('active')
	});
	$(".weix .uses li").hover(function(){
		$(".weix .uses li").removeClass('active')
		$(this).addClass('active')
	});
	$(".weix .case .con").hover(function() {
		$(this).addClass('active')
	}, function() {
		$(this).removeClass('active')
	});
	$(".res .cont li").hover(function() {
		$(this).addClass('active')
	}, function() {
		$(this).removeClass('active')
	});
	$(".gwsc .ys .right li").hover(function() {
		$(this).addClass('active')
	}, function() {
		$(this).removeClass('active')
	});
	$(".gxdz .cont li").hover(function() {
		$(this).addClass('active')
	}, function() {
		$(this).removeClass('active')
	});
	
	$(".top .list li").hover(function() {
		$(this).addClass('active')
	}, function() {
		$(this).removeClass('active')
	});	


	var htm=$('#img_ul').html();
	$('#img_ul').append(htm);
	var lenth = $('#img_ul>li').length;
	for(var i=0;i<lenth/2;i++){
		$('<li></li>').appendTo('#qiuye_i');
	}
	//初始化
	function qiuye_resize() {
		var liw = $('.banner_box').width();	
		var lenth = $('#img_ul>li').length;
		$('#img_ul>li').width(liw);//动态设置li的宽度
		$('#img_ul').width(liw * lenth);//动态设置ul的宽度	
	}
	var i = 0;
	qiuye_resize();
	//改变窗口修正初始化
	window.onresize = function() {
		qiuye_resize();
		qiuye_bo();
	}//改变窗口大小的时候会触发这个事件
			
	var liw = $('.banner_box').width();	
	
	
	/*-----------------------轮播主函数-----------------------*/
	function qiuye_bo() {
		if (i >= lenth) {
				$('#img_ul').css('left',(-liw*lenth/2+liw)+'px');
				i = lenth/2;
				///console.log(i);
			}
			else if(i<0){
				$('#img_ul').css('left',(-liw*lenth/2)+'px');
				i=lenth/2-1;
		}
		
		
		$('#img_ul').stop().animate({'left': -liw * i},500);
		$('#img_ul>li').eq(i).addClass('active').siblings().removeClass('active');
		$('#qiuye_i li').eq(i<lenth/2?i:i-lenth/2).addClass('on').siblings().removeClass('on');//焦点
		i++;
		
		//document.title=i;//修改title标签的内容，应该可以去掉
	}
	qiuye_bo();
	var qiuye_interval = setInterval(qiuye_bo, 5000);//设置定时器开始轮播
	
	//焦点点击事件
	$('#qiuye_i li').click(function() {
		clearInterval(qiuye_interval);
		i = $(this).index();
		qiuye_bo();
		//qiuye_interval = setInterval(qiuye_bo, 5000);
	})
	
	//鼠标移入移出事件		
	$('.banner_box').hover(function(){
		clearInterval(qiuye_interval);
		},function(){
		qiuye_interval = setInterval(qiuye_bo, 5000);	
	})
	$(window).scroll(function(){
		var whd=$(window).scrollTop()
	})
	
	$(".ffk").click(function(event) {
	$('html,body').stop().animate({scrollTop: '0px'}, 800);
});
	
}) 