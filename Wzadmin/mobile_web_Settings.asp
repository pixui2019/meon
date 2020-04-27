<%@ LANGUAGE=VBScript CodePage=65001%>
<% response.charset="utf-8" %>
<% session.codepage=65001 %>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--#include file="../inc/access.asp"  -->
<!-- #include file="inc/functions.asp" -->
<!-- #include file="../inc/m_x_to_html/index_to_html.asp" -->
<!-- #include file="../inc/m_x_to_html/mobile_to_js.asp" -->
<%
act=Request("act")
If act="save" Then 
web_name=trim(request.form("web_name"))
web_url=trim(request.form("web_url"))
web_image=trim(request.form("web_image"))
web_title=trim(request.form("web_title"))
web_keywords=trim(request.form("web_keywords"))
web_description=trim(request.form("web_description"))
web_TopHTML=trim(request.form("web_TopHTML"))
web_BottomHTML=trim(request.form("web_BottomHTML"))
web_copyright=trim(request.form("content"))
web_contact=trim(request.form("web_contact"))
web_person=trim(request.form("web_person"))
web_birthdate=trim(request.form("web_birthdate"))
web_birthplace=trim(request.form("web_birthplace"))
web_shortintro=trim(request.form("web_shortintro"))
web_email=trim(request.form("web_email"))
web_tel=trim(request.form("web_tel"))
web_ModelEdit=trim(request.form("web_ModelEdit"))
web_time=trim(request.form("web_time"))
web_Folder=Replace(trim(request.form("web_Folder")),"/","")
if web_time="" then
 web_time=now()
end if 
web_Show=trim(request.form("web_Show"))

set rs=server.createobject("adodb.recordset")
sql="select * from mobile_web_settings"
rs.open(sql),cn,1,3
rs("web_name")=web_name
rs("web_url")=web_url
rs("web_image")=web_image
rs("web_title")=web_title
rs("web_keywords")=web_keywords
rs("web_description")=web_description
rs("web_TopHTML")=web_TopHTML
rs("web_BottomHTML")=web_BottomHTML
rs("web_copyright")=web_copyright
rs("web_contact")=web_contact
rs("web_person")=web_person
OldFolder=rs("web_folder")
rs("web_Folder")=web_Folder
rs("web_Show")=web_Show
'rs("web_birthplace")=web_birthplace
'rs("web_shortintro")=web_shortintro
'rs("web_email")=web_email
'rs("web_tel")=web_tel
'rs("web_ModelEdit")=web_ModelEdit
'rs("web_time")=web_time
rs.update
rs.close
set rs=nothing

'检测原文件夹是否存在，否则创建
Set Fso=Server.CreateObject("Scripting.FileSystemObject") 
If Fso.FolderExists(Server.MapPath("/"&OldFolder))=false Then
NewFolderDir="/"&OldFolder
call CreateFolderB(NewFolderDir)
end if
'检测新文件夹是否与原文件夹不同，是则更名。
if OldFolder<>web_Folder  then
NewFolderDir="/"&web_Folder
OldFolderDir="/"&OldFolder
call renamefolder(OldFolderDir,NewFolderDir) 
end if

call Mobile_to_js()
call index_to_html()
response.Write "<script language='javascript'>alert('修改成功！')</script>"

end if
 %>
 
	<%
Call header()

%>
<%set rs=server.createobject("adodb.recordset")
sql="select * from mobile_web_settings"
rs.open(sql),cn,1,1
if not rs.eof and not rs.bof then
%>
  </head>

  <form id="form1" name="form1" method="post" action="?act=save">
         <script language='javascript'>
