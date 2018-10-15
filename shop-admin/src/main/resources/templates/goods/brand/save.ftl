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
            <h3>品牌</h3>
            <ul class="tab-base">
                <li><a href="${base}/goods/brand/list" ><span>管理</span></a></li>
                <li><a href="JavaScript:void(0);" class="current"><span>新增</span></a></li>
                <li><a href="${base}/goods/brand/applyList"><span>待审核</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form id="brand_form" enctype="multipart/form-data" method="post" action="${base}/goods/brand/save">
        <input type="hidden" name="form_submit" value="ok" />
        <table class="table tb-type2 nobdb">
            <tbody>
            <tr class="noborder">
                <td colspan="2" class="required"><label class="validation">品牌名称:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" value="" name="brandName" id="brand_name" class="txt"></td>
                <td class="vatop tips"></td>
            </tr>
            <tr>
                <td colspan="2" class="required">品牌分类: </td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform" id="gcategory">
                    <input type="hidden" value="" name="classId" class="mls_id">
                    <input type="hidden" value="" name="brandClass" class="mls_name">
                    <select class="class-select">
                        <option value="0">请选择...</option>
                        <#list list as gc>
                            <option value="${gc.gcId}">${gc.gcName}</option>
                        </#list>
                    </select></td>
                <td class="vatop tips">选择分类，可关联大分类或更具体的下级分类。（只在后台快捷定位中起作用）</td>
            </tr>
            <tr>
                <td colspan="2" class="required">品牌图片标识:  </td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><span class="type-file-box"><input type='text' name='textfield' id='textfield1' class='type-file-text' />
            <input type='button' name='button' id='button1' value='' class='type-file-button' />
            <input name="imageFile" type="file" class="type-file-file" id="pic" size="30" hidefocus="true" nc_type="change_pic">
            </span></td>
                <td class="vatop tips">支持格式gif,jpg,jpeg,png</td>
            </tr>
            <tr>
                <td colspan="2" class="required">是否推荐: </td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform onoff">
                    <label for="brand_recommend1" class="cb-enable"><span>是</span></label>
                    <label for="brand_recommend0" class="cb-disable selected"><span>否</span></label>
                    <input id="brand_recommend1" name="brandRecommend"  value="1" type="radio">
                    <input id="brand_recommend0" name="brandRecommend" value="0" type="radio">
                </td>
                <td class="vatop tips"></td>
            </tr>
            <!-- <tr>
                <td colspan="2" class="required">审核状态: </td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform onoff"><label for="brand_brandApply1" class="cb-enable"><span>通过</span></label>
                    <label for="brand_brandApply0" class="cb-disable selected"><span>审核中</span></label>
                    <input id="brand_brandApply1" name="brandApply" value="1" type="radio">
                    <input id="brand_brandApply0" name="brandApply" value="0" type="radio">
                </td>
                <td class="vatop tips"></td>
            </tr> -->
            
            <tr>
                <td colspan="2" class="required">排序: </td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" name="brandSort" id="brand_sort" class="txt">
                </td>
                <td class="vatop tips">数字范围为0~255，数字越小越靠前</td>
            </tr>
            </tbody>
            <tfoot>
            <tr class="tfoot">
                <td colspan="2" ><a href="JavaScript:void(0);" class="btn" id="submitBtn"><span>提交</span></a></td>
            </tr>
            </tfoot>
        </table>
    </form>
</div>
<script type="text/javascript">
    $("#pic").change(function(){
        $("#textfield1").val($(this).val());
    });
    //按钮先执行验证再提交表单
    $(function(){$("#submitBtn").click(function(){
        if($("#brand_form").valid()){
            $("#brand_form").submit();
        }
        });
    });
    //
    $(document).ready(function(){
        $("#brand_form").validate({
            errorPlacement: function(error, element){
                error.appendTo(element.parent().parent().prev().find('td:first'));
            },
            success: function(label){
                label.addClass('valid');
            },
            rules : {
                brandName : {
                    required : true,
                    remote   : {
                        url :APP_BASE+'/goods/brand/validate',
                        type:'get',
                        data:{
                            brandName : function(){
                                return $('#brand_name').val();
                            },
                            brandId  : 0
                        }
                    }
                },
                brandSort : {
                    number   : true
                }
            },
            messages : {
                brandName : {
                    required : '品牌名称不能为空',
                    remote   : '该品牌名称已经存在了，请您换一个'
                },
                brandSort  : {
                    number   : '排序仅可以为数字'
                }
            }
        });
    });
    gcategoryInit('gcategory');
</script>
</@layout.body>