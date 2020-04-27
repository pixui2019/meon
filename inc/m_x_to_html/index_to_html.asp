<!-- #include file="../access.asp" -->
<!-- #include file="../html_clear.asp" -->

<%'容错处理
function index_to_html()
On Error Resume Next
%>
<%
'首页基本信息内容读取替换
set rs=server.createobject("adodb.recordset")
sql="select web_name,web_url,web_image,web_title,web_keywords,web_contact,web_tel,web_TopHTML,web_BottomHTML,web_description,web_copyright,web_theme from mobile_web_settings"
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
sql="select FileName,FolderName from mobile_web_Models_type where [id]=35"
rs_1.open(sql),cn,1,1
if not rs_1.eof and rs_1("FolderName")<>"" then
Search_FolderName="/"&web_Folder&"/"&rs_1("FolderName")
end if
rs_1.close
set rs_1=nothing

'案例内容文件夹获取
set rs_1=server.createobject("adodb.recordset")
sql="select FileName,FolderName from mobile_web_Models_type where [id]=50"
rs_1.open(sql),cn,1,1
if not rs_1.eof and rs_1("FolderName")<>"" then
CasesContent_FolderName="/"&web_Folder&"/"&rs_1("FolderName")
end if
rs_1.close
set rs_1=nothing

'文章内容文件夹获取
set rs_1=server.createobject("adodb.recordset")
sql="select FileName,FolderName from mobile_web_Models_type where [id]=5"
rs_1.open(sql),cn,1,1
if not rs_1.eof and rs_1("FolderName")<>"" then
ArticleContent_FolderName="/"&web_Folder&"/"&rs_1("FolderName")
end if
rs_1.close
set rs_1=nothing

'产品内容文件夹获取
set rs_1=server.createobject("adodb.recordset")
sql="select FileName,FolderName from mobile_web_Models_type where [id]=6"
rs_1.open(sql),cn,1,1
if not rs_1.eof and rs_1("FolderName")<>"" then
ProductContent_FolderName="/"&web_Folder&"/"&rs_1("FolderName")
end if
rs_1.close
set rs_1=nothing
%>

<% '读取模板内容
'模板类型获取
set rs_1=server.createobject("adodb.recordset")
sql="select FileName,FolderName from mobile_web_Models_type where [id]=1"
rs_1.open(sql),cn,1,1
if not rs_1.eof then
Model_FileName=rs_1("FileName")
if rs_1("FolderName")<>"" then
Model_FolderName="/"&rs_1("FolderName")
end if
end if
rs_1.close
set rs_1=nothing

TemplatePath="/templates/MobileTemplet/"&Model_FileName
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

'其它导航
web_OtherMenu=""
set rs=server.createobject("adodb.recordset")
sql="select [name],[url],[image] from mobile_web_menu_type where OtherNav=1 order by [Order]"
rs.open(sql),cn,1,1
if not rs.eof then
for i=1 to rs.recordcount

web_OtherMenu=web_OtherMenu&"<li > <a href='"&rs("url")&"'><img src='/images/up_images/"&rs("image")&"' alt='"&rs("name")&"'><label>"&rs("name")&"</label></a></li>"

rs.movenext
next
end if
rs.close
set rs=nothing

