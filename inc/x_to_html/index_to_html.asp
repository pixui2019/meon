<!-- #include file="../access.asp" -->
<!-- #include file="../html_clear.asp" -->

<%'容错处理
function index_to_html()
On Error Resume Next
%>
<%
'首页基本信息内容读取替换
set rs=server.createobject("adodb.recordset")
sql="select web_name,web_url,web_image,web_title,web_keywords,web_contact,web_tel,web_TopHTML,web_BottomHTML,web_description,web_copyright,web_theme from web_settings"
rs.open(sql),cn,1,1
if not rs.eof and not rs.bof then
web_name=rs("web_name")
web_url=rs("web_url")
web_image=rs("web_image")
web_title=rs("web_title")
web_keywords=rs("web_keywords")
web_description=rs("web_description")
web_copyright=rs("web_copyright")
web_theme=rs("web_theme")
web_consult=rs("web_contact")
web_TopHTML=rs("web_TopHTML")
web_BottomHTML=rs("web_BottomHTML")
web_tel=rs("web_tel")
end if
rs.close
set rs=nothing
%>
<% '文件夹获取
'搜索文件夹获取
set rs_1=server.createobject("adodb.recordset")
sql="select FileName,FolderName from web_Models_type where [id]=35"
rs_1.open(sql),cn,1,1
if not rs_1.eof and rs_1("FolderName")<>"" then
Search_FolderName="/"&rs_1("FolderName")
end if
rs_1.close
set rs_1=nothing

'案例内容文件夹获取
set rs_1=server.createobject("adodb.recordset")
sql="select FileName,FolderName from web_Models_type where [id]=50"
rs_1.open(sql),cn,1,1
if not rs_1.eof and rs_1("FolderName")<>"" then
CasesContent_FolderName="/"&rs_1("FolderName")
end if
rs_1.close
set rs_1=nothing

'文章内容文件夹获取
set rs_1=server.createobject("adodb.recordset")
sql="select FileName,FolderName from web_Models_type where [id]=5"
rs_1.open(sql),cn,1,1
if not rs_1.eof and rs_1("FolderName")<>"" then
ArticleContent_FolderName="/"&rs_1("FolderName")
end if
rs_1.close
set rs_1=nothing

'产品内容文件夹获取
set rs_1=server.createobject("adodb.recordset")
sql="select FileName,FolderName from web_Models_type where [id]=6"
rs_1.open(sql),cn,1,1
if not rs_1.eof and rs_1("FolderName")<>"" then
ProductContent_FolderName="/"&rs_1("FolderName")
end if
rs_1.close
set rs_1=nothing
%>

<% '读取模板内容
'模板类型获取
set rs_1=server.createobject("adodb.recordset")
sql="select FileName,FolderName from web_Models_type where [id]=1"
rs_1.open(sql),cn,1,1
if not rs_1.eof then
Model_FileName=rs_1("FileName")
if rs_1("FolderName")<>"" then
Model_FolderName="/"&rs_1("FolderName")
end if
end if
rs_1.close
set rs_1=nothing

TemplatePath="/templates/"&web_theme&"/"&Model_FileName
replace_code=ReadFromUTF(TemplatePath,"utf-8") 
%>
<%
replace_code=replace(replace_code,"$web_name$",web_name)
replace_code=replace(replace_code,"$web_url$",web_url)
replace_code=replace(replace_code,"$web_image$",web_image)
replace_code=replace(replace_code,"$web_title$",web_title)
replace_code=replace(replace_code,"$web_keywords$",web_keywords)
replace_code=replace(replace_code,"$web_description$",web_description)
replace_code=replace(replace_code,"$web_copyright$",web_copyright)
replace_code=replace(replace_code,"$web_theme$",web_theme)
replace_code=replace(replace_code,"$web_consult$",web_consult)
replace_code=replace(replace_code,"$web_TopHTML$",web_TopHTML)
replace_code=replace(replace_code,"$web_BottomHTML$",web_BottomHTML)
replace_code=replace(replace_code,"$web_tel$",web_tel)
replace_code=replace(replace_code,"$search_FolderName$",search_FolderName)

