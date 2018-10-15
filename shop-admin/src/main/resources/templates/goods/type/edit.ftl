<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/admincp.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/common_select.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/perfect-scrollbar.min.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/common.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/jquery.mousewheel.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/goods/goodsType.js" charset="utf-8"></script>
</@layout.head>
<@layout.body>
<div class="page">
<div class="fixed-bar">
    <div class="item-title">
        <h3>类型管理</h3>
        <ul class="tab-base">
            <li><a href="${base}/goods/type/list"><span>列表</span></a></li>
            <li><a href="${base}/goods/type/forward?id=0"><span>新增</span></a></li>
            <li><a href="javascript:;" class="current"><span>编辑</span></a></li>
        </ul>
    </div>
</div>
<div class="fixed-empty"></div>
<form id="type_form" method="post" action="${base}/goods/type/save">
<table id="prompt" class="table tb-type2">
    <tbody>
    <tr class="space odd">
        <th colspan="12" class="nobg"> <div class="title">
            <h5>操作提示</h5>
            <span class="arrow"></span> </div>
        </th>
    </tr>
    <tr class="odd">
        <td>
            <ul>
                <li>关联规格不是必选项，它会影响商品发布时的规格及价格的录入。不选为没有规格。</li>
                <li>关联品牌不是必选项，它会影响商品发布时的品牌选择。</li>
                <li>属性值可以添加多个，每个属性值之间需要使用逗号隔开。</li>
                <li>选中属性的“显示”选项，该属性将会在商品列表页显示。</li>
            </ul>
        </td>
    </tr>
    </tbody>
</table>
<input type="hidden" name="form_submit" value="ok" />
<input type="hidden" name="goodsType.typeId" value="${type.typeId}" />
<table class="table tb-type2">
    <tbody>
    <tr class="noborder">
        <td class="required" colspan="2"><label class="validation" for="goodsType.typeName">类型：</label></td>
    </tr>
    <tr class="noborder">
        <td class="vatop rowform"><input type="text" class="txt" name="goodsType.typeName" id="t_mane" value="${type.typeName}" /></td>
        <td class="vatop tips"></td>
    </tr>
    <#-- <tr>
        <td class="required" colspan="2"><label class="" for="s_sort">所属分类：</label></td>
    </tr>
    <tr class="noborder">
        <td class="vatop rowform" id="gcategory">
            <input type="hidden" value="${type.gtClassId}" class="mls_id" name="goodsType.gtClassId" />
            <input type="hidden" value="${type.gtClassName}" name="goodsType.gtClassName" class="mls_name">
            <span class="mr10">${type.gtClassName}</span>
            <#if type.gtClassId != 0>
                <input class="edit_gcategory" type="button" value="编辑">
            </#if>
            <select class="class-select" <#if type.gtClassId != 0>style="display: none;" </#if>>
                <option value="0">请选择...</option>
                <#list classList as gc>
                    <option value="${gc.gcId}">${gc.gcName}</option>
                </#list>
            </select>
        </td>
        <td class="vatop tips">选择分类，可关联大分类或更具体的下级分类。（只在后台快捷定位中起作用）</td>
    </tr> -->
    <tr>
        <td class="required" colspan="2"><label class="validation" for="goodsType.typeSort">排序：</label></td>
    </tr>
    <tr class="noborder">
        <td class="vatop rowform"><input type="text" class="txt" name="goodsType.typeSort" id="t_sort" value="${type.typeSort}" /></td>
        <td class="vatop tips">请填写自然数。类型列表将会根据排序进行由小到大排列显示。</td>
    </tr>
    </tbody>
