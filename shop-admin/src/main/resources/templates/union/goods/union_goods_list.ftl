<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/jquery.edit.js"></script>
<script type="text/javascript">
    $(function(){
        $('#ncsubmit').click(function(){
           $('#formSearch').submit();
        });
        
        $(".create_index").click(function (){
        	$.get("${base}/unionGoods/createIndex",function (data){
        		if(data){
        			alert("索引生成成功");
        		}else{
        			alert("索引生成失败");
        		}	
        	});
        });
    });
    function delBrand(){
        var items = $("input[name='ids']:checked").length;
        if (items==0) {
            alert("请至少选择一个要删除的项目");
        }else{
            if(confirm('您确定要删除吗?')){
                $('#form_list').submit();
            }
        }
    }
    function delRow(obj){
        if(confirm('您确定要删除吗?')) {
            $(obj).parents("tr").find("td:eq(0)>input").attr("checked", true);
            $('#form_list').submit();
        }
    }
</script>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>商品</h3>
            <ul class="tab-base">
                <li><a href="JavaScript:void(0);" class="current"><span>管理</span></a></li>
                <li><a href="${base}/unionGoods/forward"><span>新增</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form method="post" name="formSearch" id="formSearch" action="${base}/unionGoods/list">
        <input type="hidden" name="pageNo" value="${pager.pageNo}">
        <table class="tb-type1 noborder search">
            <tbody>
            <tr>
                <th><label for="skuId">商品skuId:</label></th>
                <td><input class="txt" name="skuId" id="skuId" value="<#if pager.condition.skuId!=0>${pager.condition.skuId}</#if>" type="text"></td>
                <th><label for="goodsName">名称:</label></th>
                <td><input class="txt" name="goodsName" id="goodsName" value="${pager.condition.goodsName}" type="text"></td>
                <th><label for="goodsName">商品分类:</label></th>
                <td>
					<select id="classId" name="classId">
						<option value="">请选择...</option>
						<#list goodsClasss as class>
							<option <#if pager.condition.classId==class.id>selected="selected"</#if> value="${class.id}">&nbsp;&nbsp;${class.name}</option>
							<#list class.classList as c>
                                	<option <#if pager.condition.classId==c.id>selected="selected"</#if> value="${c.id}">&nbsp;&nbsp;&nbsp;&nbsp;${c.name}</option>
                                	<#list c.classList as c3>
                                		<option <#if goods.classId==c3.id>selected="selected"</#if> value="${c3.id}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${c3.name}</option>
                                	</#list>
	                        </#list>
						</#list>
					</select>		
				</td>
                <td><a href="javascript:void(0);" id="ncsubmit" class="btn-search " title="查询">&nbsp;</a>
                    <a href="${base}/unionGoods/list" class="btns "><span>撤销检索</span></a>
                </td>
            </tr>
            <tr>
            	<td colspan="7"><a href="javascript:void(0)" class="btns create_index"><span>生成索引</span></a></td>
            </tr>
            </tbody>
        </table>
    </form>
   	<#--
    <table class="table tb-type2" id="prompt">
        <tbody>
        <tr class="space odd">
            <th colspan="12"><div class="title"><h5>操作提示</h5><span class="arrow"></span></div></th>
        </tr>
        <tr>
            <td>
                <ul>
                    <li></li>
                </ul>
            </td>
        </tr>
        </tbody>
    </table>
    -->
    <form method="post" id='form_list' action="${base}/unionGoods/delete">
        <input type="hidden" name="form_submit" value="ok" />
        <table class="table tb-type2">
            <thead>
            <tr class="thead">
                <th class="w24"></th>
                <th class="w48">排序</th>
                <th class="w96 align-center">商品skuId</th>
                <th colspan="2">商品名称</th>
                <th class="w150">分类</th>
                <th class="w60 align-center">商品价格</th>
                <th class="w72 align-center">PC佣金比例</th>
                <th class="w72 align-center">无线佣金比例</th>
                <th class="w84 align-center">推广时间</th>
                <th class="w72 align-center">操作</th>
            </tr>
            </thead>
            <tbody>
            <#list pager.result as goods>
	            <tr class="hover edit">
	                <td>
	                	<input value="${goods.id}" class="checkitem" type="checkbox" name="ids">
	                </td>
	                <td class="sort">
	                    <span class=" editable"  nc_type="inline_edit" fieldname="sort" fieldid="${goods.id}" datatype="pint" modUrl="${base}/uniongoods/modifySort"maxvalue="255" title="可编辑">
	                          ${goods.sort!'1'}
	                    </span>
	                </td>
	                <td class="align-center">${goods.skuId!''}</td>
	                <td class="w60 picture">
	                	<div class="size-56x56">
	                		<span class="thumb size-56x56">
		                		<i></i>
		                    	<img src="${goods.imageUrl!''}" height="56" onload="javascript:DrawImage(this,56,56);"/>
		                	</span>
	                	</div>
                	</td>
                	<td class="goods-name">
                		<p><span><a href="${goods.materialUrl!''}" target="_blank">${goods.goodsName!''}</a></span></p>
	                    <p class="store">商品来源:<#if goods.source==1>京东</#if></p>
	                </td>
	                <td>
                		<p>${goods.className}</p>
	                    <p class="store">${goods.classNames}</p>
	                </td>
	                <#--
	                <td class="name">
	                	<span class="editable" nc_type="inline_edit" fieldname="goodsName" modUrl="${base}/uniongoods/modifyGoodsName" fieldid="${goods.id}" required="1" title="可编辑">${goods.goodsName}</span>
	                </td>
	                -->
	                <td class="align-center">￥${goods.unitPrice!''}</td>
	                <td class="align-center">${goods.commisionRatioPc!''}%</td>
	                <td class="align-center">${goods.commisionRatioWl!''}%</td>
	                <td class="align-center">
					<#if goods.startDate?? && goods.endDate??>
	                	${goods.startDateStr?string("yyyy-MM-dd")}<br/>至<br/>${goods.endDateStr?string("yyyy-MM-dd")}
                	</#if>
					</td>
	                
	                <td class="align-center">
	                    <a href="${base}/unionGoods/forward?id=${goods.id}">编辑</a>
	                    &nbsp;|&nbsp;
	                    <a href="javascript:;" onclick="delRow(this)" >删除</a>
	                </td>
	            </tr>
	        </#list>
            </tbody>
            <tfoot>
	            <tr class="tfoot">
		            <td><input type="checkbox" class="checkall" id="checkallBottom"></td>
		            <td colspan="2">
		            	<label for="checkallBottom">全选</label>
		                &nbsp;&nbsp;
		                <a href="JavaScript:void(0);" class="btn" onclick="delBrand()"><span>删除</span></a>
		             </td>
		             <td colspan="7">
		                <@layout.pager pager/>
		              </td>
	            </tr>
            </tfoot>
        </table>
    </form>
</div>
</@layout.body>