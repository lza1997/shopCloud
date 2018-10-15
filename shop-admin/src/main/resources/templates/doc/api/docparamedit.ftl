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
            <h3>参数管理</h3>
            <ul class="tab-base">
                <li><a href="${base}/doc/api/param/list?docid=${docid}"><span>列表</span></a></li>
                <li><a href="${base}/doc/api/param/add?docid=${docid}" ><span>新增</span></a></li>
                <li><a href="javascript:void(0);" class="current"><span>修改</span></a></li>
                
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form id="spec_form" method="post" action="${base}/doc/api/param/saveOrUpdate">
    	<input type="hidden" name="docid" value="${param.docid}" />
    	<input type="hidden" name="id" value="${param.id}" />
        <table class="table tb-type2">
            <tbody>
            <tr class="noborder">
                <td class="required" colspan="2"><label class="validation" for="name">名称：</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" class="txt" name="name" id="name" value="${param.name}"/></td>
                <td class="vatop tips">请填写API名称。</td>
            </tr>
            
            <tr class="noborder">
                <td class="required" colspan="2"><label class="validation" for="type">类型：</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform">
                	<input type="radio" name="type" id="type" value="1" <#if param.type == 1>checked</#if>/>String
                	<input type="radio" name="type" id="type"  value="0" <#if param.type == 0>checked</#if>/>Integer
                </td>
                <td class="vatop tips">请选择类型。</td>
            </tr>
            
            <tr class="noborder">
                <td class="required" colspan="2"><label class="validation" for="isrequired">是否必填：</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform">
                	<input type="radio" name="isrequired" id="isrequired" value="1" <#if param.isrequired == 1>checked</#if>/>是
                	<input type="radio" name="isrequired" id="isrequired" value="0" <#if param.isrequired == 0>checked</#if>/>否
                </td>
                <td class="vatop tips">请选择是否必填。</td>
            </tr>
            
            <tr class="noborder">
                <td class="required" colspan="2"><label class="validation" for="exampleValue">示例值：</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" class="txt" name="exampleValue" id="exampleValue" value="${param.exampleValue}"/></td>
                <td class="vatop tips">请填写示例值。</td>
            </tr>
            
            <tr class="noborder">
                <td class="required" colspan="2"><label class="validation" for="defalutValue">默认值：</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" class="txt" name="defalutValue" id="defalutValue" value="${param.defalutValue}"/></td>
                <td class="vatop tips">请填写默认值。</td>
            </tr>
            
            <tr>
                <td class="required" colspan="2"><label class="validation" for="description">描述：</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform">
                	<textarea name="description" style="height:100px;">${param.description}</textarea>
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
                    required : '请填写API名称',
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
    });

</script>
</@layout.body>