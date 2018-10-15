<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/jquery.edit.js"></script>
<script type="text/javascript">
    $(function(){
        $('#shopPMansongApplySubmit').click(function(){
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
            <h3>pmansongapply管理</h3>
            <ul class="tab-base">
                <li><a href="JavaScript:void(0);" class="current"><span>管理</span></a></li>
                <li><a href="${base}/shopPMansongApply/forward"><span>新增</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form method="post" name="formSearch" id="formSearch" action="${base}/shopPMansongApply/list">
        <input type="hidden" name="pageNo" value="${pager.pageNo}">
        <table class="tb-type1 noborder search">
            <tbody>
            <tr>
                <th><label for="applyId">申请编号:</label></th>
				<td><input class="txt" name="applyId" id="applyId" value="${pager.condition.applyId}" type="text"></td>
                <th><label for="memberId">用户编号:</label></th>
				<td><input class="txt" name="memberId" id="memberId" value="${pager.condition.memberId}" type="text"></td>
                <th><label for="memberName">用户名:</label></th>
				<td><input class="txt" name="memberName" id="memberName" value="${pager.condition.memberName}" type="text"></td>
                <th><label for="storeId">店铺编号:</label></th>
				<td><input class="txt" name="storeId" id="storeId" value="${pager.condition.storeId}" type="text"></td>
                <th><label for="storeName">店铺名称:</label></th>
				<td><input class="txt" name="storeName" id="storeName" value="${pager.condition.storeName}" type="text"></td>
                <th><label for="applyQuantity">申请数量:</label></th>
				<td><input class="txt" name="applyQuantity" id="applyQuantity" value="${pager.condition.applyQuantity}" type="text"></td>
                <th><label for="applyDate">申请时间:</label></th>
				<td><input class="txt" name="applyDate" id="applyDate" value="${pager.condition.applyDate}" type="text"></td>
                <th><label for="state">状态(1-新申请/2-审核通过/3-已取消/4-审核失败):</label></th>
				<td><input class="txt" name="state" id="state" value="${pager.condition.state}" type="text"></td>
                <td><a href="javascript:void(0);" id="shopPMansongApplySubmit" class="btn-search " title="查询">&nbsp;</a>
                    <a href="${base}/shopPMansongApply/list" class="btns "><span>撤销检索</span></a>
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
    <form method="post" id='form_list' action="${base}/shopPMansongApply/delete">
        <table class="table tb-type2">
            <thead>
            <tr class="thead">
                <th class="w24"></th>
                <th class="">申请编号</th>
                <th class="">用户编号</th>
                <th class="">用户名</th>
                <th class="">店铺编号</th>
                <th class="">店铺名称</th>
                <th class="">申请数量</th>
                <th class="">申请时间</th>
                <th class="">状态(1-新申请/2-审核通过/3-已取消/4-审核失败)</th>
                <th class="w72 align-center">操作</th>
            </tr>
            </thead>
            <tbody>
            <#list pager.result as shopPMansongApply>
	            <tr class="hover edit">
	                <td>
	                	<input value="${shopPMansongApply.id}" class="checkitem" type="checkbox" name="ids">
	                </td>
				<td><a href="${base}/shopPMansongApply/forward?id=${shopPMansongApply.id}">
					${shopPMansongApply.applyId}
				</a></td>
				<td>
					${shopPMansongApply.memberId}
				</td>
				<td>
					${shopPMansongApply.memberName}
				</td>
				<td>
					${shopPMansongApply.storeId}
				</td>
				<td>
					${shopPMansongApply.storeName}
				</td>
				<td>
					${shopPMansongApply.applyQuantity}
				</td>
				<td>
					${shopPMansongApply.applyDate}
				</td>
				<td>
					${shopPMansongApply.state}
				</td>
	                
	                <td class="align-center">
	                    <a href="${base}/shopPMansongApply/forward?id=${shopPMansongApply.id}">编辑</a>
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