<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/jquery.edit.js"></script>
<script type="text/javascript">
    $(function(){
        $('#shopPointsGoodsSubmit').click(function(){
           $('#formSearch').submit();
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
            <h3>积分商品表管理</h3>
            <ul class="tab-base">
                <li><a href="JavaScript:void(0);" class="current"><span>管理</span></a></li>
                <li><a href="${base}/shopPointsGoods/forward"><span>新增</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form method="post" name="formSearch" id="formSearch" action="${base}/shopPointsGoods/list">
        <input type="hidden" name="pageNo" value="${pager.pageNo}">
        <table class="tb-type1 noborder search">
            <tbody>
            <tr>
            <td>礼品名称：</td>
            <td><input type="text" value="${shopPointsGoods.pointsGoodsName}" name="pointsGoodsName" class="txt"></td>
                <td><a href="javascript:void(0);" id="shopPointsGoodsSubmit" class="btn-search " title="查询">&nbsp;</a>
                    <a href="${base}/shopPointsGoods/list" class="btns "><span>撤销检索</span></a>
                </td>
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
    <form method="post" id='form_list' action="${base}/shopPointsGoods/delete">
        <input type="hidden" name="form_submit" value="ok" />
        <table class="table tb-type2">
            <thead>
            <tr class="thead">
            <th class="w24"></th>
              <th class="">礼品图片</th>
             <th class="">礼品名称</th>
              <th class="">兑换积分</th>
             <th class="">礼品原价</th>
            <th class="">库存</th>
            <th class="">浏览</th>
             <th class="">售出</th>
             <th class="">上架</th>
             <th class="">推荐</th>
            <th class="w72 align-center">操作</th>
            </tr>
            </thead>
            <tbody>
            <#list pager.result as shopPointsGoods>
	            <tr class="hover edit">
	            	<td>
	                	<input value="${shopPointsGoods.id}" class="checkitem" type="checkbox" name="ids">
	                </td>
	                <td>
	                <div class="size-56x56"><span class="thumb size-56x56"><i></i>
	                    <img src="${imgServer}${shopPointsGoods.pointsGoodsImage}" onload="javascript:DrawImage(this,56,56);"/>
	                </span></div>
	                </td>
	         	    <td>
	                	${shopPointsGoods.pointsGoodsName}
	                </td>
	            
	                <td>
	                		${shopPointsGoods.pointsnums}
	                </td>
	                 <td>
	                		${shopPointsGoods.pointsGoodsStorePrice}
	                </td>
	                 <td>
	                		${shopPointsGoods.pointsGoodsStorage}
	                </td>
                   <td>
	                		${shopPointsGoods.pointsGoodsClick}
	                </td>
	                <td>
	                		${shopPointsGoods.salenum}
	                </td>
	               
	                <td>
	                	<#if shopPointsGoods.pointsGoodsShow==0 || shopPointsGoods.state != 2>	
	                		未上架
	                	<#else>
	                		已上架
	                	</#if>
	                </td>
	                <td>
	                	<#if shopPointsGoods.pointsGoodsCommend==0>	
	                		未推荐
	                	<#else>
	                		已推荐
	                	</#if>	
	                </td>
	                
	                <td class="align-center">
	                <#if  shopPointsGoods.state == 4>
	                	<a href="${base}/shopPointsGoods/forward?id=${shopPointsGoods.id}">审核不通过</a>
	                <#else>
	                    <a href="${base}/shopPointsGoods/forward?id=${shopPointsGoods.id}">编辑</a>
	                    &nbsp;|&nbsp;
	                    <a href="javascript:;" onclick="delRow(this)" >删除</a>
	                    <#if shopPointsGoods.state == 1 && shopPointsGoods.pointsGoodsShow == 1>
	                    	&nbsp;|&nbsp;
	                    	<a href="${base}/shopPointsGoods/forward?id=${shopPointsGoods.id}">审核</a>
	                    </#if>
	                </#if>
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
		             <td colspan="30">
		                <@layout.pager pager/>
		              </td>
	            </tr>
            </tfoot>
        </table>
    </form>
</div>
</@layout.body>
