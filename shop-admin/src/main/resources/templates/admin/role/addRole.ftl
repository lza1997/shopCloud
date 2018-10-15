<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
</@layout.head> 
<@layout.body>
<div class="page">
	<div class="fixed-bar">
		<div class="item-title">
			<h3>会员管理</h3>
			<ul class="tab-base">
				<li><a href="${base}/role/list"><span>管理</span>
				</a>
				</li>
				<li><a href="javascript:void(0);" class="current"><span>新增</span>
				</a>
				</li>
			</ul>
		</div>
	</div>
	<div class="fixed-empty"></div>
	<form id="role_form" enctype="multipart/form-data" action="${base}/role/saveOrUpdate">
		<input type="hidden" name="form_submit" value="ok" />
		<table class="table tb-type2">
			<tbody>
				<tr class="noborder">
					<td colspan="2" class="required"><label class="validation"
						for="name">角色名称:</label>
					</td>
				</tr>
				<tr class="noborder">
					<td class="vatop rowform"><input type="text" name="name"id="name" class="txt"></td>
					<td class="vatop tips"></td>
				</tr>
				<tr>
					<td colspan="2" class="required"><label class="validation" for="description">角色描述:</label></td>
				</tr>
				<tr class="noborder">
					<td class="vatop rowform"><input type="text" id="description" name="description" class="txt"></td>
					<td class="vatop tips"></td>
				</tr>
				<tr>
					<td colspan="2" class="required"><label class="validation" for="roleAlias">角色别名:</label></td>
				</tr>
				<tr class="noborder">
					<td class="vatop rowform">
					<!-- <select name="roleAlias" id="roleAlias">
		          		<option value＝"">请选择</option>
			          	<option value="admin">admin</option>
			          	<option value="manager">manager</option>
			          	<option value="guest">guest</option>
		          	</select> -->
		          	<!--  需要启用redis-->
		          	<#if roleAlias??>
		          	 <select name="roleAlias" id="roleAlias">
		          		<option value＝"">请选择</option>
				          	<#list roleAlias as ra>
				          		<option value="${ra.dictionaryValue}">${ra.dictionaryName}</option>
				          	</#list>
			         </select>
		          	</#if>
		          	</td>
					<td class="vatop tips">用于后台菜单的权限的限制</td>
				</tr>
			<tfoot>
				<tr class="tfoot">
					<td colspan="15"><a href="JavaScript:void(0);" class="btn"
						id="submitBtn"><span>提交</span>
					</a>
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
</div>
<script type="text/javascript">
    $(function(){
        //按钮先执行验证再提交表单
        $("#submitBtn").click(function(){
            if($("#role_form").valid()){
                $("#role_form").submit();
            }
        });

        $('#role_form').validate({
            errorPlacement: function(error, element){
                error.appendTo(element.parent().parent().prev().find('td:first'));
            },
            rules : {
                name: {
                    required : true,
                    minlength: 3,
                    maxlength: 20,
                    remote   : {
                        url : APP_BASE+'/role/validate',
                        type:'post',
                        data:{
                            name : function(){
                                return $('#name').val();
                            },
                            id : ''
                        }
                    }
                },
                 description: {
                    required : true,
                    minlength: 3,
                    maxlength: 20,
                    remote   : {
                        url : APP_BASE+'/role/validate',
                        type:'post',
                        data:{
                            description : function(){
                                return $('#description').val();
                            },
                            id : ''
                        }
                    }
                }
            },
            messages : {
                name: {
                    required : '角色名称不能为空',
                    maxlength: '角色名必须在3-20字符之间',
                    minlength: '角色名必须在3-20字符之间',
                },
                 description: {
                    required : '角色描述不能为空',
                    maxlength: '角色名必须在3-20字符之间',
                    minlength: '角色名必须在3-20字符之间',
                }
            }
        });
    });
</script>
</@layout.body>
