<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/js/layer/layer.min.js"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>数据字典</h3>
            <ul class="tab-base">
                <li><a href="${base}/group/dictionaryGroup/list"><span>列表</span></a></li>
                <li><a href="JavaScript:void(0);" class="current"><span>新增</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form id="store_class_form" method="post" action="${base}/group/dictionaryGroup/save">
        <table class="table tb-type2">
            <tbody>
            <tr class="noborder">
                <td colspan="2" class="required"><label class="validation" for="groupName">字典名称:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" value="" name="groupName" id="groupName" class="txt"></td>
                <td class="vatop tips"></td>
            </tr>
            <tr>
                <td colspan="2" class="required"><label class="validation" for="groupCode">字典编码:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" value="" name="groupCode" id="groupCode" class="txt"></td>
                <td class="vatop tips"></td>
            </tr>
            
            </tbody>
            <tfoot>
            <tr class="tfoot">
                <td colspan="15"><a href="JavaScript:void(0);" class="btn" id="submitBtn"><span>提交</span></a></td>
            </tr>
            </tfoot>
        </table>
    </form>
</div>
<script>
$(function(){
	$("#groupCode").blur(function(){
		var url = "${base}/group/dictionaryGroup/checkGroupCode";
		var args = {"groupCode":$(this).val()}
		$.post(url, args, function(data){
			if(data == "0"){
				layer.msg("字典编码已被使用,请换一个!!");
				$("#groupCode").attr("value","");
			}
		});
	});
});

    //按钮先执行验证再提交表单
    $(function(){$("#submitBtn").click(function(){
        if($("#store_class_form").valid()){
            $("#store_class_form").submit();
        }
    });
    });
    //
    $(document).ready(function(){
        $('#store_class_form').validate({
            errorPlacement: function(error, element){
                error.appendTo(element.parent().parent().prev().find('td:first'));
            },

            rules : {
                groupName : {
                    required : true
                },
                groupCode : {
                    required : true
                }
            },
            messages : {
                groupName : {
                    required : '字典名称不能为空',
                },
                groupCode  : {
                    required : '字典编码不能为空'
                }
            }
        });
    });
</script>
</@layout.body>