'热门关键词
web_HotKeywords=""
set rs=server.createobject("adodb.recordset")
sql="select top 5 [name] from [web_keywords] where hot_yes=1 order by [time] desc"
rs.open(sql),cn,1,1
if not rs.eof then
do while not rs.eof
web_HotKeywords=web_HotKeywords&"<a href='"&Search_FolderName&"/index.asp?q="&rs("name")&"' target='_blank' >"&rs("name")&"</a>"
rs.movenext
loop
else
web_HotKeywords=web_HotKeywords&""
end if
rs.close
set rs=nothing

'顶部导航
web_TopMenu=""
set rs=server.createobject("adodb.recordset")
sql="select id,name,url from web_menu_type where TopNav=1 order by [order]"
rs.open(sql),cn,1,1
if not rs.eof then
web_TopMenu=web_TopMenu&"<ul id='sddm'>"
for i=1 to rs.recordcount
if i=1 then
web_TopMenu=web_TopMenu&"<li class='CurrentLi'><a href='"&rs("url")&"'>"&rs("name")&"</a></li> "
else

set rss=server.createobject("adodb.recordset")
sql="select name,url from web_menu where view_yes=1 and [position]="&rs("id")&" order by [order]"
rss.open(sql),cn,1,1
if not rss.eof then
web_TopMenu=web_TopMenu&"<li><a href='"&rs("url")&"' onmouseover=mopen('m"&i&"') onmouseout='mclosetime()'>"&rs("name")&"</a> "
web_TopMenu=web_TopMenu&"<div id='m"&i&"' onmouseover='mcancelclosetime()' onmouseout='mclosetime()'>"
do while not rss.eof
web_TopMenu=web_TopMenu&"<a href='"&rss("url")&"'>"&rss("name")&"</a> "
rss.movenext
loop
web_TopMenu=web_TopMenu&"</div></li> "
else
web_TopMenu=web_TopMenu&"<li><a href='"&rs("url")&"'>"&rs("name")&"</a></li> "
end if
rss.close
set rss=nothing

end if
rs.movenext
next
web_TopMenu=web_TopMenu&"</ul>"
end if
rs.close
set rs=nothing

replace_code=replace(replace_code,"$web_TopMenu$",web_TopMenu)
replace_code=replace(replace_code,"$web_HotKeywords$",web_HotKeywords)



'首页顶部幻灯广告读取替换
set rs=server.createobject("adodb.recordset")
sql="select top 10 name,url,image,ADcode from web_ads  where [position]=36 and view_yes=1 order by [order]"
rs.open(sql),cn,1,1
if not rs.eof then
for i=1 to rs.recordcount
if rs("adcode")<>"" then
BackAD="background:"&rs("ADcode")&" center 0 no-repeat;"
else
BackAD="background:#FFF center 0 no-repeat;"
end if
web_TopIMGAD=web_TopIMGAD&"<li _src=""url(/images/up_images/"&rs("image")&")"" style='"&BackAD&"'><a href='"&rs("url")&"' target='_blank'></a></li>"

rs.movenext
next
else
web_TopIMGAD=web_TopIMGAD&"无数据"
end if
rs.close
set rs=nothing

replace_code=replace(replace_code,"$web_TopIMGAD$",web_TopIMGAD)



'Banner广告读取1
set rs=server.createobject("adodb.recordset")
sql="select top 1 [id],ADtype,[ADcode] from web_ads  where [position]=37 and view_yes=1 order by [time] desc"
rs.open(sql),cn,1,1
if not rs.eof then
if rs("ADtype")=4 then
Inner_BannerTop1=Inner_BannerTop1&rs("ADcode")
else
Inner_BannerTop1=Inner_BannerTop1&"<script src='/ADs/"&rs("id")&".js' type='text/javascript'></script>"
end if 
else
Inner_BannerTop1=Inner_BannerTop1&""
end if
rs.close
set rs=nothing