'底部导航
web_BottomMenu=""
set rs=server.createobject("adodb.recordset")
sql="select [name],[url],[image] from mobile_web_menu_type where BottomNav=1 order by [order]"
rs.open(sql),cn,1,1
if not rs.eof then
for i=1 to rs.recordcount
if i=3 then
web_BottomMenu=web_BottomMenu&"<li class=""home""><a onclick=""javascript:displayit(3)""></a></li>"
web_BottomMenu=web_BottomMenu&"<ul id=""MyMenu_list3"" class=""MyMenu_font"" style="" display:none"">"
web_BottomMenu=web_BottomMenu&web_OtherMenu
web_BottomMenu=web_BottomMenu&"</ul>"
web_BottomMenu=web_BottomMenu&""
end if
web_BottomMenu=web_BottomMenu&"<li><a href="""&rs("url")&""">"
web_BottomMenu=web_BottomMenu&"<img src='/images/up_images/"&rs("image")&"' alt='"&rs("name")&"'><label>"&rs("name")&"</label></a> </li>"

rs.movenext
next
end if
rs.close
set rs=nothing

'顶部导航
web_TopMenu=""
set rs=server.createobject("adodb.recordset")
sql="select [url],[name] from mobile_web_menu_type where TopNav=1 order by [order]"
rs.open(sql),cn,1,1
if not rs.eof then
for i=1 to rs.recordcount
web_TopMenu=web_TopMenu&"<li> "
web_TopMenu=web_TopMenu&"<a href='"&rs("url")&"'>"&rs("name")&"</a> "
web_TopMenu=web_TopMenu&"</li> "

rs.movenext
next
end if
rs.close
set rs=nothing


replace_code=replace(replace_code,"$web_TopMenu$",web_TopMenu)
replace_code=replace(replace_code,"$web_BottomMenu$",web_BottomMenu)
replace_code=replace(replace_code,"$web_OtherMenu$",web_OtherMenu)



'首页顶部幻灯广告读取替换
set rs=server.createobject("adodb.recordset")
sql="select name,url,image,ADcode from mobile_web_ads  where [position]=36 and view_yes=1 order by [order]"
rs.open(sql),cn,1,1
if not rs.eof then
for i=1 to rs.recordcount

web_TopIMGAD=web_TopIMGAD&"<li><a href='"&rs("url")&"' target='_blank'><img src='/images/up_images/"&rs("image")&"' alt='"&rs("name")&"'></a><p class='caption'>"&rs("name")&"</p></li>"

rs.movenext
next
else
web_TopIMGAD=web_TopIMGAD&"No Data."
end if
rs.close
set rs=nothing

replace_code=replace(replace_code,"$web_TopIMGAD$",web_TopIMGAD)


'企业介绍
set rs=server.createobject("adodb.recordset")
sql="select top 1  [name],[folder],[id],[pid],[ppid],[image],[content] from [category] where ClassType=5 and ppid=1 order by [order]"
rs.open(sql),cn,1,1
if not rs.eof then
ItemID=rs("id")
WebAboutName=rs("name")
WebAboutFolderName=rs("folder")
'WebAboutImage=rs("image")
WebAboutContent=left(ClearHtml(rs("content")),72)

select case rs("ppid")
case 1
ClassSQL="cid"
WebAboutFolder="/"&web_Folder&"/"&rs("folder") 
case 2
ClassSQL="pid"
set rs0=server.createobject("adodb.recordset")
sql="select [name],[folder],[id],[pid],[ppid] from [category] where id="&rs("pid")
rs0.open(sql),cn,1,1
if not rs0.eof then
WebAboutFolder="/"&web_Folder&"/"&rs0("folder")&"/"&rs("folder")
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
WebAboutFolder="/"&web_Folder&"/"&rs00("folder")&"/"&rs0("folder")&"/"&rs("folder") 
end if
rs00.close
set rs00=nothing
end if
rs0.close
set rs0=nothing
end select

WebAboutImage="<a href='"&WebAboutFolder&"'><img src='/images/up_images/"&rs("image")&"' alt='"&WebAboutName&"' width='100%'></a>"

end if
rs.close
set rs=nothing

replace_code=replace(replace_code,"$WebAboutName$",WebAboutName)
replace_code=replace(replace_code,"$WebAboutFolderName$",WebAboutFolderName)
replace_code=replace(replace_code,"$WebAboutFolder$",WebAboutFolder)
replace_code=replace(replace_code,"$WebAboutImage$",WebAboutImage)
replace_code=replace(replace_code,"$WebAboutContent$",WebAboutContent)



'业务范围
set rs=server.createobject("adodb.recordset")
sql="select top 1  [folder],[id],name from [category] where ClassType=5 and id<>"&ItemID&" and ppid=1 order by [order]"
rs.open(sql),cn,1,1
if not rs.eof then
ItemID=rs("id")
WebItemFolder="/"&web_Folder&"/"&rs("folder")
WebItemName=rs("name")
end if
rs.close 
set rs=nothing

set rs=server.createobject("adodb.recordset")
sql="select top 10 [name],[folder],[id],[content],[image] from [category] where pid="&ItemID&" and ClassType=5 and ppid=2 order by [order] "
rs.open(sql),cn,1,1
if not rs.eof then
for i=1 to rs.recordcount

WebItemList=WebItemList&"<div class='ItemBlock'>"
WebItemList=WebItemList&"<div class='ItemInner'>"
WebItemList=WebItemList&"<div class='ItemImg'><a href='"&WebItemFolder&"/"&rs("folder")&"/' target='_blank'><img src='/images/up_images/"&rs("image")&"' alt='"&rs("name")&"'></a></div>"
WebItemList=WebItemList&"<h1><a href='"&WebItemFolder&"/"&rs("folder")&"/'>"&left(rs("name"),10)&"</a></h1>"
WebItemList=WebItemList&"</div></div>"

rs.movenext
next
end if
rs.close 
set rs=nothing

replace_code=replace(replace_code,"$WebItemList$",WebItemList)
replace_code=replace(replace_code,"$WebItemFolder$",WebItemFolder)
replace_code=replace(replace_code,"$WebItemName$",WebItemName)



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
WebNewNewsFolder="/"&web_Folder&"/"&rs("folder") 
case 2
ClassSQL="pid"
set rs0=server.createobject("adodb.recordset")
sql="select [name],[folder],[id],[pid],[ppid] from [category] where id="&rs("pid")
rs0.open(sql),cn,1,1
if not rs0.eof then
WebNewNewsFolder="/"&web_Folder&"/"&rs0("folder")&"/"&rs("folder")
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
WebNewNewsFolder="/"&web_Folder&"/"&rs00("folder")&"/"&rs0("folder")&"/"&rs("folder") 
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

set rs=server.createobject("adodb.recordset")
sql="select [name],[folder],[id],[pid],[ppid] from [category] where pid="&ItemID&" and ClassType=1 and ppid=2 order by [order] "
rs.open(sql),cn,1,1
if not rs.eof then
for i=1 to rs.recordcount
WebNewNewsTitles=WebNewNewsTitles&"<li>"&rs("name")&"</li> "

WebNewNewsList=WebNewNewsList&"<li>"
WebNewNewsList=WebNewNewsList&"<div class='ArticleList'>"
set rsp=server.createobject("adodb.recordset")
sql="select top 5 [title],file_path,[time],[description],[image] from [article] where ArticleType=1 and cid='"&ItemID&"' and pid='"&rs("id")&"' and view_yes=1 order by [time] desc"
rsp.open(sql),cn,1,1
if not rsp.eof then
do while not rsp.eof 
rs_url=""
rs_url=ArticleContent_FolderName&"/"&rsp("file_path")
RSImage=""
if rsp("image")<>"" then
RSImage=rsp("image")
else
RSImage="nophoto.jpg"
end if
WebNewNewsList=WebNewNewsList&"<div class='NewsLi'><div class='NewsLiLeft'> <p>"
WebNewNewsList=WebNewNewsList&"<a href='"&rs_url&"' target='_blank'><img src='/images/up_images/"&RSImage&"'  alt='"&rsp("title")&"'></a></p></div>"
WebNewNewsList=WebNewNewsList&"<div class='NewsLiRight'>"
WebNewNewsList=WebNewNewsList&"<div class='NewsLiTitle'><a href='"&rs_url&"' target='_blank' title='"&rsp("title")&"'>"&left(rsp("title"),29)&"</a></div>"
WebNewNewsList=WebNewNewsList&"<p>"&left(ClearHtml(rsp("description")),30)&"...</p></div>"
WebNewNewsList=WebNewNewsList&"<div class='clearfix'></div></div>"

rsp.movenext
loop
end if 
rsp.close
set rsp=nothing

WebNewNewsList=WebNewNewsList&"<div class='clearfix'></div></div></li>"
rs.movenext
next
end if
rs.close
set rs=nothing

replace_code=replace(replace_code,"$WebNewNewsTitles$",WebNewNewsTitles)
replace_code=replace(replace_code,"$WebNewNewsList$",WebNewNewsList)
replace_code=replace(replace_code,"$WebNewNewsFolder$",WebNewNewsFolder)


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
web_link=web_link&"No Links."
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
WebProductFolder="/"&web_Folder&"/"&rs("folder")
end if
rs.close
set rs=nothing

'class
set rs=server.createobject("adodb.recordset")
sql="select  [name],[folder],[id],[pid],[ppid] from [category] where pid="&ItemID&" and ClassType=2 order by [order] "
rs.open(sql),cn,1,1
if not rs.eof then
for i=1 to rs.recordcount
Block03_LeftItem_Title=Block03_LeftItem_Title&"<div class='DivLi'><A href='"&WebProductFolder&"/"&rs("Folder")&"'>"&rs("name")&"</A></div> "

rs.movenext
next
end if
rs.close
set rs=nothing

'content
set rsp=server.createobject("adodb.recordset")
sql="select top 30 [title],file_path,[image],description from [article] where ArticleType=2 and cid='"&ItemID&"' and view_yes=1 order by [OrderCount],[time] desc"
rsp.open(sql),cn,1,1
if not rsp.eof then
do while not rsp.eof 
rs_url=""
rs_url=ProductContent_FolderName&"/"&rsp("file_path")

if rsp("image")<>"" then
RSImage=rsp("image")
else
RSImage="nophoto.jpg"
end if
Block03_LeftItem=Block03_LeftItem&"<li><div class='NewsLi'><div class='NewsLiLeft2'> <p>"
Block03_LeftItem=Block03_LeftItem&"<a href='"&rs_url&"' target='_blank'><img src='/images/up_images/"&RSImage&"'  alt='"&rsp("title")&"'></a></p></div>"
Block03_LeftItem=Block03_LeftItem&"<div class='NewsLiRight'>"
Block03_LeftItem=Block03_LeftItem&"<div class='NewsLiTitle'><a href='"&rs_url&"' target='_blank' title='"&rsp("title")&"'>"&left(rsp("title"),29)&"</a></div>"
Block03_LeftItem=Block03_LeftItem&"<p>"&left(ClearHtml(rsp("description")),30)&"...</p></div>"
Block03_LeftItem=Block03_LeftItem&"<div class='clearfix'></div></div> </li> "

rsp.movenext
loop
end if 
rsp.close
set rsp=nothing

'推荐产品
set rsp=server.createobject("adodb.recordset")
sql="select top 10 [title],file_path,description,[image] from [article] where ArticleType=2 and cid='"&ItemID&"' and view_yes=1 and index_push=1 order by [OrderCount],[time] desc"
rsp.open(sql),cn,1,1
if not rsp.eof then
do while not rsp.eof 
rs_url=""
rs_url=ProductContent_FolderName&"/"&rsp("file_path")

WebProductList=WebProductList&"<li><table width='100%' border='0' cellspacing='0' cellpadding='0'>"
WebProductList=WebProductList&"<tr>"
WebProductList=WebProductList&"<td width='50%'><a href='"&rs_url&"' target='_blank' title='"&rsp("title")&"'><img src='/images/up_images/"&rsp("image")&"' alt='"&rsp("title")&"' width='130' height='130' /></a></td>"
WebProductList=WebProductList&"<td width='50%'><h4><a href='"&rs_url&"' target='_blank' title='"&rsp("title")&"'>"&left(rsp("title"),10)&"</a></h4>"
WebProductList=WebProductList&"<p>"&left(ClearHtml(rsp("description")),47)&"...</p></td>"
WebProductList=WebProductList&"</tr>"
WebProductList=WebProductList&"</table>"
WebProductList=WebProductList&"</li>"

rsp.movenext
loop
else
WebProductList=WebProductList&"<li>暂无推荐产品。</li>"
end if 
rsp.close
set rsp=nothing

replace_code=replace(replace_code,"$Block03_LeftItem$",Block03_LeftItem)
replace_code=replace(replace_code,"$Block03_LeftItem_Title$",Block03_LeftItem_Title)
replace_code=replace(replace_code,"$WebProductList$",WebProductList)
replace_code=replace(replace_code,"$WebProductName$",WebProductName)
replace_code=replace(replace_code,"$WebProductFolderName$",WebProductFolderName)
replace_code=replace(replace_code,"$WebProductFolder$",WebProductFolder)



'案例展示
set rs=server.createobject("adodb.recordset")
sql="select top 1  [name],[folder],[id],[pid],[ppid] from [category] where ClassType=3 and ppid=1 order by [order]"
rs.open(sql),cn,1,1
if not rs.eof then
ItemID=rs("id")
WebCaseName=rs("name")
WebCaseFolderName=rs("folder")
WebCaseFolder="/"&web_Folder&"/"&rs("folder")
end if
rs.close
set rs=nothing

'class
set rs=server.createobject("adodb.recordset")
sql="select  [name],[folder],[id],[pid],[ppid] from [category] where pid="&ItemID&" and ClassType=3 order by [order] "
rs.open(sql),cn,1,1
if not rs.eof then
for i=1 to rs.recordcount
WebCase_Title=WebCase_Title&"<div class='DivLi'><A href='"&WebCaseFolderName&"/"&rs("Folder")&"'>"&rs("name")&"</A></div> "

rs.movenext
next
end if
rs.close
set rs=nothing

'content
set rsp=server.createobject("adodb.recordset")
sql="select top 5 [title],file_path,[image],description from [article] where ArticleType=3 and cid='"&ItemID&"' and view_yes=1 order by [OrderCount],[time] desc"
rsp.open(sql),cn,1,1
if not rsp.eof then
do while not rsp.eof 
rs_url=""
rs_url=CasesContent_FolderName&"/"&rsp("file_path")

if rsp("image")<>"" then
RSImage=rsp("image")
else
RSImage="nophoto.jpg"
end if
WebCase_List=WebCase_List&"<div class='NewsLi'><div class='NewsLiLeft'> <p>"
WebCase_List=WebCase_List&"<a href='"&rs_url&"' target='_blank'><img src='/images/up_images/"&RSImage&"'  alt='"&rsp("title")&"'></a></p></div>"
WebCase_List=WebCase_List&"<div class='NewsLiRight'>"
WebCase_List=WebCase_List&"<div class='NewsLiTitle'><a href='"&rs_url&"' target='_blank' title='"&rsp("title")&"'>"&left(rsp("title"),29)&"</a></div>"
WebCase_List=WebCase_List&"<p>"&left(ClearHtml(rsp("description")),30)&"...</p></div>"
WebCase_List=WebCase_List&"<div class='clearfix'></div></div>"

rsp.movenext
loop
end if 
rsp.close
set rsp=nothing

replace_code=replace(replace_code,"$WebCase_List$",WebCase_List)
replace_code=replace(replace_code,"$WebCase_Title$",WebCase_Title)
replace_code=replace(replace_code,"$WebCaseName$",WebCaseName)
replace_code=replace(replace_code,"$WebCaseFolderName$",WebCaseFolderName)
replace_code=replace(replace_code,"$WebCaseFolder$",WebCaseFolder)
%>

<% '判断文件夹是否存在，否则创建
Set Fso=Server.CreateObject("Scripting.FileSystemObject") 
If Fso.FolderExists(Server.MapPath(Model_FolderName))=false Then
NewFolderDir=Model_FolderName
call CreateFolderB(NewFolderDir)
end if
%>

<%'声明HTML文件名,指定文件路径
filepath="/"&web_Folder&"/index.html"
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