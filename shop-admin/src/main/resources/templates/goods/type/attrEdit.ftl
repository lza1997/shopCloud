	<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/admincp.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/common_select.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/perfect-scrollbar.min.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/common.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/jquery.mousewheel.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/jquery.edit.js" charset="utf-8"></script>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>类型管理</h3>
            <ul class="tab-base">
                <li><a href="${base}/goods/type/list"><span>列表</span></a></li>
                <li><a href="${base}/goods/type/forward?id=0"><span>新增</span></a></li>
                <li><a href="javascript:;" class="current"><span>编辑属性</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form id="attr_form" method="post" action="${base}/goods/attr/save">
        <input type="hidden" name="form_submit" value="ok" />
        <input type="hidden" name="attrId" value="${attr.attrId}" />
        <input type="hidden" name="typeId" value="${attr.typeId}" />
        <table class="table tb-type2">
            <tbody>
            <tr class="noborder">
                <td class="required" colspan="2"><label class="validation" for="attrName">属性名称</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" class="txt" name="attrName" id="attr_name" value="${attr.attrName}" /></td>
                <td class="vatop tips">请填写常用的商品属性的名称；例如：材质；价格区间等</td>
            </tr>
            <tr>
                <td class="required" colspan="2"><label class="validation" for="attrSort">排序</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" class="txt" name="attrSort" id="attr_sort" value="${attr.attrSort}" /></td>
                <td class="vatop tips"> 请填写自然数。属性列表将会根据排序进行由小到大排列显示。</td>
            </tr>
            <tr>
                <td class="required" colspan="2"><label>是否显示</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform onoff"><label for="attr_show1" class="cb-enable <#if attr.attrShow == 1>selected</#if>"><span>是</span></label>
                    <label for="attr_show0" class="cb-disable <#if attr.attrShow == 0>selected</#if>"><span>否</span></label>
                    <input id="attr_show1" name="attrShow" <#if attr.attrShow == 1>checked="checked"</#if> value="1" type="radio" />
                    <input id="attr_show0" name="attrShow" <#if attr.attrShow == 0>checked="checked"</#if> value="0" type="radio" />
                </td>
            </tr>
            </tbody>
        </table>
        <table class="table tb-type2 ">
            <thead class="thead">
            <tr class="space">
                <th colspan="15"></th>
            </tr>
            <tr class="noborder">
                <th>删除</th>
                <th>排序</th>
                <th>属性可选值</th>
                <th></th>
                <th class="align-center">操作</th>
            </tr>
            </thead>
            <tbody id="tr_model">
            <tr></tr>
                <#list attr.avList as av>
                    <tr class="hover edit">
                        <td class="w48"><input type="checkbox" name="avList[${av_index}].delSign" value="${av.attrValueId}" /><input type="hidden" name="avList[${av_index}].attrValueId" value="${av.attrValueId}" /></td>
                        <td class="w48 sort"><input type="text" nc_type="change_default_submit_value" name="avList[${av_index}].attrValueSort" value="${av.attrValueSort}" /></td>
                        <td class="w270 name"><input type="text" nc_type="change_default_submit_value" name="avList[${av_index}].attrValueName" value="${av.attrValueName}" /></td>
                        <td></td>
                        <td class="w150 align-center"></td>
                    </tr>
                </#list>
            </tbody>
            <tbody>
            <tr>
                <td colspan="15"><a class="btn-add marginleft" id="add_type" href="JavaScript:void(0);"> <span>添加一个属性值</span> </a></td>
            </tr>
            </tbody>
        </table>
        <table class="table tb-type2">
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
        var i=$("input[name^='avList'][name$='attrValueName']").length;
        var tr_model = '<tr class="hover edit">'+
                '<td class="w48"></td><td class="w48 sort"><input type="text" name="avList[key].attrValueSort" value="0" /></td>'+
                '<td class="w270 name"><input type="text" name="avList[key].attrValueName" value="" /></td>'+
                '<td></td><td class="w150 align-center"><a onclick="remove_tr($(this));" href="JavaScript:void(0);">删除</a></td>'+
        '</tr>';
        $("#add_type").click(function(){
            $('#tr_model > tr:last').after(tr_model.replace(/key/g,i));
            $.getScript(APP_BASE+"/res/js/admincp.js");
            i++;
        });

        //表单验证
        $('#attr_form').validate({
            errorPlacement: function(error, element){
                error.appendTo(element.parent().parent().prev().find('td:first'));
            },

            rules : {
                attr_name: {
                    required : true,
                    maxlength: 10,
                    minlength: 1
                },
                attr_sort: {
                    required : true,
                    digits	 : true
                }
            },
            messages : {
                attr_name : {
                    required : '属性值名称不能为空',
                    maxlength: '属性值名称不能超过10个字符',
                    minlength: '属性值名称不能超过10个字符'
                },
                attr_sort: {
                    required : '排序不能为空',
                    digits   : '排序值只能为数字'
                }
            }
        });

        //按钮先执行验证再提交表单
        $("#submitBtn").click(function(){
            if($("#attr_form").valid()){
                $("#attr_form").submit();
            }
        });
    });

    function remove_tr(o){
        o.parents('tr:first').remove();
    }
</script>
</@layout.body>