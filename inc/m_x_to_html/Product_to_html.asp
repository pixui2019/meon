<!-- #include file="../html_clear.asp" -->

<%'容错处理
function Product_to_html(a_id)
On Error Resume Next
%>
<!--common use start-->
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

<% 
'搜索文件夹获取
set rs_1=server.createobject("adodb.recordset")
sql="select FileName,FolderName from mobile_web_Models_type where [id]=35"
rs_1.open(sql),cn,1,1
if not rs_1.eof and rs_1("FolderName")<>"" then
Search_FolderName="/"&web_Folder&"/"&rs_1("FolderName")
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

'模板类型获取
set rs_1=server.createobject("adodb.recordset")
sql="select FileName,FolderName from mobile_web_Models_type where [id]=6"
rs_1.open(sql),cn,1,1
if not rs_1.eof then
Model_FileName=rs_1("FileName")
if rs_1("FolderName")<>"" then
Model_FolderName="/"&web_Folder&"/"&rs_1("FolderName")
ProductContent_FolderName="/"&web_Folder&"/"&rs_1("FolderName")
end if
end if
rs_1.close
set rs_1=nothing
%><%
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

'顶部文字读取
set rs=server.createobject("adodb.recordset")
sql="select top 1 [id],ADtype,[ADcode] from mobile_web_ads  where [position]=37 and view_yes=1 order by [time] desc"
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

'顶部广告读取
set rs=server.createobject("adodb.recordset")
sql="select top 1 [id],ADtype,[ADcode] from mobile_web_ads  where [position]=35 and view_yes=1 order by [time] desc"
rs.open(sql),cn,1,1
if not rs.eof then
if rs("ADtype")=4 then
Inner_BannerTop=Inner_BannerTop&rs("ADcode")
else
Inner_BannerTop=Inner_BannerTop&"<script src='/ADs/"&rs("id")&".js' type='text/javascript'></script>"
end if 
else
Inner_BannerTop=Inner_BannerTop&""
end if
rs.close
set rs=nothing
%>
<!--common use end-->


<% ' 文章内容读取替换
set rs=server.createobject("adodb.recordset")
sql="select * from [article] where [id]="&a_id&" and view_yes=1"
rs.open(sql),cn,1,1
if not rs.eof then
article_title=rs("title")
ArticleContent=rs("content")
article_keywords=rs("keywords")
article_description=rs("description")
article_short=left(rs("description"),100)&"..."
article_from_url=rs("from_url")
article_time=rs("time")
article_from_name=rs("from_name")
article_time=rs("edit_time")
article_count=rs("comment")
article_date=rs("SalePrice")
article_place=rs("SaleCount")
article_wine=rs("wine")
article_net=rs("net")
Article_FilePath=rs("file_path")
article_url=ProductContent_FolderName&"/"&rs("file_path")
if rs("image")<>"" then
article_image=rs("image")
else
article_image="nophoto.jpg"
end if

set rso=server.createobject("adodb.recordset")
sql="select id from [web_order] where [article_id]="&a_id&" "
rso.open(sql),cn,1,1
OrderCount=rso.recordcount
rso.close
set rso=nothing

'您现在的位置读取替换
set rs_0=server.createobject("adodb.recordset")
sql="select [id],[pid],[ppid],[name],[folder] from [category] where [id]="&rs("cid")&" and ppid=1"
rs_0.open(sql),cn,1,1
folder_name=rs_0("folder")
CategoryName=rs_0("name")
ClassName1=rs_0("name")
ClassFolder1=rs_0("folder")
ClassID=rs_0("id")
if rs("pid")<>"" then
set rs_1=server.createobject("adodb.recordset")
sql="select [id],[pid],[ppid],[name],[folder] from [category] where [id]="&rs("pid")&" and ppid=2"
rs_1.open(sql),cn,1,1
folder_name_1=rs_1("folder")
CategoryName=rs_1("name")

