<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/jquery.edit.js"></script>
<script type="text/javascript">
    $(function(){
        $('#shopPMansongRuleSubmit').click(function(){
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
            <h3>满就送活动规则管理</h3>
            <ul class="tab-base">
                <li><a href="JavaScript:void(0);" class="current"><span>管理</span></a></li>
                <li><a href="${base}/shopPMansongRule/forward"><span>新增</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form method="post" name="formSearch" id="formSearch" action="${base}/shopPMansongRule/list">
        <input type="hidden" name="pageNo" value="${pager.pageNo}">
        <table class="tb-type1 noborder search">
            <tbody>
            <tr>
                <th><label for="ruleId">规则编号:</label></th>
				<td><input class="txt" name="ruleId" id="ruleId" value="${pager.condition.ruleId}" type="text"></td>
                <th><label for="mansongId">活动编号:</label></th>
				<td><input class="txt" name="mansongId" id="mansongId" value="${pager.condition.mansongId}" type="text"></td>
                <th><label for="level">规则级别(1/2/3):</label></th>
				<td><input class="txt" name="level" id="level" value="${pager.condition.level}" type="text"></td>
                <th><label for="price">级别价格:</label></th>
				<td><input class="txt" name="price" id="price" value="${pager.condition.price}" type="text"></td>
                <th><label for="shippingFree">免邮标志(0-不免邮/1-免邮费):</label></th>
				<td><input class="txt" name="shippingFree" id="shippingFree" value="${pager.condition.shippingFree}" type="text"></td>
                <th><label for="discount">减现金优惠金额:</label></th>
				<td><input class="txt" name="discount" id="discount" value="${pager.condition.discount}" type="text"></td>
                <th><label for="giftName">礼品名称:</label></th>
				<td><input class="txt" name="giftName" id="giftName" value="${pager.condition.giftName}" type="text"></td>
                <th><label for="giftLink">礼品链接:</label></th>
				<td><input class="txt" name="giftLink" id="giftLink" value="${pager.condition.giftLink}" type="text"></td>
                <td><a href="javascript:void(0);" id="shopPMansongRuleSubmit" class="btn-search " title="查询">&nbsp;</a>
                    <a href="${base}/shopPMansongRule/list" class="btns "><span>撤销检索</span></a>
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
    <form method="post" id='form_list' action="${base}/shopPMansongRule/delete">
        <table class="table tb-type2">
            <thead>
            <tr class="thead">
                <th class="w24"></th>
                <th class="">规则编号</th>
                <th class="">活动编号</th>
                <th class="">规则级别(1/2/3)</th>
                <th class="">级别价格</th>
                <th class="">免邮标志(0-不免邮/1-免邮费)</th>
                <th class="">减现金优惠金额</th>
                <th class="">礼品名称</th>
                <th class="">礼品链接</th>
                <th class="w72 align-center">操作</th>
            </tr>
            </thead>
            <tbody>
            <#list pager.result as shopPMansongRule>
	            <tr class="hover edit">
	                <td>
	                	<input value="${shopPMansongRule.id}" class="checkitem" type="checkbox" name="ids">
	                </td>
				<td><a href="${base}/shopPMansongRule/forward?id=${shopPMansongRule.id}">
					${shopPMansongRule.ruleId}
				</a></td>
				<td>
					${shopPMansongRule.mansongId}
				</td>
				<td>
					${shopPMansongRule.level}
				</td>
				<td>
					${shopPMansongRule.price}
				</td>
				<td>
					${shopPMansongRule.shippingFree}
				</td>
				<td>
					${shopPMansongRule.discount}
				</td>
				<td>
					${shopPMansongRule.giftName}
				</td>
				<td>
					${shopPMansongRule.giftLink}
				</td>
	                
	                <td class="align-center">
	                    <a href="${base}/shopPMansongRule/forward?id=${shopPMansongRule.id}">编辑</a>
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
		             <td colspan="30">
		                <@layout.pager pager/>
		              </td>
	            </tr>
            </tfoot>
        </table>
    </form>
</div>
</@layout.body>