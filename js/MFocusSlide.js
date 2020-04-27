/*! http://responsiveslides.com v1.54 by @viljamis */
(function(c,I,B){c.fn.responsiveSlides=function(l){var a=c.extend({auto:!0,speed:500,timeout:4E3,pager:!1,nav:!1,random:!1,pause:!1,pauseControls:!0,prevText:"Previous",nextText:"Next",maxwidth:"",navContainer:"",manualControls:"",namespace:"rslides",before:c.noop,after:c.noop},l);return this.each(function(){B++;var f=c(this),s,r,t,m,p,q,n=0,e=f.children(),C=e.size(),h=parseFloat(a.speed),D=parseFloat(a.timeout),u=parseFloat(a.maxwidth),g=a.namespace,d=g+B,E=g+"_nav "+d+"_nav",v=g+"_here",j=d+"_on",
w=d+"_s",k=c("<ul class='"+g+"_tabs "+d+"_tabs' />"),x={"float":"left",position:"relative",opacity:1,zIndex:2},y={"float":"none",position:"absolute",opacity:0,zIndex:1},F=function(){var b=(document.body||document.documentElement).style,a="transition";if("string"===typeof b[a])return!0;s=["Moz","Webkit","Khtml","O","ms"];var a=a.charAt(0).toUpperCase()+a.substr(1),c;for(c=0;c<s.length;c++)if("string"===typeof b[s[c]+a])return!0;return!1}(),z=function(b){a.before(b);F?(e.removeClass(j).css(y).eq(b).addClass(j).css(x),
n=b,setTimeout(function(){a.after(b)},h)):e.stop().fadeOut(h,function(){c(this).removeClass(j).css(y).css("opacity",1)}).eq(b).fadeIn(h,function(){c(this).addClass(j).css(x);a.after(b);n=b})};a.random&&(e.sort(function(){return Math.round(Math.random())-0.5}),f.empty().append(e));e.each(function(a){this.id=w+a});f.addClass(g+" "+d);l&&l.maxwidth&&f.css("max-width",u);e.hide().css(y).eq(0).addClass(j).css(x).show();F&&e.show().css({"-webkit-transition":"opacity "+h+"ms ease-in-out","-moz-transition":"opacity "+
h+"ms ease-in-out","-o-transition":"opacity "+h+"ms ease-in-out",transition:"opacity "+h+"ms ease-in-out"});if(1<e.size()){if(D<h+100)return;if(a.pager&&!a.manualControls){var A=[];e.each(function(a){a+=1;A+="<li><a href='#' class='"+w+a+"'>"+a+"</a></li>"});k.append(A);l.navContainer?c(a.navContainer).append(k):f.after(k)}a.manualControls&&(k=c(a.manualControls),k.addClass(g+"_tabs "+d+"_tabs"));(a.pager||a.manualControls)&&k.find("li").each(function(a){c(this).addClass(w+(a+1))});if(a.pager||a.manualControls)q=
k.find("a"),r=function(a){q.closest("li").removeClass(v).eq(a).addClass(v)};a.auto&&(t=function(){p=setInterval(function(){e.stop(!0,!0);var b=n+1<C?n+1:0;(a.pager||a.manualControls)&&r(b);z(b)},D)},t());m=function(){a.auto&&(clearInterval(p),t())};a.pause&&f.hover(function(){clearInterval(p)},function(){m()});if(a.pager||a.manualControls)q.bind("click",function(b){b.preventDefault();a.pauseControls||m();b=q.index(this);n===b||c("."+j).queue("fx").length||(r(b),z(b))}).eq(0).closest("li").addClass(v),
a.pauseControls&&q.hover(function(){clearInterval(p)},function(){m()});if(a.nav){g="<a href='#' class='"+E+" prev'>"+a.prevText+"</a><a href='#' class='"+E+" next'>"+a.nextText+"</a>";l.navContainer?c(a.navContainer).append(g):f.after(g);var d=c("."+d+"_nav"),G=d.filter(".prev");d.bind("click",function(b){b.preventDefault();b=c("."+j);if(!b.queue("fx").length){var d=e.index(b);b=d-1;d=d+1<C?n+1:0;z(c(this)[0]===G[0]?b:d);if(a.pager||a.manualControls)r(c(this)[0]===G[0]?b:d);a.pauseControls||m()}});
a.pauseControls&&d.hover(function(){clearInterval(p)},function(){m()})}}if("undefined"===typeof document.body.style.maxWidth&&l.maxwidth){var H=function(){f.css("width","100%");f.width()>u&&f.css("width",u)};H();c(I).bind("resize",function(){H()})}})}})(jQuery,this,0);