'Banner广告读取1
set rs=server.createobject("adodb.recordset")
sql="select top 1 [id],ADtype,[ADcode] from web_ads  where [position]=38 and view_yes=1 order by [time] desc"
rs.open(sql),cn,1,1
if not rs.eof then
if rs("ADtype")=4 then
Inner_BannerTop2=Inner_BannerTop2&rs("ADcode")
else
Inner_BannerTop2=Inner_BannerTop2&"<script src='/ADs/"&rs("id")&".js' type='text/javascript'></script>"
end if 
else
Inner_BannerTop2=Inner_BannerTop2&""
end if
rs.close
set rs=nothing


replace_code=replace(replace_code,"$Inner_BannerTop1$",Inner_BannerTop1)
replace_code=replace(replace_code,"$Inner_BannerTop2$",Inner_BannerTop2)



'企业介绍
set rs=server.createobject("adodb.recordset")
sql="select top 1  [name],[folder],[id],[pid],[ppid],[image],[content] from [category] where ClassType=5 and ppid=1 order by [order]"
rs.open(sql),cn,1,1
if not rs.eof then
ItemID=rs("id")
WebAboutName=rs("name")
WebAboutFolderName=rs("folder")
WebAboutImage=rs("image")
WebAboutContent=left(ClearHtml(rs("content")),250)

select case rs("ppid")
case 1
ClassSQL="cid"
WebAboutFolder="/"&rs("folder") 
case 2
ClassSQL="pid"
set rs0=server.createobject("adodb.recordset")
sql="select [name],[folder],[id],[pid],[ppid] from [category] where id="&rs("pid")
rs0.open(sql),cn,1,1
if not rs0.eof then
WebAboutFolder="/"&rs0("folder")&"/"&rs("folder")
end if
rs0.close
set rs0=nothing
case 3
ClassSQL="ppid"
set rs0=server.createobject("adodb.recordset")
sql="select [name],[folder],[id],[pid],[ppid] from [category] where id="&rs("pid")
rs0.open(sql),cn,1,1
if not rs0.eof then
set rs00=server.createobject("adodb.recordset")
sql="select [name],[folder],[id],[pid],[ppid] from [category] where id="&rs0("pid")
rs00.open(sql),cn,1,1
if not rs00.eof then
WebAboutFolder="/"&rs00("folder")&"/"&rs0("folder")&"/"&rs("folder") 
end if
rs00.close
set rs00=nothing
end if
rs0.close
set rs0=nothing
end select
end if
rs.close
set rs=nothing

replace_code=replace(replace_code,"$WebAboutName$",WebAboutName)
replace_code=replace(replace_code,"$WebAboutFolderName$",WebAboutFolderName)
replace_code=replace(replace_code,"$WebAboutFolder$",WebAboutFolder)
replace_code=replace(replace_code,"$WebAboutImage$",WebAboutImage)
replace_code=replace(replace_code,"$WebAboutContent$",WebAboutContent)



'新闻动态
set rs=server.createobject("adodb.recordset")
sql="select top 1  [name],[folder],[id],[pid],[ppid] from [category] where ClassType=1 and ppid=1 order by [order]"
rs.open(sql),cn,1,1
if not rs.eof then
ItemID=rs("id")
WebNewNewsName=rs("name")
WebNewNewsFolderName=rs("folder")
select case rs("ppid")
case 1
ClassSQL="cid"
WebNewNewsFolder="/"&rs("folder") 
case 2
ClassSQL="pid"
set rs0=server.createobject("adodb.recordset")
sql="select [name],[folder],[id],[pid],[ppid] from [category] where id="&rs("pid")
rs0.open(sql),cn,1,1
if not rs0.eof then
WebNewNewsFolder="/"&rs0("folder")&"/"&rs("folder")
end if
rs0.close
set rs0=nothing
case 3
ClassSQL="ppid"
set rs0=server.createobject("adodb.recordset")
sql="select [name],[folder],[id],[pid],[ppid] from [category] where id="&rs("pid")
rs0.open(sql),cn,1,1
if not rs0.eof then
set rs00=server.createobject("adodb.recordset")
sql="select [name],[folder],[id],[pid],[ppid] from [category] where id="&rs0("pid")
rs00.open(sql),cn,1,1
if not rs00.eof then
WebNewNewsFolder="/"&rs00("folder")&"/"&rs0("folder")&"/"&rs("folder") 
end if
rs00.close
set rs00=nothing
end if
rs0.close
set rs0=nothing
end select
end if
rs.close
set rs=nothing
'content

