<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  </head>

  <form id="form1" name="form1" method="post" action="?act=save&pid_name=<%=pid_name%>&pid_name2=<%=pid_name2%>">
         <script language='javascript'>
function checksignup1() {
if ( document.form1.c_name.value == '' ) {
window.alert('请输入栏目名称^_^');
document.form1.c_name.focus();
return false;}

return true;}
</script>
	<table cellpadding='3' cellspacing='1' border='0' class='tableBorder' align=center>
	<tr>
	  <th class='tableHeaderText' colspan=2 height=25>添加栏目</th>
	<tr>
	  <td height=23 colspan="2" class='forumRow'><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="20" class='TipTitle'>&nbsp;√ 操作提示</td>
        </tr>
        <tr>
          <td height="30" valign="top" class="TipWords"><p>1、一般情况下，您可需要填写栏目名称即可,栏目文件夹名称不填将会自动用随机数字命名。</p>
            <p>2、栏目文件夹将会在根目录下进行创建，请尽量使用与系统文件夹不同的名称命名。</p>
            </td>
        </tr>
        <tr>
          <td height="10">&nbsp;</td>
        </tr>
      </table></td>
	  </tr>
	<tr>
	<td width="15%" height=23 class='forumRowHighLight'>栏目名称 (必填) </td>
	<td class='forumRowHighLight'><input name='c_name' type='text' id='c_name' size='40'>
	  &nbsp;<span style="color: #FF0000"></span></td>
	</tr>
	<tr>
	  <td class='forumRow' height=23>栏目标题 (选填) </td>
	  <td class='forumRow'>
	    <input name='c_title' type='text' id='c_title' size='50' maxlength="200" />
	 </td>
	  </tr>
	<tr>
	<td class='forumRowHighLight' height=23>栏目文件夹名称 (选填)</td>
    <td class='forumRowHighLight'><input type='text' id='c_folder' name='c_folder' size='40'>
      &nbsp;<span style="color: #FF0000">请使用英文命名，保持为空将自动使用随机数字命名,填入的字符将无效。</span><span style="color: #FF0000">勿与系统文件夹名重复</span></td>
	</tr>
	  <tr>
	    <td class='forumRow' height=23>栏目图片</td>
	    <td width="85%" class='forumRow'><table width="100%" border="0" cellspacing="0" cellpadding="0">
         <tr>
           <td width="22%"  class='forumRow'><input name="web_image" type="text" id="web_image"  size="30"></td>
           <td width="78%"  class='forumRow'><iframe width="500" name="ad" frameborder=0 height=30 scrolling=no src=upload.asp></iframe></td>
         </tr>
       </table></td>
      </tr>

      <td class='forumRowHighLight' height=11>栏目关键字</td>
	      <td class='forumRowHighLight'><input type='text' id='v3' name='c_keywords' size='80'>
	  &nbsp;请以，隔开</td>
	</tr><tr>
	  <td class='forumRow' height=11>栏目描述</td>
	  <td class='forumRow'><textarea name='c_description'  cols="100" rows="4" id="c_description" ></textarea></td>
	</tr>
	<tr>
	  <td class='forumRowHighLight' height=23>栏目简介</td>
	  <td class='forumRowHighLight'>  <textarea name="a_content" id="a_content" style=" width:100%; height:400px; visibility:hidden;"></textarea>
</td>
	</tr>
	<tr>
	  <td class='forumRow' height=23><span style="color: #FF0000">栏目属性 (必选)</span></td>
	  <td class='forumRow'><label>
	    <input name="ClassType" type="radio" value="1" >      
单页</label></td>
	  </tr>	
<tr>
	    <td class='forumRow' height=23>栏目排序</td>
	    <td class='forumRow'><span class="forumRow">
	      <input name='order' type='text' id='order' value="100" size='20' maxlength="5">
	    &nbsp;只能是数字，数字越小排名越靠前，默认为100，将排在最后面</span></td>
      </tr><tr>	
	<tr><td height="50" colspan=2  class='forumRow'><div align="center">
	  <INPUT type=submit value='提交' onClick='javascript:return checksignup1()' name=Submit>
	  </div></td></tr>
	</table>
</form>