/*News Tab*/
var fgm = {
	$: function(id) {
		return typeof id === "object" ? id : document.getElementById(id);
	},
	$$: function(tagName, oParent) {
		return (oParent || document).getElementsByTagName(tagName);
	},
	$$$: function(className, element, tagName) {
		var i = 0, aClass = [], reClass = new RegExp("(^|\\s)" + className + "(\\s|$)"), aElement = fgm.$$(tagName || "*", element || document);
		for (i = 0; i < aElement.length; i++) reClass.test(aElement[i].className) && aClass.push(aElement[i]);
		return aClass;
	},
	index: function(element) {
		var aChildren = element.parentNode.children, i;
		for(i = 0; i < aChildren.length; i++) if(aChildren[i] === element) return i;
		return -1;
	},
	on: function(element, type, handler) {
		return element.addEventListener ? element.addEventListener(type, handler, !1) : element.attachEvent("on" + type, handler);
	},
	bind: function(object, handler) {
		return function() {
			return handler.apply(object, arguments);
		};
	}
};
function TabMy(id) {
	this.obj = fgm.$(id);
	this.oTab = fgm.$$$("MyTab", this.obj)[0];
	this.aTab = fgm.$$("li", this.oTab);
	this.oSwitch = fgm.$$$("switchBtn", this.oTab)[0];
	this.oPrev = fgm.$$("a", this.oSwitch)[0];
	this.oNext = fgm.$$("a", this.oSwitch)[1];
	this.aItems = fgm.$$$("items", this.obj);
	this.iNow = 0;
	fgm.on(this.oSwitch, "click", fgm.bind(this, this.fnClick));
	fgm.on(this.oTab, "click", fgm.bind(this, this.fnMouseOver));
}
TabMy.prototype = {
	fnMouseOver: function(ev) {
		var oEv = ev || event,
		oTarget = oEv.target || oEv.srcElement;
		oTarget.tagName.toUpperCase() === "LI" && (this.iNow = fgm.index(oTarget));
		this.fnSwitch();
	},
	fnClick: function(ev) {
		var oEv = ev || event,
		oTarget = oEv.target || oEv.srcElement,
		i;
		switch(fgm.index(oTarget)) {
			case 0:
				if(oTarget.className == "prev") {
					this.aTab[this.iNow].style.display = "block";
					this.iNow--;
				};
				break;
			case 1:
				if(oTarget.className == "next") {
					for(i = 0; i < this.iNow; i++) this.aTab[i].style.display = "none";
					this.iNow++;
				};
				break;
		};
		this.aTab[this.iNow].style.display = "block";
		this.fnSwitch();
	},
	fnSwitch: function() {
		for(var i = 0; i < this.aTab.length; i++) (this.aTab[i].className = "", this.aItems[i].style.display = "none");
		this.aTab[this.iNow].className = "current";
		this.aItems[this.iNow].style.display = "block";
		this.oPrev.className = this.iNow == 0 ? "prevNot" : "prev";
		this.oNext.className = this.iNow == this.aTab.length - 1 ? "nextNot" : "next";
	}
};
//应用
fgm.on(window, "load", function() {
	var aItem = fgm.$$$("item"),
	i = 0;
	for(; i < aItem.length; i++) new TabMy(aItem[i]);
});