set rsp=server.createobject("adodb.recordset")
sql="select top 3 [title],file_path,[time],[description],[image] from [article] where ArticleType=1 and cid='"&ItemID&"' and view_yes=1 order by [time] desc"
rsp.open(sql),cn,1,1
if not rsp.eof then
do while not rsp.eof 
rs_url=""
rs_url=ArticleContent_FolderName&"/"&rsp("file_path")

WebNewNewsList=WebNewNewsList&"<ul class='news_n_ul_1'>"
WebNewNewsList=WebNewNewsList&"<a href='"&rs_url&"' target='_blank' ><img src='/images/up_images/"&rsp("image")&"' alt='"&rsp("title")&"' /></a>"
WebNewNewsList=WebNewNewsList&"<h3><a href='"&rs_url&"' target='_blank' >"&left(rsp("title"),18)&"</a></h3>"
WebNewNewsList=WebNewNewsList&"<p>"&left(rsp("description"),47)&"..</p>"
WebNewNewsList=WebNewNewsList&"</ul>"
		 
rsp.movenext
loop
end if 
rsp.close
set rsp=nothing

replace_code=replace(replace_code,"$WebNewNewsName$",WebNewNewsName)
replace_code=replace(replace_code,"$WebNewNewsList$",WebNewNewsList)
replace_code=replace(replace_code,"$WebNewNewsFolder$",WebNewNewsFolder)



'栏目列表
set rs=server.createobject("adodb.recordset")
sql="select  top 3 [name],[folder],[id],[pid],[ppid] from [category] where id<>"&ItemID&" and ClassType=1 and ppid=1 order by [order] "
rs.open(sql),cn,1,1
if not rs.eof then
for i=1 to 3

if i=1 then
WebNewNews2List=WebNewNews2List&"<div class='index_cjwt fl'>"
else
WebNewNews2List=WebNewNews2List&"<div class='index_cjwt mar18 fl'>"
end if
WebNewNews2List=WebNewNews2List&"<div class='tit_1 gsjs_t'><p>"&rs("name")&"</p><a href='/"&rs("Folder")&"' class='more'>+更多</a></div>"
WebNewNews2List=WebNewNews2List&"<div class='clear'></div>"
WebNewNews2List=WebNewNews2List&"<div class='index_cjwt_n'>"

TopID=0
set rsp=server.createobject("adodb.recordset")
sql="select top 1 [id],[title],file_path,[image],description from [article] where ArticleType=1 and cid='"&rs("id")&"' and image<>'' and view_yes=1 order by [time] desc"
rsp.open(sql),cn,1,1
if not rsp.eof then
TopID=rsp("id")
rs_url=""
rs_url=ArticleContent_FolderName&"/"&rsp("file_path")

WebNewNews2List=WebNewNews2List&"<ul class='news_n_ul_1'>"
WebNewNews2List=WebNewNews2List&"<a href='"&rs_url&"' target='_blank'  ><img src='/images/up_images/"&rsp("image")&"' alt='"&rsp("title")&"' /></a>"
WebNewNews2List=WebNewNews2List&"<h3><a href='"&rs_url&"' target='_blank' >"&left(rsp("title"),17)&"</a></h3>"
WebNewNews2List=WebNewNews2List&"<p>"&left(rsp("description"),44)&"..</p>"
WebNewNews2List=WebNewNews2List&"</ul>"

