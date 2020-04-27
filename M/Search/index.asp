<%@ LANGUAGE=VBScript CodePage=65001%>
<% response.charset="utf-8" %>
<% session.codepage=65001 %><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes" />
<meta content="initial-scale=1.0,user-scalable=no,maximum-scale=1" media="(device-height: 568px)" name="viewport" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta content="telephone=no" name="format-detection" />
<meta http-equiv="X-UA-Compatible" content="IE=7">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- #include file="../../inc/AntiAttack.asp" -->
<!-- #include file="../../inc/conn.asp" -->
<!-- #include file="../../inc/web_config.asp" -->
<!-- #include file="../../inc/html_clear.asp" -->
<%
search_q=request.querystring("q")
%>
<title>搜索：<%=search_q%>_企业网站管理系统手机版</title>
<meta name="keywords" content="搜索" />
<meta name="description" content="搜索" />
<link href="/css/MyCMSLoad/Minner.css" rel="stylesheet" type="text/css" />
<link href="/css/MyCMSLoad/Mcommon.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/mfunctions.js"></script>
<script type="text/javascript" src="/js/jquery.flexslider.js"></script>
<script type="text/javascript" src="/js/iscroll.js"></script>
<script type="text/javascript" src="/js/jquery.drawer.min.js"></script>
<script type="text/javascript">
	window.addEventListener("load",function() {
	// Set a timeout...
	setTimeout(function(){
	// Hide the address bar!
	window.scrollTo(0, 1);
	}, 0);
	});
</script>
<script type="text/javascript">
	var $ = jQuery.noConflict();
	$(window).load(function() {
		$('.icons_nav').flexslider({
			animation: "slide",
			directionNav: true, 
			animationLoop: false,
			controlNav: false, 
			slideshow: false,
			animationDuration: 300
		});
	});
</script>
<script type="text/javascript" src="/images/iepng/iepngfix_tilebg.js"></script>
<script type="text/javascript">
window.onerror=function(){return true;}
</script>
</head>

<body class="drawer drawer-left">
<!-- Nav Stsrt -->
<div class="drawer-main drawer-default">
  <nav class="drawer-nav" role="navigation">
    <div class="drawer-brand">
      <a href="/">网站导航 MENU</a>
    </div>
    <ul class="drawer-nav-list">
<li> <a href='/M/'>网站首页</a> </li> <li> <a href='/M/About/'>关于公司</a> </li> <li> <a href='/M/News/'>新闻动态</a> </li> <li> <a href='/M/Product/'>公司产品</a> </li> <li> <a href='/M/Case/'>案例展示</a> </li> <li> <a href='/M/Recruit/'>人才招聘</a> </li> <li> <a href='/M/Support/'>技术支持</a> </li> <li> <a href='/M/Contact/'>联系我们</a> </li> 
    </ul>
 
  </nav>
</div>
<script>
	$(document).ready(function(){
	$('.drawer').drawer();
	$('.js-trigger').click(function(){
	  $('.drawer').drawer("open");
	});
	});
</script> 
<div class="clearfix"></div>
<!-- Nav End -->
<%
keywords=split(search_q," ")
c=ubound(keywords)
for i=0 to c
if i=0 then
search_sql1=search_sql1&"where  ( [title] like '%"&keywords(i)&"%'"
keywords_all=keywords(i)
else
search_sql1=search_sql1&" or   [title] like '%"&keywords(i)&"%'"
keywords_all=keywords_all&"+"&keywords(i)
end if
next

s_sql="select [title],[content],[file_path],[time],ArticleType from [article] "&search_sql1&" )  and view_yes=1 and ArticleType=2 order by [time] desc"
%>
<!--head start-->
<div id="head">

<!--top start -->
<div class="top">

<div class="TopLogo">
<div class="logo"><a href="/"><img src="/images/up_images/logom.png" alt="企业网站管理系统手机版"></a></div>
<div class='MyQuick'> <div class="drawer-toggle drawer-hamberger"><span></span></div> </div>

<div class="clearfix"></div>
</div>
<div class="clearfix"></div>
</div>
<!--top end-->
<div class="clearfix"></div>
</div>
<!--head end-->
<div id="wrapper">
<!--body start-->
<div id="body">
<!--inner start -->
<div class="inner">
<!--left start-->
<div class="left">
<div class="Sbox">
<div class="topic">搜索</div>
</div>
<div class="clearfix"></div>
 
</div>
<!--left end-->
<!--right start-->
<div class="right">
<div class="Position"><span>你的位置：<a href="/">首页</a> > 搜索</span></div>
<div class=" clearfix"></div>
<!--main start-->
<div class="main">

<div class="content">
<!--search content start-->
<div id="search_content" class="clearfix">

<%
if search_q<>"" then 

set rs=server.createobject("adodb.recordset")
rs.open(s_sql),cn,1,1
%>

