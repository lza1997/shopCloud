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
            <h3>API管理</h3>
            <ul class="tab-base">
                <li><a href="${base}/doc/api/list?typeid=${typeid}"><span>列表</span></a></li>
                <li><a href="javascript:void(0);" class="current"><span>新增</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form id="spec_form" method="post" action="${base}/doc/api/saveOrUpdate">
    	<input type="hidden" name="typeid" value="${typeid}"/>
        <table class="table tb-type2">
            <tbody>
            <tr class="noborder">
                <td class="required" colspan="2"><label class="validation" for="name">名称：</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" class="txt" name="name" id="name" /></td>
                <td class="vatop tips">请填写API名称。</td>
            </tr>
            
            <tr>
                <td class="required" colspan="2"><label class="validation" for="sort">排序：</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" class="txt" name="sort" id="sort" value="0" /></td>
                <td class="vatop tips">请填写自然数。列表将会根据排序进行由小到大排列显示。</td>
            </tr>
            
            <tr>
                <td class="required" colspan="2"><label class="validation" for="status">状态：</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform">
                	<input type="radio" name="status" value="1" checked />显示
                	<input type="radio" name="status" value="0" />不显示
                </td>
                <td class="vatop tips">控制前台是否显示。</td>
            </tr>
            
            <tr>
                <td class="required" colspan="2"><label class="validation" for="description">描述：</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform">
                	<textarea name="description" style="height:100px;"></textarea>
                </td>
                <td class="vatop tips">API说明信息</td>
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
                    maxlength: '规格名称长度应在1-20个字符之间',
                    minlength: '规格名称长度应在1-20个字符之间'
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