end if 
rsp.close
set rsp=nothing

      
WebNewNews2List=WebNewNews2List&"<ul class='index_news_box'>"
set rsp=server.createobject("adodb.recordset")
sql="select top 6 [title],file_path,time from [article] where ArticleType=1 and cid='"&rs("id")&"' and id<>"&TopID&" and view_yes=1 order by [time] desc"
rsp.open(sql),cn,1,1
if not rsp.eof then
do while not rsp.eof 
rs_url=""
rs_url=ArticleContent_FolderName&"/"&rsp("file_path")

WebNewNews2List=WebNewNews2List&"<li><span>"&year(rsp("time"))&"-"&month(rsp("time"))&"-"&day(rsp("time"))&"</span><a href='"&rs_url&"' target='_blank' >"&left(rsp("title"),20)&"</a></li>"

rsp.movenext
loop
end if 
rsp.close
set rsp=nothing

WebNewNews2List=WebNewNews2List&"</ul>"
WebNewNews2List=WebNewNews2List&"</div>"
WebNewNews2List=WebNewNews2List&"</div>"
rs.movenext
next
end if
rs.close
set rs=nothing

replace_code=replace(replace_code,"$WebNewNews2List$",WebNewNews2List)



'友情链接
set rs=server.createobject("adodb.recordset")
sql="select  [name],[url],[image],follow_yes from [web_link] where view_yes=1 order by [order]"
rs.open(sql),cn,1,1
if not rs.eof then
do while not rs.eof
if rs("follow_yes")=1 then
NoFollow="rel='nofollow'"
else
NoFollow=""
end if 
web_link=web_link&"<a href='"&rs("url")&"' target='_blank' "&NoFollow&">"&rs("name")&"</a>"
rs.movenext
loop
else
web_link=web_link&"暂无链接。"
end if
rs.close
set rs=nothing

replace_code=replace(replace_code,"$web_link$",web_link)



'品牌产品
set rs=server.createobject("adodb.recordset")
sql="select top 1  [name],[folder],[id],[pid],[ppid] from [category] where ClassType=2 and ppid=1 order by [order]"
rs.open(sql),cn,1,1
if not rs.eof then
ItemID=rs("id")
WebProductName=rs("name")
WebProductFolderName=rs("folder")
WebProductFolder="/"&rs("folder")
end if
rs.close
set rs=nothing

set rsl=server.createobject("adodb.recordset")
sql="select [name],[folder],[id],[pid],[ppid] from [category] where pid="&ItemID&" order by [order] "
rsl.open(sql),cn,1,1
if not rsl.eof then
for i=1 to rsl.recordcount

Block_LeftClassList=Block_LeftClassList&"<li>"
Block_LeftClassList=Block_LeftClassList&"<A href='"&WebProductFolder&"/"&rsl("Folder")&"'>"&rsl("name")&" </A> "
Block_LeftClassList=Block_LeftClassList&"</li> "

rsl.movenext
next
else
Block_LeftClassList=Block_LeftClassList&"暂无分类"
end if
rsl.close
set rsl=nothing

'最新产品
set rsp=server.createobject("adodb.recordset")
sql="select top 8 [title],file_path,[image] from [article] where ArticleType=2 and cid='"&ItemID&"' and view_yes=1 order by OrderCount,[time] desc"
rsp.open(sql),cn,1,1
if not rsp.eof then
do while not rsp.eof 
rs_url=""
rs_url=ProductContent_FolderName&"/"&rsp("file_path")

WebProductList=WebProductList&"<li><a class='a_img' href='"&rs_url&"' target='_blank'><img src='/images/up_images/"&rsp("image")&"' alt='"&rsp("title")&"' /></a><span><a href='"&rs_url&"' target='_blank'>"&left(rsp("title"),14)&"</a></span></li>"

rsp.movenext
loop
end if 
rsp.close
set rsp=nothing