function checksignup1() {
if ( document.form1.web_Folder.value == '' ) {
window.alert('请输入手机网站目标文件夹^_^');
document.form1.web_Folder.focus();
return false;}

return true;}
</script>

	<table cellpadding='3' cellspacing='1' border='0' class='tableBorder' align=center>
	<tr>
	  <th class='tableHeaderText' colspan=2 height=31>手机网站信息设置</th>
	<tr>
	  <td height=23 colspan="2" class='forumRow'><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="20" class='TipTitle'>&nbsp;√ 操作提示</td>
        </tr>
        <tr>
          <td height="30" valign="top" class="TipWords"><p>1、网站叫什么名称，网址是什么，网站的LOGO等。在这里一一设置吧。</p>
            <p>2、修改了某项信息后，默认只会自动生成首页面，其它页面需要手动生成才能看到修改后的效果。</p></td>
        </tr>
        <tr>
          <td height="10">&nbsp;</td>
        </tr>
      </table></td>
	  </tr>
	<tr>
	  <td class='forumRowHighLight' height=23>是否开启手机站</td>
	  <td class='forumRowHighLight'><label>
	    <input type="radio" name="web_show" value="0" <%
		if rs("web_show")=0 then
		response.write "checked"
		end if%>>
      开启
      &nbsp;
      <input name="web_show" type="radio" value="1" <%if rs("web_show")=1 then
		response.write "checked"
		end if%>>
      关闭</label></td>
	</tr>	
	<tr>
	<td width="15%" height=23 class='forumRow'>手机网站目标文件夹</td>
	<td class='forumRow'><input name='web_Folder' type='text' id='web_Folder' value="<%=rs("web_Folder")%>" size='40'> 例如：Mobile，文件夹将创建在根目录下，慎重命名，勿与系统文件夹名重复！</td>
	</tr>	<tr>
	<td width="15%" height=23 class='forumRowHighLight'>网站名称</td>
	<td class='forumRowHighLight'><input name='web_name' type='text' id='web_name' value="<%=rs("web_name")%>" size='40'></td>
	</tr>
	<tr>
	<td class='forumRow' height=23>网站网址</td>
<td class='forumRow'><input type='text' id='web_url' name='web_url' value="<%=rs("web_url")%>" size='40'> 
  &nbsp;请以http://开头，<span style="color: #FF0000" >后面不要带 / </span>，如：<a href="http://www.baidu.com/" target="_blank">http://www.baidu.com</a></td>
	</tr>
	  <tr>
	    <td class='forumRowHighLight' height=23>网站标志(logo)</td>
	    <td width="85%" class='forumRowHighLight'><table width="100%" border="0" cellspacing="0" cellpadding="0">
         <tr>
           <td width="22%"  class='forumRow'><input name="web_image" type="text" id="web_image"  value="<%=rs("web_image")%>"  size="30"></td>
           <td width="78%"  class='forumRow'><iframe width="500" name="ad" frameborder=0 height=30 scrolling=no src=upload.asp></iframe></td>
         </tr>
       </table></td>
      </tr>
	    <td class='forumRow' height=23>首页标题(Title)</td>
	      <td class='forumRow'><input type='text' id='web_title' name='web_title'   value="<%=rs("web_title")%>" size='80'></td>
	</tr>
	    <td class='forumRowHighLight' height=11>网站关键字(keywords)</td>
	      <td class='forumRowHighLight'><input type='text' id='v3' name='web_keywords'   value="<%=rs("web_keywords")%>" size='80'>
	  &nbsp;请以，隔开</td>
	</tr><tr>
	  <td class='forumRow' height=11>网站描述(Description)</td>
	  <td class='forumRow'><textarea name='web_description'  cols="100" rows="4" ><%=rs("web_description")%></textarea></td>
	</tr>
	<tr>
	  <td class='forumRow' height=23>网站底部HTML代码</td>
	  <td class='forumRow'> <textarea name='web_BottomHTML' cols="100" rows="10"  id="web_BottomHTML" ><%=rs("web_BottomHTML")%></textarea></td>
	</tr>	

	<tr><td height="50" colspan=2  class='forumRow'><div align="center">
	  <INPUT type=submit value='提交' onClick='javascript:return checksignup1()' name=Submit>
	  </div></td></tr>
	</table>
</form>

<%
Call DbconnEnd()
else
response.write "暂时无数据"
end if %>