</table>
<div style="width: 100%; float: left; margin: 10px 0; border: solid #DEEFFB; border-width: 0 0 1px 0;">
    <table class="table tb-type2">
        <thead class="thead">
        <tr class="space">
            <th class="required" colspan="15"><label style=" float: left; margin-right: 10px;">选择关联规格：</label>
                <input type="hidden" name="spec_checkbox" id="spec_checkbox" value="" />
                <#-- <div id="speccategory" style=" float: left;">
                    <select class="class-select">
                        <option value="0">请选择...</option>
                        <#list classList as gc>
                            <option value="${gc.gcId}">${gc.gcName}</option>
                        </#list>
                    </select>
                </div>（快捷定位） -->
            </th>
        </tr>
        <tr>
        	<th></th>
           	<th>规格名称</th>
           	<th>规格值</th>
            <th style="text-align: right;" colspan="15"><a class="btns" nctype="spec_hide" href="javascript:viod(0);"><span>隐藏未选项</span></a></th>
        </tr>
        </thead>
    </table>
    <div style="position:relative; overflow: hidden;" id="spec_div">
        <table class="table tb-type2" id="spec_table">
            <input type="hidden" value="" name="spec[form_submit]" nc_type="submit_value" />
            <#if specList??>
                <tbody>
                    <#assign temp = 0/>
                    <#list specList as spec>
                    <tr class="hover edit">
                        <td width="50px">
                            <ul class="nofloat">
                                 <li class="left w33pre h36">
                                     <input class="checkitem" nc_type="change_default_spec_value" type="checkbox" value="${spec.spId}" name="specList[${temp}].spId"
                                     	<#list type.specList as ts>
                                            <#if ts.spId == spec.spId>
                                           checked="checked"
                                            </#if>
                                        </#list>/>
                                 </li>
                            </ul>
                        </td>
                        <td width="300px"> ${spec.spName} </td>
                        <td>${spec.spValue}</td>
                    </tr>
                    <#assign temp = temp + 1/>
                    </#list>
                </tbody>
            <#else>
                <tbody>
                <tr>
                    <td class="tips" colspan="15">还没有规格，赶快去<a href="${base}/goods/spec/list">规格管理</a>添加规格吧！</td>
                </tr>
                </tbody>
            </#if>
        </table>
    </div>
</div>
<div style="width: 100%; float: right; margin: 10px 0; border: solid #DEEFFB; border-width: 0 0 1px 0;">
    <table class="table tb-type2">
        <thead class="thead">
        <tr class="space">
            <th colspan="15"> <label for="member_name" style=" float: left; margin-right: 10px;">选择关联品牌：</label>
                <#-- <div id="brandcategory" style=" float: left;">
                    <select class="class-select">
                        <option value="0">请选择...</option>
                        <#list classList as gc>
                            <option value="${gc.gcId}">${gc.gcName}</option>
                        </#list>
                    </select>
                </div>（快捷定位） -->
            </th>
        </tr>
        <tr>
            <th style="text-align: right;" colspan="15"><a class="btns" nctype="brand_hide" href="javascript:viod(0);"><span>隐藏未选项</span></a></th>
        </tr>
        </thead>
    </table>
    <div style="position:relative; max-height:240px; overflow: hidden;" id="brand_div">
        <table class="table tb-type2" id="brand_table">
            <#assign bd = 0/>
            <#if brandList??>
                <tbody>
                	<tr class="hover">
                        <td>
	                    <#list brandList as brand>
	                        <h6 class="clear" id="brand_h6_${brand_index}">
	                            <#if brand.brandClass == null || !brand.brandClass??>默认<#else>${brand.brandClass}</#if>
	                        </h6>
	                        <ul class="nofloat">
	                            <#list brand.list as b>
	                                <li class="left w33pre h36">
	                                    <input type="checkbox" name="brandList[${bd}].brandId" value="${b.brandId}" id="brand_${b.brandId}"
	                                        <#list type.brandList as tb>
	                                            <#if tb.brandId == b.brandId>
	                                           checked="checked"
	                                            </#if>
	                                        </#list>/>
	                                    <label for="brand_${b.brandId}"
	                                       >${b.brandName}</label>
	                                </li>
	                                <#assign bd = bd + 1/>
	                            </#list>
	                        </ul>
	                    </#list>
	                    </td>
                    </tr>
                </tbody>
            <#else>
                <tbody>
                <tr>
                    <td class="tips" colspan="15">还没有品牌，赶快去<a href="${base}/goods/brand/list">品牌管理</a>添加品牌吧！</td>
                </tr>
                </tbody>
            </#if>
        </table>
    </div>
