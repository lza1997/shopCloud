<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge;chrome=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>shop</title>
<script type="text/javascript" src="${base}/res/js/jquery.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery.validation.min.js"></script>
<script type="text/javascript" src="${base}/res/js/admincp.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery.cookie.js"></script>
<script type="text/javascript" src="${base}/res/js/common.js" charset="utf-8"></script>
<link href="${base}/res/css/skin_0.css" rel="stylesheet" type="text/css" id="cssfile2" />

</head>
<body>

<div class="page">
  <div class="fixed-bar">
    <div class="item-title">
      <h3>权限设置</h3>
      <ul class="tab-base"><li><a href="${base}/setting/admin/index" ><span>管理员</span></a></li><li><a  class="current"><span>添加管理员</span></a></li>
      <#--
      <li>
	      <a href="#?act=admin&op=gadmin" >
	         <span>权限组</span>
	      </a>
	      </li>
	      <li>
	        <a href="#?act=admin&op=gadmin_add" ><span>添加权限组</span></a>
	  </li>
	  -->
      </ul>    </div>
  </div>
  <div class="fixed-empty"></div>
  <form id="add_form" method="post" action="${base}/setting/admin/saveOrUpdate">
    <input type="hidden" name="form_submit" value="ok" />
    <table class="table tb-type2 nobdb">
      <tbody>
        <tr class="noborder">
          <td colspan="2" class="required"><label class="validation" for="adminName">登录名:</label></td>
        </tr>
        <tr class="noborder">
          <td class="vatop rowform"><input type="text" id="adminName" name="adminName" class="txt"></td>
          <td class="vatop tips">请输入登录名</td>
        </tr>
        <tr>
          <td colspan="2" class="required"><label class="validation" for="adminPassword">密码:</label></td>
        </tr>
        <tr class="noborder">
          <td class="vatop rowform"><input type="password" id="adminPassword" name="adminPassword" class="txt"></td>
          <td class="vatop tips">请输入密码</td>
        </tr>
        <tr>
          <td colspan="2" class="required"><label class="validation" for="adminPassword">确认密码:</label></td>
        </tr>
        <tr class="noborder">
          <td class="vatop rowform"><input type="password" id="adminRpassword" name="adminRpassword" class="txt"></td>
          <td class="vatop tips">请输入密码</td>
        </tr>
        <tr>
          <td colspan="2" class="required"><label class="validation" for="adminGid">权限组:</label></td>
        </tr>
        <tr class="noborder">
          <td class="vatop rowform">
          	<select name="roleid">
                 <#list rolelist as role>
                    <option value="${role.id}">${role.name}</option>
                 </#list>
            </select>
          </td>
          <td class="vatop tips">请选择一个权限组，如果还未设置，请马上设置</td>
        </tr>
      </tbody>
      <tfoot>
        <tr class="tfoot">
          <td colspan="2"><a href="javascript:void(0);" class="btn" id="submitBtn"><span>提交</span></a></td>
        </tr>
      </tfoot>
    </table>
  </form>
</div>
<script>
//按钮先执行验证再提交表
$(document).ready(function(){
	//按钮先执行验证再提交表单
	$("#submitBtn").click(function(){
	    if($("#add_form").valid()){
	     $("#add_form").submit();
		}
	});
	
	$("#add_form").validate({
		errorPlacement: function(error, element){
			error.appendTo(element.parent().parent().prev().find('td:first'));
        },
        rules : {
            adminName : {
                required : true,
				minlength: 3,
				maxlength: 20,
            },
            adminPassword : {
                required : true,
				minlength: 6,
				maxlength: 20
            },
            adminRpassword : {
                required : true,
                equalTo  : '#adminPassword'
            },
            gid : {
                required : true
            }        
        },
        messages : {
            adminName : {
                required : '登录名不能为空',
				minlength: '登录名长度为3-20',
				maxlength: '登录名长度为3-20',
				remote	 : '该名称已存在'
            },
            adminPassword : {
                required : '密码不能为空',
				minlength: '密码长度为6-20',
				maxlength: '密码长度为6-20'
            },
            adminRpassword : {
                required : '密码不能为空',
                equalTo  : '两次输入的密码不一致，请重新输入'
            },
            adminGid : {
                required : '请选择一个权限组',
            }
        }
	});
});
</script>
</body>
</html>