'推荐产品
set rsp=server.createobject("adodb.recordset")
sql="select top 30 [title],file_path,[image] from [article] where ArticleType=2 and cid='"&ItemID&"' and index_push=1 and view_yes=1 order by OrderCount,[time] desc"
rsp.open(sql),cn,1,1
if not rsp.eof then
do while not rsp.eof 
rs_url=""
rs_url=ProductContent_FolderName&"/"&rsp("file_path")

WebProductPushList=WebProductPushList&"<li><a  href='"&rs_url&"' target='_blank'><img src='/images/up_images/"&rsp("image")&"' alt='"&rsp("title")&"' /></a><span><a href='"&rs_url&"' target='_blank'>"&left(rsp("title"),14)&"</a></span></li>"

rsp.movenext
loop
end if 
rsp.close
set rsp=nothing

replace_code=replace(replace_code,"$Block_LeftClassList$",Block_LeftClassList)
replace_code=replace(replace_code,"$WebProductName$",WebProductName)
replace_code=replace(replace_code,"$WebProductFolderName$",WebProductFolderName)
replace_code=replace(replace_code,"$WebProductFolder$",WebProductFolder)
replace_code=replace(replace_code,"$WebProductList$",WebProductList)
replace_code=replace(replace_code,"$WebProductPushList$",WebProductPushList)



'案例展示
set rs=server.createobject("adodb.recordset")
sql="select top 1  [name],[folder],[id],[pid],[ppid],image from [category] where  ClassType=3 and ppid=1 order by [order]"
rs.open(sql),cn,1,1
if not rs.eof then
ItemID=rs("id")
WebCaseName=rs("name")
WebCaseFolderName=rs("folder")
WebCaseImage=rs("image")
WebCaseFolder="/"&rs("folder") 
end if
rs.close
set rs=nothing
'list
set rsp=server.createobject("adodb.recordset")
sql="select top 30 [title],file_path,[image],description from [article] where ArticleType=3 and cid='"&ItemID&"' and view_yes=1 order by OrderCount,[time] desc"
rsp.open(sql),cn,1,1
if not rsp.eof then
do while not rsp.eof 
rs_url=""
rs_url=CasesContent_FolderName&"/"&rsp("file_path")

WebCaseList=WebCaseList&"<DIV class='box'><A class='imgBorder'  href='"&rs_url&"' target='_blank' title='"&rsp("title")&"'><IMG alt='"&rsp("title")&"' src='/images/up_images/"&rsp("image")&"' ></a><p><A class='imgBorder'  href='"&rs_url&"' target='_blank' title='"&rsp("title")&"'>"&left(rsp("title"),12)&"</A></p> </DIV>"

rsp.movenext
loop
end if 
rsp.close
set rsp=nothing

replace_code=replace(replace_code,"$WebCaseList$",WebCaseList)
replace_code=replace(replace_code,"$WebCaseName$",WebCaseName)
replace_code=replace(replace_code,"$WebCaseFolderName$",WebCaseFolderName)
replace_code=replace(replace_code,"$WebCaseFolder$",WebCaseFolder)
replace_code=replace(replace_code,"$WebCaseImage$",WebCaseImage)
%>

<% '判断文件夹是否存在，否则创建
Set Fso=Server.CreateObject("Scripting.FileSystemObject") 
If Fso.FolderExists(Server.MapPath(Model_FolderName))=false Then
NewFolderDir=Model_FolderName
call CreateFolderB(NewFolderDir)
end if
%>

<%'声明HTML文件名,指定文件路径
filepath=Model_FolderName&"/index.html"
%>

<% '读取模板
'******************************************
'功能：生成UTF-8文件
'******************************************
mappath =filepath
Set objStream = Server.CreateObject("ADODB.Stream")
With objStream
.Open
.Charset = "utf-8"
.Position = objStream.Size
.WriteText=replace_code
.SaveToFile server.mappath(mappath),2
.Close
End With
Set objStream = Nothing

%>
<%
end function
%>