</div>
<table class="table tb-type2">
    <thead class="thead">
    <tr class="space">
        <th colspan="15">添加属性：</th>
    </tr>
    <tr>
        <!--<th>删除</th>-->
        <th>排序</th>
        <th>属性名称</th>
        <th>属性可选值</th>
        <th class="align-center">显示</th>
        <th class="align-center">操作</th>
    </tr>
    </thead>


        <tbody id="tr_model">
        <tr></tr>
            <#if (type.attributes?size>0)>
            <#list type.attributes as attr>
            <tr>
                <!--<td class="w48"><input type="checkbox" name="attrList[${attr_index}].attrId" value="${attr.attrId}" /></td>-->
                <td class="w48 sort"><input type="text" class="change_default_submit_value" name="attrList[${attr_index}].attrSort" value="${attr.attrSort}" /></td>
                <td class="w25pre name"><input type="text" class="change_default_submit_value" name="attrList[${attr_index}].attrName" value="${attr.attrName}" /></td>
                <td class="w50pre name">${attr.attrValue}<input type="hidden" name="attrList[${attr_index}].attrValue" value="${attr.attrValue}" /></td>
                <td class="align-center power-onoff"><input type="checkbox" class="change_default_submit_value" <#if attr.attrShow == 1>checked="checked" </#if> nc_type="checked_show" />
                    <input type="hidden" name="attrList[${attr_index}].attrShow" value="${attr.attrShow}" /></td>
                <td class="w60 align-center">
                	<a href="${base}/goods/attr/find?id=${attr.attrId}">编辑</a> |
                	<a href="javascript:void(0)" onclick="deleteAttr('${attr.attrId}',$(this));">删除</a>
                </td>
            </tr>
            </#list>
        </#if>
    </tbody>
    <tbody>
    <tr>
        <td colspan="15"><a id="add_type" class="btn-add marginleft" href="JavaScript:void(0);"> <span>添加一个属性</span> </a></td>
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
<script>
    $(function(){
        // 编辑分类时清除分类信息
        $('.edit_gcategory').click(function(){
            $('input[name="class_id"]').val('');
            $('input[name="class_name"]').val('');
        });

        $('#spec_div').perfectScrollbar();
        $('#brand_div').perfectScrollbar();

        var i = 0;
        var tr_model = '<tr class="hover edit">'+
                '<td class="w48 sort"><input type="text" name="attrList[key].attrSort" value="0" /></td>'+
                '<td class="w25pre name"><input type="text" name="attrList[key].attrName" value="" /></td>'+
                '<td class="w50pre name"><input type="text" name="attrList[key].attrValue" value="" style="width:400px;"  placeholder="如要增加多个属性值，请以英文半角“ , ”隔开"/></td>'+
                '<td class="align-center power-onoff"><input type="checkbox" checked="checked" nc_type="checked_show" /><input type="hidden" name="attrList[key].attrShow" value="1" /></td>'+
                '<td class="align-center w60"><a onclick="remove_tr($(this));" href="JavaScript:void(0);">移除</a></td>'+
                '</tr>';
        $("#add_type").click(function(){
            var trLength = $('#tr_model > tr').length;
            if(trLength > 1){
                i = trLength -1;
            }
            $('#tr_model > tr:last').after(tr_model.replace(/key/g, i));
            $.getScript(APP_BASE+"/res/js/admincp.js");
            i++;
        });

        $('input[nc_type="checked_show"]').live('click', function(){
            var o = $(this).next();
            //alert(o.val());
            if(o.val() == '1'){
                o.val('0');
            }else if(o.val() == '0'){
                o.val('1');
            }
        });


        //表单验证
        $('#type_form').validate({
            errorPlacement: function(error, element){
                error.appendTo(element.parent().parent().prev().find('td:first'));
            },

            rules : {
                t_mane: {
                    required : true,
                    maxlength: 20,
                    minlength: 1
                },
                t_sort: {
                    required : true,
                    digits	 : true
                }
            },
            messages : {
                t_mane : {
                    required : '请填写类型名称',
                    maxlength: '类型名称长度应在1-20个字符之间',
                    minlength: '类型名称长度应在1-20个字符之间'
                },
                t_sort: {
                    required : '请填写类型排序',
                    digits : '请填写整数'
                }
            }
        });

        //按钮先执行验证再提交表单
        $("#submitBtn").click(function(){
            spec_check();
            if($("#type_form").valid()){
                $("#type_form").submit();
            }
        });

        $('input[nc_type="change_default_spec_value"]').click(function(){
            $(this).parents('table:first').find("input[nc_type='submit_value']").val('ok');
        });

        $('input[class="change_default_submit_value"]').change(function(){
            $(this).parents('tr:first').find("input[nc_type='submit_value']").val('ok');
        });

        $('input[class="brand_change_default_submit_value"]').change(function(){
            $(this).parents('tbody:first').find("input[nc_type='submit_value']").val('ok');
        });

        // 所属分类
        $("#gcategory > select").live('change',function(){
            spec_scroll($(this));
            brand_scroll($(this));
        });

        // 规格搜索
        $("#speccategory > select").live('change',function(){
            spec_scroll($(this));
        });
        // 品牌搜索
        $("#brandcategory > select").live('change',function(){
            brand_scroll($(this));
        });

        // 规格隐藏未选项
        $('a[nctype="spec_hide"]').live('click',function(){
        	spec_hide('spec');
        });
        // 规格全部显示
        $('a[nctype="spec_show"]').live('click',function(){
        	spec_show('spec');
        });
        // 品牌隐藏未选项
        $('a[nctype="brand_hide"]').live('click',function(){
            checked_hide('brand');
        });
        // 品牌全部显示
        $('a[nctype="brand_show"]').live('click',function(){
            checked_show('brand');
        });
    });
    var specScroll = 0;
    function spec_scroll(o){
        var id = o.val();
        if(!$('#spec_h6_'+id).is('h6')){
            return false;
        }
        $('#spec_div').scrollTop(-specScroll);
        var sp_top = $('#spec_h6_'+id).offset().top;
        var div_top = $('#spec_div').offset().top;
        $('#spec_div').scrollTop(sp_top-div_top);
        specScroll = sp_top-div_top;
    }

    var brandScroll = 0;
    function brand_scroll(o){
        var id = o.val();
        if(!$('#brand_h6_'+id).is('h6')){
            return false;
        }
        $('#brand_div').scrollTop(-brandScroll);
        var sp_top = $('#brand_h6_'+id).offset().top;
        var div_top = $('#brand_div').offset().top;
        $('#brand_div').scrollTop(sp_top-div_top);
        brandScroll = sp_top-div_top;
    }

    // 隐藏未选项
    function checked_show(str) {
        $('#'+str+'_table').find('h6').show().end().find('li').show();
        $('a[nctype="'+str+'_show"]').attr('nctype',str+'_hide').children().html('隐藏未选项');
    }

    // 显示全部选项
    function checked_hide(str) {
        $('#'+str+'_table').find('h6').hide();
        $('#'+str+'_table').find('input[type="checkbox"]').parents('li').hide();
        $('#'+str+'_table').find('input[type="checkbox"]:checked').parents('li').show();
        $('a[nctype="'+str+'_hide"]').attr('nctype',str+'_show').children().html('全部显示');
    }

    function spec_check(){
        var id='';
        $('input[nc_type="change_default_spec_value"]:checked').each(function(){
            if(!isNaN($(this).val())){
                id += $(this).val();
            }
        });
        if(id != ''){
            $('#spec_checkbox').val('ok');
        }else{
            $('#spec_checkbox').val('');
        }
    }

    function remove_tr(o){
        o.parents('tr:first').remove();
    }
    // 所属分类
    //gcategoryInit('gcategory');
    // 规格搜索
    //gcategoryInit('speccategory');
    // 品牌搜索
    //gcategoryInit('brandcategory');
    
    function deleteAttr(id,o){
    	$.ajax({
	    	url : "${base}/goods/type/deleteAttr",
	        type : 'post',
	        data : {'attrId' : id},
	        dataType : 'json',
	        success : function(data){
	            if(data.success){
	            	o.parents('tr:first').remove();
	            }else{
	            	alert("删除失败!");
	            }
	        }
	    });
    }

</script>
</@layout.body>