<%'=============分页定义开始，要放在数据库打开之后
if err.number<>0 then '错误处理
response.write "数据库操作失败：" & err.description
err.clear
else
if not (rs.eof and rs.bof) then '检测记录集是否为空
r=cint(rs.RecordCount) '记录总数
rowcount = 10 '设置每一页的数据记录数，可根据实际自定义
rs.pagesize = rowcount '分页记录集每页显示记录数
maxpagecount=rs.pagecount '分页页数
page=request.querystring("page")
  if page="" then
  page=1
  end if
rs.absolutepage = page 
rcount1=0
pagestart=page-5
pageend=page+5
if pagestart<1 then
pagestart=1
end if
if pageend>maxpagecount then
pageend=maxpagecount
end if
rcount=rs.RecordCount
'=============分页定义结束%>

<!--position start-->
<div class="searchtip">您正在搜索“<span class="FontRed"><%=search_q%></span>”,找到相关信息 <span class="font_brown"><%=rcount%></span> 条</div>
<!--position end-->
<!--list start-->
<div class="result_list">
<div class="gray">提示：用空格隔开多个搜寻关键词可获取更理想结果，如“最新 产品”。</div>
<dl>

<%'===========循环体开始
do while not rs.eof and rowcount%>
<%
select case rs("ArticleType")
case 1
Content_FolderName=Article_FolderName
case 2
Content_FolderName=Product_FolderName
case 3
Content_FolderName=Case_FolderName
end select

title1=left(rs("title"),30)
for i=0 to c
title1=Replace(title1, keywords(i), "<span class='FontRed'>" & keywords(i)& "</span>")
next

content1=left(nohtml(rs("content")),110)
for i=0 to c
content1=Replace(content1,keywords(i), "<span class='FontRed'>" & keywords(i)& "</span>")
next
%>
<dt ><a href='<%="/"&Content_FolderName&"/"&rs("file_path")%>' target='_blank' title='<%=rs("title")%>'><%=title1%></a></dt>
<dd><%=content1%>...</dd>
<dd class="font12 arial font_green line"><a href='<%="/"&Content_FolderName&"/"&rs("file_path")%>' target='_blank'><span class="font_green"><%=web_url&"/"&Content_FolderName&"/"&rs("file_path")%></span></a><%=year(rs("time"))%>-<%=month(rs("time"))%>-<%=day(rs("time"))%></dd>
<%
rowcount=rowcount-1 
rs.movenext
loop
 '===========循环体结束%>

</dl>
</div>
<!--list end-->

<!--page start-->
<div class="result_page clearfix">
<!--#include file="../../inc/page_list.asp"-->
</div>
<!--page end-->

<%
else
response.write "<div class='search_welcome'>很抱歉,没有找到与 <span class='FontRed'>"&search_q&"</span> 相关的信息！<p >提示：用空格隔开多个搜寻关键词可获取更理想结果，如“最新 产品”。</p></div>"
end if
end if
end if%>
</div>
<!--search content end-->	
<div class="clearfix"></div>
</div>

</div>
<!--main end-->
</div>
<!--right end-->
</div>
<!--inner end-->
<div class="HeightTab clearfix"></div>
</div>
<!--body end-->
<div class="clearfix"></div>
<!--footer start-->
<div id="footer">
<div class="SearchTop">
<div class="SearchBar">
<form method="get" action="/M/Search/index.asp">
				<input type="text" name="q" id="search-text" size="15" onBlur="if(this.value=='') this.value='请输入关键词';" 
onfocus="if(this.value=='请输入关键词') this.value='';" value="请输入关键词" /><input type="submit" id="search-submit" value=" " />
			</form>
</div>
</div>
<div class="inner">
<div class='InnerLeft'>
<p><a href="/m/">网站首页</a> | <a href="/m/About">关于我们</a> | <a href="/m/Recruit">人才招聘</a>  | <a href="/m/Sitemap">网站地图</a></p>
<p>Copyright 2028 企业网站管理系统手机版 版权所有 All Rights Reserved </p>
</div>


<div class='clearfix'></div>
</div>
</div>
<!--footer end -->


<!--MyBar start-->
<div class="top_bar" style="-webkit-transform:translate3d(0,0,0)">
  <nav>

    <ul id="top_MyMenu" class="top_MyMenu">

  <li><a href="/M/"><img src='/images/up_images/m_my_icon6.png' alt='首页'><label>首页</label></a> </li><li><a href="tel:400800888"><img src='/images/up_images/m_my_icon1.png' alt='电话'><label>电话</label></a> </li><li class="home"><a onclick="javascript:displayit(3)"></a></li><ul id="MyMenu_list3" class="MyMenu_font" style=" display:none"><li > <a href='/M/Product/'><img src='/images/up_images/plugmenu19.png' alt='留言反馈'><label>留言反馈</label></a></li></ul><li><a href="mailto:admin@qq.com"><img src='/images/up_images/m_my_icon2.png' alt='邮件'><label>邮件</label></a> </li><li><a href="/M/FeedBack/"><img src='/images/up_images/m_my_icon5.png' alt='留言'><label>留言</label></a> </li>

                       </ul>

  </nav>

</div>
<div id="plug-wrap" onclick="closeall()" style="display: none;"></div> 
<!--MyBar end-->
</div>


</body>
</html>