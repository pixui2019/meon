<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

	<table cellpadding='3' cellspacing='1' border='0' class='tableBorder' align=center>
	<tr>
	  <th class='tableHeaderText' colspan=2 height=25>修改产品</th>
	<tr>
	<td width="15%" height=23 class='forumRow'>标题 (必填) </td>
	<td class='forumRow'><input name='a_title' type='text' id='a_title' size='70'>
	  &nbsp;</td>
	</tr>
	<tr>
	<td class='forumRowHighLight' height=23>分类<span class="forumRow"> (必选) </span></td>
    <td class='forumRowHighLight'>
            </select>
            &nbsp;&nbsp;
            <select name="pid" id="pid"  onchange="changeselect2(this.value)">
              <option value="">选择二级分类</option>
            </select>
            &nbsp;&nbsp;
            <select name="ppid" id="ppid">
              <option value="">选择三级分类</option>
            </select>&nbsp;</td>
	</tr>
	  <tr>
	    <td class='forumRow' height=23>品牌 </td>
	    <td class='forumRow'><input name='SalePrice' type='text' id='SalePrice' size='30'>
        </td>
      </tr>
	  <tr>
	    <td class='forumRowHighLight' height=23>型号</td>
	    <td class='forumRowHighLight'><input name='SaleCount' type='text' id='SaleCount' size='30'></td>
      </tr>
	  <tr>
	    <td class='forumRowHighLight' height=23>产品图片</td>
	    <td width="85%" class='forumRowHighLight'><table width="100%" border="0" cellspacing="0" cellpadding="0">
         <tr>
           <td width="22%" ><input name="web_image" type="text" id="web_image"  size="30"></td>
           <td width="78%"  ><iframe width="500" name="ad" frameborder=0 height=30 scrolling=no src=upload.asp></iframe></td>
         </tr>
       </table></td>
      </tr>

        <td  class='forumRow' height=23>关键字</td>
	      <td class='forumRow'><input type='text' id='a_keywords' name='a_keywords' size='60'> <select name="keywords_list" id="keywords_list" onclick="document.form1.a_keywords.value=document.form1.keywords_list.value">
	      <option value="">请选择</option>
		  </select>
	  &nbsp;请以，隔开(中文逗号)</td>
	</tr><tr>
	  <td class='forumRowHighLight' height=11>描述 </td>
	  <td class='forumRowHighLight'><textarea name='a_description'  cols="100" rows="4" id="a_description" ></textarea></td>
	</tr>
	<tr>
	  <td class='forumRow' height=23>介绍 (必填) </td>
	  <td class='forumRow'> <textarea name="a_content" id="a_content" style=" width:100%; height:400px; visibility:hidden;"></textarea>
  </td>
	</tr>
	<tr>
	  <td class='forumRow' height=23>添加者</td>
	  <td class='forumRow'><span class="forumRow">
	    <input name='a_author' type='text' id='a_author' value="<%=Session("log_name")%>" size='40'>
	  </span></td>
	</tr>
	<tr>
	  <td class='forumRowHighLight' height=23>浏览次数</td>
	  <td class='forumRowHighLight'><input name='a_hit' type='text' id='a_hit' value="0" size='40'>
      &nbsp;只能是数字</td>
	  </tr>
	<tr>
	  <td class='forumRow' height=23>推荐</td>
	  <td class='forumRow'><input type="radio" name="a_index_push" value="1">
是
      &nbsp;
      <input name="a_index_push" type="radio" value="0" checked>
否</td>
	  </tr>

	  
	<tr><td height="50" colspan=2  class='forumRow'><div align="center">
	  <INPUT type=submit value='提交' onClick='javascript:return checksignup1()' name=Submit>
	  </div></td></tr>
	</table>
</form>