end if
if rs("ppid")<>"" then
set rs_2=server.createobject("adodb.recordset")
sql="select [id],[pid],[ppid],[name],[folder] from [category] where [id]="&rs("ppid")&" and ppid=3"
rs_2.open(sql),cn,1,1
folder_name_2=rs_2("folder")
CategoryName=rs_2("name")
end if

'----------------------
if folder_name<>"" then
folder_path="/"&web_Folder&"/"&folder_name&"/"
end if
category_position1="<a href='"&folder_path&"'>"&rs_0("name")&"</a>"

if folder_name_1<>"" then
folder_path="/"&web_Folder&"/"&folder_name&"/"&folder_name_1&"/"
end if
category_position2=" > <a href='"&folder_path&"'>"&rs_1("name")&"</a>"

if folder_name_2<>"" then
folder_path="/"&web_Folder&"/"&folder_name&"/"&folder_name_1&"/"&folder_name_2&"/"
end if
category_position3=" > <a href='"&folder_path&"'>"&rs_2("name")&"</a>"

if rs("ppid")<>"" then
category_position=category_position1&category_position2&category_position3
end if
if rs("ppid")="" and rs("pid")<>"" then
category_position=category_position1&category_position2
end if
if rs("ppid")="" and rs("pid")="" and rs("cid")<>"" then
category_position=category_position1
end if

end if 
rs.close
set rs=nothing


'侧边栏当前栏目列表
Block_LeftClassList=""
set rsl=server.createobject("adodb.recordset")
sql="select [name],[folder],[id],[pid],[ppid] from [category] where pid="&ClassID&" order by [order] "
rsl.open(sql),cn,1,1
Block_LeftClassList=Block_LeftClassList&"<ul id='suckertree1'>"
if not rsl.eof then
for i=1 to rsl.recordcount
Block_LeftClassList=Block_LeftClassList&"<li><A href='/"&web_Folder&"/"&ClassFolder1&"/"&rsl("Folder")&"'>"&rsl("name")&"</A> "

set rs=server.createobject("adodb.recordset")
sql="select  [name],[folder] from [category] where ppid=3 and pid="&rsl("id")&"  order by [order]"
rs.open(sql),cn,1,1
if not rs.eof then
Block_LeftClassList=Block_LeftClassList&"<ul>"
do while not rs.eof 
Block_LeftClassList=Block_LeftClassList&"<li><a href='/"&web_Folder&"/"&ClassFolder1&"/"&rsl("Folder")&"/"&rs("folder")&"/' target='_blank' >"&rs("name")&"</a></li> "
rs.movenext
loop
Block_LeftClassList=Block_LeftClassList&"</ul>"
end if
rs.close
set rs=nothing
Block_LeftClassList=Block_LeftClassList&"</li> "
rsl.movenext
next
else
Block_LeftClassList=Block_LeftClassList&"无分类"
end if
Block_LeftClassList=Block_LeftClassList&"</ul>"
rsl.close
set rsl=nothing

%>
<%
ArticlePageContent=split(ArticleContent,"<hr />")
c=ubound(ArticlePageContent)
if c>0 then
for i=0 to c

if i=0 then
PageNO=""
else
PageNO=i+1
PageNO="("&PageNO&")"
end if
%>
<%
'分页部分
PageList=""
PageList=PageList&"<div class='t_page ColorLink'>"
PageList=PageList&"当前页数：<span class='FontRed'>" & i+1 & "</span>/" & c+1 &"&nbsp;"
PageList=PageList&"<a href="&Article_FilePath&">" & "首页" & "</a>"
select case i
case 0
PageList=PageList&"&nbsp;&nbsp;上一页&nbsp;&nbsp;"
case 1
PageList=PageList&"<a href="&Article_FilePath&">" & "上一页" & "</a>"
case else
PageList=PageList&"<a href="&i-1&Article_FilePath&">" & "上一页" & "</a>"
end select
for counter=0 to c

if counter=0 then
if counter=i then
PageList=PageList&"&nbsp;&nbsp;1&nbsp;&nbsp;"
else
PageList=PageList&"<a  href="&Article_FilePath&">" & 1 & "</a> "
end if

