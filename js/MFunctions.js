/*News Tab*/

$(function(){
    function tabs(tabTit,on,tabCon){
	$(tabCon).each(function(){
	  $(this).children().eq(0).show();
	  });
	$(tabTit).each(function(){
	  $(this).children().eq(0).addClass(on);
	  });
     $(tabTit).children().click(function(){
        $(this).addClass(on).siblings().removeClass(on);
         var index = $(tabTit).children().index(this);
         $(tabCon).children().eq(index).show().siblings().hide();
    });
     }
  tabs(".tab-hd","active",".tab-bd");
   });



function displayit(n){

	for(i=0;i<4;i++){

		if(i==n){

			var id='MyMenu_list'+n;

			if(document.getElementById(id).style.display=='none'){

				document.getElementById(id).style.display='';

				document.getElementById("plug-wrap").style.display='';

			}else{

				document.getElementById(id).style.display='none';

				document.getElementById("plug-wrap").style.display='none';

			}

		}else{

			if($('#MyMenu_list'+i)){

				$('#MyMenu_list'+i).css('display','none');

			}

		}

	}

}

function closeall(){

	var count = document.getElementById("top_MyMenu").getElementsByTagName("ul").length;

	for(i=0;i<count;i++){

		document.getElementById("top_MyMenu").getElementsByTagName("ul").item(i).style.display='none';

	}

	document.getElementById("plug-wrap").style.display='none';

}



document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {

	WeixinJSBridge.call('hideToolbar');

});



function comment_check() {
if ( document.form1.name.value == '' ) {
window.alert('请输入姓名^_^');
document.form1.name.focus();
return false;}

if ( document.form1.email.value.length> 0 &&!document.form1.email.value.indexOf('@')==-1|document.form1.email.value.indexOf('.')==-1 ) {
window.alert('请设置正确的Email地址，如:webmaster@qq.com');
document.form1.email.focus();
return false;}

if(document.form1.qq.value.search(/^([0-9]*)([.]?)([0-9]*)$/)   ==   -1)   
      {   
  window.alert("QQ只能是数字^_^");   
document.form1.qq.focus();
return false;}

if ( document.form1.content.value == '' ) {
window.alert('请输入内容^_^');
document.form1.content.focus();
return false;}

if ( document.form1.verycode.value == '' ) {
window.alert('请输入验证码^_^');
document.form1.verycode.focus();
return false;}

return true;}




function order_check() {
if ( document.form1.ordercount.value == '' ) {
window.alert('请输入订购数量^_^');
document.form1.ordercount.focus();
return false;}

if(document.form1.ordercount.value.search(/^([0-9]*)([.]?)([0-9]*)$/)   ==   -1)   
      {   
  window.alert("订购数量只能是数字^_^");   
document.form1.ordercount.focus();
return false;}


if ( document.form1.name.value == '' ) {
window.alert('请输入联系人^_^');
document.form1.name.focus();
return false;}

if ( document.form1.address.value == '' ) {
window.alert('请输入联系地址^_^');
document.form1.address.focus();
return false;}

if ( document.form1.tel.value == '' ) {
window.alert('请输入联系电话^_^');
document.form1.tel.focus();
return false;}

if ( document.form1.email.value.length> 0 &&!document.form1.email.value.indexOf('@')==-1|document.form1.email.value.indexOf('.')==-1 ) {
window.alert('请设置正确的Email地址，如:webmaster@qq.com');
document.form1.email.focus();
return false;}

if(document.form1.qq.value.search(/^([0-9]*)([.]?)([0-9]*)$/)   ==   -1)   
      {   
  window.alert("QQ只能是数字^_^");   
document.form1.qq.focus();
return false;}


if ( document.form1.verycode.value == '' ) {
window.alert('请输入验证码^_^');
document.form1.verycode.focus();
return false;}

return true;}


