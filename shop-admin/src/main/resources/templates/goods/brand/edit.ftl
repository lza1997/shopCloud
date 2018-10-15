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
                <li><a href="${base}/goods/brand/list"><span>管理</span></a></li>
                <li><a href="${base}/goods/brand/forward?id=0"><span>新增</span></a></li>
                <li><a href="${base}/goods/brand/applyList"><span>待审核</span></a></li>
                <li><a href="JavaScript:void(0);" class="current"><span>编辑</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form id="brand_form" enctype="multipart/form-data" method="post" name="form1" action="${base}/goods/brand/edit">
        <input type="hidden" name="form_submit" value="ok" />
        <input type="hidden" name="brandId" value="${brand.brandId}" />
        <table class="table tb-type2">
            <tbody>
            <tr class="noborder">
                <td colspan="2" class="required"><label class="validation">品牌名称:</label>
                </td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" value="${brand.brandName}" name="brandName" id="brand_name" class="txt"></td>
                <td class="vatop tips"></td>
            </tr>
            <tr>
                <td colspan="2" class="required">所属分类:
                </td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform" id="gcategory">
                    <input type="hidden" value="${brand.classId}" name="classId" class="mls_id">
                    <input type="hidden" value="${brand.brandClass}" name="brandClass" class="mls_name">
                    <span class="mr10">${brand.brandClass}</span>
                    <#if brand.classId != 0>
                        <input class="edit_gcategory" type="button" value="编辑">
                    </#if>
                    <select class="class-select" <#if brand.classId != 0>style="display: none;" </#if>>
                        <option value="0">请选择...</option>
                    <#list list as gc>
                        <option value="${gc.gcId}">${gc.gcName}</option>
                    </#list>
                    </select></td>
                <td class="vatop tips">选择分类，可关联大分类或更具体的下级分类。（只在后台快捷定位中起作用）</td>
            </tr>
            <tr>
                <td colspan="2" class="required">品牌图片标识:
                </td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><span class="type-file-box"><input type='text' name='textfield' id='textfield1' class='type-file-text' />
            <input type='button' name='button' id='button1' value='' class='type-file-button' />
            <input name="imageFile" type="file" class="type-file-file" id="pic" size="30" hidefocus="true" nc_type="change_pic">
            </span></td>
                <td class="vatop tips">品牌LOGO尺寸要求宽度为150像素，高度为50像素、比例为3:1的图片；支持格式gif,jpg,png</td>
            </tr>
            <tr>
                <td colspan="2" class="required">是否推荐:
                </td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform onoff"><label for="brand_recommend1" class="cb-enable <#if brand.brandRecommend == 1>selected</#if>" title="是"><span>是</span></label>
                    <label for="brand_recommend0" class="cb-disable <#if brand.brandRecommend == 0>selected</#if>" title="否"><span>否</span></label>
                    <input id="brand_recommend1" name="brandRecommend" <#if brand.brandRecommend == 1>checked="checked" </#if>  value="1" type="radio">
                    <input id="brand_recommend0" name="brandRecommend" <#if brand.brandRecommend == 0>checked="checked" </#if> value="0" type="radio"></td>
                <td class="vatop tips"></td>
            </tr>
            <tr>
                <td colspan="2" class="required">审核状态: </td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform onoff"><label for="brand_brandApply1" class="cb-enable <#if brand.brandApply == 1>selected</#if>"><span>通过</span></label>
                    <label for="brand_brandApply0" class="cb-disable <#if brand.brandApply == 0>selected</#if>"><span>审核中</span></label>
                    <input id="brand_brandApply1" name="brandApply" <#if brand.brandApply == 1>checked="checked" </#if> value="1" type="radio">
                    <input id="brand_brandApply0" name="brandApply" <#if brand.brandApply == 0>checked="checked" </#if> value="0" type="radio">
                </td>
                <td class="vatop tips"></td>
            </tr>
            <tr>
                <td colspan="2" class="required">排序:
                </td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" value="${brand.brandSort}" name="brandSort" id="brand_sort" class="txt"></td>
                <td class="vatop tips"></td>
            </tr>
            </tbody>
            <tfoot>
            <tr class="tfoot">
                <td colspan="15" ><a href="JavaScript:void(0);" class="btn" id="submitBtn"><span>提交</span></a></td>
            </tr>
            </tfoot>
        </table>
    </form>
</div>
<script>
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
                            brandId  : '${brand.brandId}'
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