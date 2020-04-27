<!-- #include file="../access.asp" -->
<!-- #include file="../html_clear.asp" -->

<%'容错处理
function search_index_to_html()
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

%>

<% '读取模板内容
'模板类型获取
set rs_1=server.createobject("adodb.recordset")
sql="select FileName,FolderName from mobile_web_Models_type where [id]=35"
rs_1.open(sql),cn,1,1
if not rs_1.eof then
Model_FileName=rs_1("FileName")
if rs_1("FolderName")<>"" then
Model_FolderName="/"&web_Folder&"/"&rs_1("FolderName")
else
Model_FolderName="/"&web_Folder
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

replace_code=replace(replace_code,"$Inner_BannerTop$",Inner_BannerTop)
replace_code=replace(replace_code,"$Inner_BannerTop2$",Inner_BannerTop2)

%>

<% '判断模板文件夹是否存在，否则创建
Set Fso=Server.CreateObject("Scripting.FileSystemObject") 
If Fso.FolderExists(Server.MapPath(Model_FolderName))=false Then
NewFolderDir=Model_FolderName
call CreateFolderB(NewFolderDir)
end if
%>
<% 
filepath_index=Model_FolderName&"/index.asp"	
%>
<% '读取模板
'******************************************
'功能：生成UTF-8文件
'******************************************
mappath =filepath_index
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