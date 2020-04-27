<!-- #include file="../../inc/access.asp" -->

<%'容错处理
function Mobile_to_js()
On Error Resume Next
%>
<%
'读取替换
set rs=server.createobject("adodb.recordset")
sql="select web_Folder,web_show from mobile_web_settings"
rs.open(sql),cn,1,1
if not rs.eof  then
web_Folder=rs("web_folder")
web_ShowYes=rs("web_show")
end if
rs.close
set rs=nothing
%>
<% '读取模板内容
'Set fso=Server.CreateObject("Scripting.FileSystemObject") 
'Set htmlwrite=fso.OpenTextFile(Server.MapPath("/templates/common/template.js")) 
'replace_code=htmlwrite.ReadAll() 
'htmlwrite.close 
%>
<%
 '读取模板内容 1不显示跳转,0显示跳转
TemplatePath="/js/Functions.js"
replace_code=ReadFromUTF(TemplatePath,"utf-8") 
%>

<%
replace_code=replace(replace_code,"/"&OldFolder&"/","/"&web_Folder&"/")
if web_ShowYes=1 then
replace_code=replace(replace_code,"replace(murl)","replace(NoUrl)")
else
replace_code=replace(replace_code,"replace(NoUrl)","replace(murl)")
end if
%>
<% '判断ADs文件夹是否存在，否则创建
Set Fso=Server.CreateObject("Scripting.FileSystemObject") 
If Fso.FolderExists(Server.MapPath("/js"))=false Then
NewFolderDir="/js"
call CreateFolderB(NewFolderDir)
end if
%>

<%'声明HTML文件名,指定文件路径
filepath="/js/Functions.js"
%>

<%
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

<%end function
%>