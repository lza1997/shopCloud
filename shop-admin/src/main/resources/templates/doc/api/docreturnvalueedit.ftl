<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/admincp.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/common_select.js" charset="utf-8"></script>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>返回值管理</h3>
            <ul class="tab-base">
                <li><a href="${base}/doc/api/returnvalue/list?docid=${docid}"><span>列表</span></a></li>
                <li><a href="${base}/doc/api/returnvalue/add?docid=${docid}" ><span>新增</span></a></li>
                <li><a href="javascript:void(0);" class="current"><span>修改</span></a></li>
                
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form id="spec_form" method="post" action="${base}/doc/api/returnvalue/saveOrUpdate">
    	<input type="hidden" name="docid" value="${value.docid}" />
    	<input type="hidden" name="id" value="${value.id}" />
        <table class="table tb-type2">
            <tbody>
            <tr class="noborder">
                <td class="required" colspan="2"><label class="validation" for="name">名称：</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" class="txt" name="name" id="name" value="${value.name}"/></td>
                <td class="vatop tips">请填写API名称。</td>
            </tr>
            
            <tr class="noborder">
                <td class="required" colspan="2"><label class="validation" for="type">类型：</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform">
                	<select name="type" id="type">
                		<option value="1" <#if value.type == 1>selected="selected"</#if>>Integer</option>
                		<option value="2" <#if value.type == 2>selected="selected"</#if>>String</option>
                		<option value="3" <#if value.type == 3>selected="selected"</#if>>Double</option>
                		<option value="4" <#if value.type == 4>selected="selected"</#if>>Datetime</option>
                		<option value="5" <#if value.type == 5>selected="selected"</#if>>Boolean</option>
                		<option value="6" <#if value.type == 6>selected="selected"</#if>>List</option>
                		<option value="7" <#if value.type == 7>selected="selected"</#if>>bean</option>
                	</select>
                </td>
                <td class="vatop tips">请选择类型。</td>
            </tr>
            
            <tr class="noborder" id="noborder" style="<#if value.type != 6>display:none;</#if>">
                <td class="vatop rowform">
                	<select name="code" id="code">
                	
                	</select>
                </td>
                <td class="vatop tips">请选择实体。</td>
            </tr>
            
            <tr class="noborder">
                <td class="required" colspan="2"><label class="validation" for="isrequired">是否必填：</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform">
                	<input type="radio" name="isrequired" id="isrequired" value="1" <#if value.isrequired == 1>checked</#if>/>是
                	<input type="radio" name="isrequired" id="isrequired" value="0" <#if value.isrequired == 0>checked</#if>/>否
                </td>
                <td class="vatop tips">请选择是否必填。</td>
            </tr>
            
            <tr class="noborder">
                <td class="required" colspan="2"><label class="validation" for="defaultValue">默认值：</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" class="txt" name="defaultValue" id="defaultValue" value="${value.defaultValue}"/></td>
                <td class="vatop tips">请填写默认值。</td>
            </tr>
            
            <tr>
                <td class="required" colspan="2"><label class="validation" for="description">描述：</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform">
                	<textarea name="description" style="height:100px;">${value.description}</textarea>
                </td>
                <td class="vatop tips">参数说明信息</td>
            </tr>
            </tbody>
            <tfoot>
            <tr class="tfoot">
                <td colspan="15"><a id="submitBtn" class="btn" href="JavaScript:void(0);"> <span>提交</span> </a></td>
            </tr>
            </tfoot>
        </table>
    </form>
</div>
<script type="text/javascript">
	var doccode = '${value.code}';
    $(function(){
        //表单验证
        $('#spec_form').validate({
            errorPlacement: function(error, element){
                error.appendTo(element.parent().parent().prev().find('td:first'));
            },

            rules : {
                name: {
                    required : true,
                    maxlength: 20,
                    minlength: 1
                }
            },
            messages : {
                spName : {
                    required : '请填写名称',
                    maxlength: '名称长度应在1-20个字符之间',
                    minlength: '名称长度应在1-20个字符之间'
                }
            }
        });

        //按钮先执行验证再提交表单
        $("#submitBtn").click(function(){
            if($("#spec_form").valid()){
                $("#spec_form").submit();
            }
        });
        
        $("#type").change(function(){
        	var selectval = $(this).children('option:selected').val();
        	if(6 == selectval){
        		$("#noborder").css("display", "inline");
        		entitylist();
        	}else{
        		$("#noborder").css("display", "none");
        	}
        });
        
        <#if value.type == 6>
        	entitylist();
        </#if>
        
    });
    
    function entitylist(){
    	$.ajax({
			type : "post",
			url : "${base}/doc/api/docentity/allDoc",
			success : function(data){
				var html = "";
				data.forEach(function(s){
					html += "<option value='" + s.code + "'";
					if(s.code == doccode){
						html += " seleted='selected' ";
					}
					html += ">";
					html += s.name;
					html += "</option>";
				});
				$("#code").append(html);
			},
			error : function(){
				
			}
		});
    }

</script>
</@layout.body>