else
if counter=i then
PageList=PageList&"&nbsp;&nbsp;"&counter+1&"&nbsp;&nbsp;"
else
PageList=PageList&"<a  href="&counter&Article_FilePath&">" & counter+1 & "</a> "
end if

end if
next

if i=c then
PageList=PageList&"&nbsp;&nbsp;下一页&nbsp;&nbsp;"
else
PageList=PageList&"<a href="&i+1&Article_FilePath&">" & "下一页" & "</a>"
end if

PageList=PageList&"<a href="&c&Article_FilePath&">" & "尾页" & "</a></div>"
%>


<%
'读取模板内容
TemplatePath="/templates/MobileTemplet/"&Model_FileName
replace_code=ReadFromUTF(TemplatePath,"utf-8") 
%>
<%
replace_code=replace(replace_code,"$web_name$",web_name)
replace_code=replace(replace_code,"$web_url$",web_url)
replace_code=replace(replace_code,"$web_image$",web_image)
replace_code=replace(replace_code,"$web_title$",web_title)
replace_code=replace(replace_code,"$web_copyright$",web_copyright)
replace_code=replace(replace_code,"$web_theme$",web_theme)
replace_code=replace(replace_code,"$web_consult$",web_consult)
replace_code=replace(replace_code,"$PageNO$",PageNO)
replace_code=replace(replace_code,"$web_BottomHTML$",web_BottomHTML)
replace_code=replace(replace_code,"$web_tel$",web_tel)
replace_code=replace(replace_code,"$search_FolderName$",search_FolderName)

replace_code=replace(replace_code,"$article_kw$",article_kw)
replace_code=replace(replace_code,"$article_refer$",article_refer)
replace_code=replace(replace_code,"$category_position$",category_position)
replace_code=replace(replace_code,"$CategoryName$",CategoryName)
replace_code=replace(replace_code,"$MorePro_List$",MorePro_List)
replace_code=replace(replace_code,"$Block_LeftClassList$",Block_LeftClassList)
replace_code=replace(replace_code,"$ClassName1$",ClassName1)
replace_code=replace(replace_code,"$ClassFolder1$",ClassFolder1)
replace_code=replace(replace_code,"$web_Folder$",web_Folder)

replace_code=replace(replace_code,"$article_id$",a_id) 
replace_code=replace(replace_code,"$article_title$",article_title)
replace_code=replace(replace_code,"$article_keywords$",article_keywords)
replace_code=replace(replace_code,"$article_description$",article_description)
replace_code=replace(replace_code,"$article_image$",article_image)
replace_code=replace(replace_code,"$article_time$",article_time)
replace_code=replace(replace_code,"$article_from_name$",article_from_name)
replace_code=replace(replace_code,"$article_content$",ArticlePageContent(i))
replace_code=replace(replace_code,"$PageList$",PageList)
replace_code=replace(replace_code,"$article_date$",article_date)
replace_code=replace(replace_code,"$article_place$",article_place)
replace_code=replace(replace_code,"$article_short$",article_short)
replace_code=replace(replace_code,"$article_wine$",article_wine)
replace_code=replace(replace_code,"$article_net$",article_net)
replace_code=replace(replace_code,"$article_url$",article_url)
replace_code=replace(replace_code,"$OrderCount$",OrderCount)

replace_code=replace(replace_code,"$web_TopMenu$",web_TopMenu)
replace_code=replace(replace_code,"$web_BottomMenu$",web_BottomMenu)
replace_code=replace(replace_code,"$Block01_LeftItem$",Block01_LeftItem)
replace_code=replace(replace_code,"$Block02_LeftItem$",Block02_LeftItem)
replace_code=replace(replace_code,"$Inner_BannerTop$",Inner_BannerTop)
replace_code=replace(replace_code,"$Inner_BannerTop2$",Inner_BannerTop2)

