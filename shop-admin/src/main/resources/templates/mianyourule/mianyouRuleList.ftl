<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/jquery.edit.js"></script>
<script type="text/javascript">
    $(function(){
        $('#mianyouRuleSubmit').click(function(){
           $('#formSearch').submit();
        });
    });
    function delBrand(){
        var items = $("input[name='ruleIds']:checked").length;
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
            <h3>满免邮活动规则管理</h3>
            <ul class="tab-base">
                <li><a href="JavaScript:void(0);" class="current"><span>管理</span></a></li>
                <li><a href="${base}/mianyouRule/forward"><span>新增</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form method="post" name="formSearch" id="formSearch" action="${base}/mianyouRule/list">
        <input type="hidden" name="pageNo" value="${pager.pageNo}">
        <table class="tb-type1 noborder search">
            <tbody>
            <tr>
                <td><a href="javascript:void(0);" id="mianyouRuleSubmit" class="btn-search " title="查询">&nbsp;</a>
                    <a href="${base}/mianyouRule/list" class="btns "><span>撤销检索</span></a>
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
    <form method="post" id='form_list' action="${base}/mianyouRule/delete">
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
                <th class="w72 align-center">操作</th>
            </tr>
            </thead>
            <tbody>
            <#list pager.result as mianyouRule>
	            <tr class="hover edit">
	                <td>
	                	<input value="${mianyouRule.ruleId}" class="checkitem" type="checkbox" name="ruleIds">
	                </td>
				<td><a href="${base}/mianyouRule/forward?id=${mianyouRule.ruleId}">
					${mianyouRule.ruleId}
				</a></td>
				<td>
					${mianyouRule.mianyouId}
				</td>
				<td>
					${mianyouRule.level}
				</td>
				<td>
					${mianyouRule.price}
				</td>
				<td>
					${mianyouRule.shippingFree}
				</td>
				<td>
					${mianyouRule.discount}
				</td>
	                
	                <td class="align-center">
	                    <a href="${base}/mianyouRule/forward?ruleId=${mianyouRule.ruleId}">编辑</a>
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