$(function(){
    //登陆后鼠标hover名字显示/隐藏按钮
    $(".user").hover(function(){
        $(".after_con").stop(true,true).slideDown(400);
        $(".user").css("background-color","#f5f7f9");
    },function(){
        $(".after_con").stop(true,true).hide();
        $(".user").css("background-color","");
    });
    $(".after_con").hover(function(){
        $(".after_con").stop(true,true).show();
        $(".user").css("background-color","#f5f7f9");
    },function(){
        $(".after_con").stop(true,true).hide();
        $(".user").css("background-color","");
    });
    //footer关注我们微信弹出二维码
    $(".gz-wx").hover(function(){
        $(".ewm").fadeIn();
    },function(){
        t=setTimeout(function(){
            $(".ewm").fadeOut();
        }, 10); 
    });
    $(".ewm").hover(function(){
        clearTimeout(t);
    },function(){
        $(".ewm").fadeOut();
    });
    
    //初始化二级菜单位置
    var l=$(".nav li").length;
    $(".nav li").each(function(){
        var w=$(this).width()-50;
        var i=$(this).index();
        var l=$(this).position().left+150;;
        $(".subnav_con ul").eq(i).css("width",w+"px");
        $(".subnav_con ul").eq(i).css("left",l+"px");
    });
    //二级菜单显示/隐藏
    $(".nav li").each(function(){
        var a=$(this);//一级导航
        var i=a.index();//获取一级导航的位置
        var ul=$(".subnav_con ul");
        var con=$(".subnav_con");
        a.find("a").hover(function(){
            //判断相对的二级导航的display：none？block
            var d=ul.eq(i).css("display");
            if(d=="none"){//二级导航隐藏的时候
                q=setTimeout(function(){//延迟事件
                    var t=ul.eq(i).find("li").text();//判断二级导航的内容
                    if(t!=''){//如果二级导航不为空
                        ul.eq(i).stop(true).show();//二级导航内容显示
                        var ch=ul.eq(i).height()+30;//获取二级导航内容高度
                        con.stop(true).animate({height: ch+'px'},300);//给二级导航容器赋值高度
                    }
                }, 100); 
            }else{
                clearTimeout(w);//二级导航显示状态，清除延迟执行事件w
            }
        },function(){
            clearTimeout(q);//鼠标离开一级导航时，清除延迟事件q
            e=setTimeout(function(){
                ul.stop(true).hide();
                con.stop(true).animate({height: '0'});
            }, 10); 
        });
        ul.eq(i).hover(function(){
            clearTimeout(e);
        },function(){
            w=setTimeout(function(){
                con.stop(true).animate({height: '0'},300);
                ul.stop(true).hide();
            }, 10); 
        });
    });
});
//tab切换
(function($) { 
    $.fn.TabSwitch = function(options) { 
        var opts = $.extend({},$.fn.TabSwitch.defaults,options);
        return this.each(function(){
            var tab = $(this);
            var menu = tab.find(opts.menu);
            var content = tab.find(opts.content);
            menu[opts.type](function(){
                $(this).addClass(opts.classname).siblings().removeClass(opts.classname);
                content.eq($(this).index()).show().siblings().hide();
            });
        });
    }; 

 $.fn.TabSwitch.defaults = { 
        classname: 'active',    //菜单选中样式
        type: 'click',          //菜单切换事件，click/mouseover
        menu: '.btn span',      //菜单单个btn
        content: '.content li'  //内容单个con
    };  
	
	$(".yumingsousuo-b22 input").focus(function(){
		if(this.value=="输入域名，如：300"){
			this.value="";
			this.style.color="#333";
		}
	}).blur(function(){
		if(this.value==""){
			this.style.color="#ccc";
			this.value="输入域名，如：300";
		}
	})

	$(".yumingsousuo-b22-ymxl li").hover(function(){
		this.style.backgroundColor="#f6f6f6";
	},function(){
		this.style.backgroundColor="";
	})

	$("#ymss").click(function(e){
		$(".yumingsousuo-b22-ymxl").css("display","");

		e.stopPropagation();
	})

	$("#ymss").click(function(){
		$(".yumingsousuo-b22-ymxl").css("display","none");
	})

	$(".yumingsousuo-b22-ymxl li").click(function(){
		$(".yumingsousuo-b22-ym").html($(this).html());
	})
	 
})(jQuery);

!function(a){var b=function(){this.init()};b.prototype={init:function(){this.productShow()},productShow:function(){var b=a(".J_productsBox"),c=b.find("li.J_item"),d=function(){var b=a(window).width();return 1200>b?!0:!1};c.hover(function(){var b=a(this),e=d()?190:238,f=d()?410:464;c.not(b).stop().animate({width:e}).removeClass("on"),b.stop().animate({width:f}).addClass("on")}),a(window).resize(function(){c.filter(".on").mouseenter()})}},new b}(jQuery);
	$(function(){
		$("#J_plan_av").delegate("LI", "mouseover", function(){
			$("#J_plan_av > LI").removeClass("action");
			var n = $(this).addClass("action").attr("num");
			$("div.anli-main-plan-cell").hide();
			$("div.anli-main-plan-cell[num='"+n+"']").show();
		})
	});
	$(function(){
		$("#quyudh").delegate("LI", "mouseover", function(){
			$("#quyudh > LI").removeClass("action");
			var n = $(this).addClass("action").attr("num");
			$("ul.dianhua").hide();
			$("ul.dianhua[num='"+n+"']").show();
		})
	});