%>
<% '判断文件夹是否存在，否则创建
Set Fso=Server.CreateObject("Scripting.FileSystemObject") 
If Fso.FolderExists(Server.MapPath(Model_FolderName))=false Then
NewFolderDir=Model_FolderName
call CreateFolderB(NewFolderDir)
end if
%>
<%'声明HTML文件名,指定文件路径
if i=0 then
filepath=Model_FolderName&"/"&Article_FilePath
else
filepath=Model_FolderName&"/"&i&Article_FilePath
end if
%>
<% '生成静态文件
 '读取模板
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
next
else
%>
<%
'读取模板内容
TemplatePath="/templates/MobileTemplet/"&Model_FileName
replace_code=ReadFromUTF(TemplatePath,"utf-8") 
%>
<%
replace_code=replace(replace_code,"$web_name$",web_name)
replace_code=replace(replace_code,"$web_url$",web_url)
replace_code=replace(replace_code,"$web_image$",web_image)
replace_code=replace(replace_code,"$web_title$",web_title)
replace_code=replace(replace_code,"$web_copyright$",web_copyright)
replace_code=replace(replace_code,"$web_theme$",web_theme)
replace_code=replace(replace_code,"$web_consult$",web_consult)
replace_code=replace(replace_code,"$PageNO$","")
replace_code=replace(replace_code,"$web_BottomHTML$",web_BottomHTML)
replace_code=replace(replace_code,"$web_tel$",web_tel)
replace_code=replace(replace_code,"$search_FolderName$",search_FolderName)

replace_code=replace(replace_code,"$article_kw$",article_kw)
replace_code=replace(replace_code,"$article_refer$",article_refer)
replace_code=replace(replace_code,"$category_position$",category_position)
replace_code=replace(replace_code,"$CategoryName$",CategoryName)
replace_code=replace(replace_code,"$MorePro_List$",MorePro_List)
replace_code=replace(replace_code,"$Block_LeftClassList$",Block_LeftClassList)
replace_code=replace(replace_code,"$ClassName1$",ClassName1)
replace_code=replace(replace_code,"$ClassFolder1$",ClassFolder1)
replace_code=replace(replace_code,"$web_Folder$",web_Folder)

replace_code=replace(replace_code,"$article_id$",a_id) 
replace_code=replace(replace_code,"$article_title$",article_title)
replace_code=replace(replace_code,"$article_keywords$",article_keywords)
replace_code=replace(replace_code,"$article_description$",article_description)
replace_code=replace(replace_code,"$article_image$",article_image)
replace_code=replace(replace_code,"$article_time$",article_time)
replace_code=replace(replace_code,"$article_from_name$",article_from_name)
replace_code=replace(replace_code,"$article_content$",ArticleContent)
replace_code=replace(replace_code,"$PageList$","")
replace_code=replace(replace_code,"$article_date$",article_date)
replace_code=replace(replace_code,"$article_place$",article_place)
replace_code=replace(replace_code,"$article_short$",article_short)
replace_code=replace(replace_code,"$article_wine$",article_wine)
replace_code=replace(replace_code,"$article_net$",article_net)
replace_code=replace(replace_code,"$article_url$",article_url)
replace_code=replace(replace_code,"$OrderCount$",OrderCount)

replace_code=replace(replace_code,"$web_TopMenu$",web_TopMenu)
replace_code=replace(replace_code,"$web_BottomMenu$",web_BottomMenu)
replace_code=replace(replace_code,"$Block01_LeftItem$",Block01_LeftItem)
replace_code=replace(replace_code,"$Block02_LeftItem$",Block02_LeftItem)
replace_code=replace(replace_code,"$Inner_BannerTop$",Inner_BannerTop)
replace_code=replace(replace_code,"$Inner_BannerTop2$",Inner_BannerTop2)

%>
<% '判断文件夹是否存在，否则创建
Set Fso=Server.CreateObject("Scripting.FileSystemObject") 
If Fso.FolderExists(Server.MapPath(Model_FolderName))=false Then
NewFolderDir=Model_FolderName
call CreateFolderB(NewFolderDir)
end if
%>
<%'声明HTML文件名,指定文件路径
filepath=Model_FolderName&"/"&Article_FilePath
%>
<% '生成静态文件
 '读取模板
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
end if
%>
<%
end function
%>