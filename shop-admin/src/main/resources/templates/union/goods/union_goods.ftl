<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/admincp.js" charset="utf-8"></script>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>商品</h3>
            <ul class="tab-base">
                <li><a href="${base}/unionGoods/list"><span>列表</span></a></li>
            <#if goods.id?exists && goods.id!=''>
            	<li><a href="${base}/unionGoods/forward"><span>新增</span></a></li>
                <li><a href="javascript:void(0);" class="current"><span>修改</span></a></li>
            <#else>
                <li><a href="javascript:void(0);" class="current"><span>新增</span></a></li>
            </#if>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form id="goods_form" method="post" action="${base}/unionGoods/saveOrUpdate">
    	<#if goods.id?exists && goods.id!=''>
    		<input type="hidden" name="id" value="${goods.id!''}" />
    	</#if>
        <table class="table tb-type2">
            <tbody>
            	
            	<tr class="noborder">
		            <td colspan="2" class="required"><label class="validation" for="classId">商品分类:</label></td>
		        </tr>
		        <tr class="noborder">
		            <td class="vatop rowform">
						<select id="classId" name="classId">
							<option value="">请选择...</option>
							<#list goodsClasss as class>
								<option <#if goods.classId==class.id>selected="selected"</#if> value="${class.id}">&nbsp;&nbsp;${class.name}</option>
								<#list class.classList as c>
	                                	<option <#if goods.classId==c.id>selected="selected"</#if> value="${c.id}">&nbsp;&nbsp;&nbsp;&nbsp;${c.name}</option>
	                                	<#list c.classList as c3>
	                                		<option <#if goods.classId==c3.id>selected="selected"</#if> value="${c3.id}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${c3.name}</option>
	                                	</#list>
		                        </#list>
							</#list>
						</select>		
					</td>
		            <td class="vatop tips"></td>
		        </tr>
            	
	            <tr class="noborder">
	                <td class="required" colspan="2"><label class="validation" for="skuId">京东商品id号(skuId)：</label></td>
	            </tr>
	            <tr class="noborder">
	                <td class="vatop rowform"><input type="text" class="txt" name="skuId" id="skuId"  value="${goods.skuId!''}"/></td>
	                <td class="vatop tips">请填写京东商品id号(skuId)。</td>
	            </tr>
	            
	            <tr class="noborder">
	                <td class="required" colspan="2"><label class="validation" for="imageUrl">京东商品图片地址：</label></td>
	            </tr>
	            <tr class="noborder">
	                <td class="vatop rowform"><input type="text" class="txt" name="imageUrl" id="imageUrl"  value="${goods.imageUrl!''}"/></td>
	                <td class="vatop tips">请填写京东商品图片地址，需要包含“http”，图片无需上传，复制京东单品图片地址即可。</td>
	            </tr>
	            
	            <tr>
	                <td class="required" colspan="2"><label class="validation" for="status">状态：</label></td>
	            </tr>
	            <tr class="noborder">
	                <td class="vatop rowform onoff">
		                <label for="showFlag1" class="cb-enable <#if !goods.showFlag?exists ||goods.showFlag == 1>selected</#if>" title="上架"><span>上架</span></label>
	                    <label for="showFlag0" class="cb-disable <#if goods.showFlag == 0>selected</#if>" title="下架"><span>下架</span></label>
	                    <input id="showFlag1" name="showFlag" <#if !goods.showFlag?exists ||goods.showFlag == 1>checked="checked"</#if>  value="1" type="radio">
	                    <input id="showFlag0" name="showFlag" <#if goods.showFlag == 0>checked="checked" </#if> value="0" type="radio">
	                </td>
	                <td class="vatop tips">控制前台是否显示。</td>
	            </tr>
	            
	            <tr>
	                <td class="required" colspan="2"><label class="validation" for="sort">排序：</label></td>
	            </tr>
	            <tr class="noborder sort">
	                <td class="vatop rowform"><input type="text" name="sort" id="sort" value="${goods.sort!'1'}"/></td>
	                <td class="vatop tips">请填写自然数。列表将会根据排序进行由大到小排列显示。</td>
	            </tr>
	            
	            <tr>
	                <td class="required" colspan="2">如在添加商品时遇到code失效，请点此登录&nbsp;<a href="${getCodeUrl!''}" target="_blank">重新授权<a></td>
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
        $('#goods_form').validate({
            errorPlacement: function(error, element){
                error.appendTo(element.parent().parent().prev().find('td:first'));
            },

            rules : {
                skuId: {required : true},
                classId:{required : true},
                imageUrl:{required : true},
                sort:{number : true}
            },
            messages : {
                skuId : {required : '请填写京东商品id号(skuId)'},
                classId:{required : '请选择商品分类'},
                imageUrl:{required : '请填写京东商品图片地址'},
                 sort:{number : '排序仅可以为数字'}
            }
        });

        //按钮先执行验证再提交表单
        $("#submitBtn").click(function(){
            if($("#goods_form").valid()){
                $("#goods_form").submit();
            }
        });
    });

</script>
</@layout.body>