<@layout.head>
<script type="text/javascript"
	src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript"
	src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css"
	href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css" />
<script type="text/javascript" src="${base}/res/js/jquery.edit.js"></script>
<script type="text/javascript">
	$(function() {
		$('#query_start_time').datepicker({
			dateFormat : 'yy-mm-dd'
		});
		$('#query_end_time').datepicker({
			dateFormat : 'yy-mm-dd'
		});
		$('#shopPointsOrderSubmit').click(function() {
			$('#formSearch').submit();
		});
	});
	function delBrand() {
		var items = $("input[name='ids']:checked").length;
		if (items == 0) {
			alert("请至少选择一个要删除的项目");
		} else {
			if (confirm('您确定要删除吗?')) {
				$('#form_list').submit();
			}
		}
	}
	function delRow(obj) {
		if (confirm('您确定要删除吗?')) {
			$(obj).parents("tr").find("td:eq(0)>input").attr("checked", true);
			$('#form_list').submit();
		}
	}
</script>
</@layout.head> <@layout.body>
<div class="page">
	<div class="fixed-bar">
		<div class="item-title">
			<h3>兑换订单管理</h3>
			<ul class="tab-base">
				<li><a href="JavaScript:void(0);" class="current"><span>管理</span>
				</a>
				</li>
			</ul>
		</div>
	</div>
	<div class="fixed-empty"></div>
	<form method="post" name="formSearch" id="formSearch"
		action="${base}/shopPointsOrder/list">
		<input type="hidden" name="pageNo" value="${pager.pageNo}">
		<table class="tb-type1 noborder search">
			<tbody>
				<tr>
					<th><label>订单号</label>
					</th>
					<td><input class="txt2" type="text" name="pointOrdersn"
						value="${shopPointsOrder.pointOrdersn}" />
					</td>
					<th><label>订单状态</label>
					</th>
					<td colspan="4"><select name="pointOrderstate"
						class="querySelect">
							<option value=""<#if shopPointsOrder.pointOrderstate
								=="" >selected="selected" </#if>>请选择</option>
							<option value="10"<#if shopPointsOrder.pointOrderstate
								== '10'>selected="selected" </#if>>待付款</option>
							<option value="20"<#if shopPointsOrder.pointOrderstate
								== '20'>selected="selected" </#if>>待发货</option>
							<option value="30"<#if shopPointsOrder.pointOrderstate
								== '30'>selected="selected" </#if>>待收货</option>
							<option value="40"<#if shopPointsOrder.pointOrderstate
								== '40'>selected="selected" </#if>>已收货</option>
							<option value="50"<#if shopPointsOrder.pointOrderstate
								== '50'>selected="selected" </#if>>已完成</option>
							<option value="60"<#if shopPointsOrder.pointOrderstate
								== '60'>selected="selected" </#if>>已取消</option>
					</select>
					</td>

				</tr>
				<tr>
					<th><label for="query_start_time">下单时间
					</th>
					<td><input class="txt date" type="text" id="query_start_time"
						name="pointAddStarttime" value="${pointAddStarttime}" /> <label
						for="query_start_time">~</label> <input class="txt date"
						type="text" id="query_end_time" name="pointAddEndtime"
						value="${pointAddEndtime}" />
					</td>
					<th>买家</th>
					<td><input class="txt-short" type="text" name="pointBuyername"
						value="${shopPointsOrder.pointBuyername}" />
					</td>
					<td><a href="javascript:void(0);" id="shopPointsOrderSubmit"
						class="btn-search " title="查询">&nbsp;</a></td>
				</tr>
			</tbody>
		</table>
	</form>
	<!--
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
	<form method="post" id='form_list'
		action="${base}/shopPointsOrder/delete">
		<input type="hidden" name="form_submit" value="ok" />
		<table class="table tb-type2">
			<thead>
				<tr class="thead">
					<th class="w24"></th>

					<th class="">订单编号</th>
					<th class="">下单时间</th>
					<th class="">兑换会员</th>
					<th class="">兑换积分</th>
					<th class="">邮费</th>
					<th class="">物流单号</th>
					<th class="">订单状态</th>
					<th class="w72 align-center">操作</th>
				</tr>
			</thead>
			<tbody>
				<#assign dateFormatTag = newTag("dateFormatTag")/> 
				<#list pager.result as shopPointsOrder>
				<tr class="hover edit">
					<td><input value="${shopPointsOrder.id}" class="checkitem"
						type="checkbox" name="ids"></td>
					<td>${shopPointsOrder.pointOrdersn}</td>
					<td><#assign pointAdddtime =
						dateFormatTag('{"date":"${shopPointsOrder.pointAddtime}","format":"yyyy-MM-dd HH:mm:ss"}')/> ${pointAdddtime}</td>
					<td><a
						href="${base}/member/findById?id=${shopPointsOrder.member.memberId}">
							${shopPointsOrder.member.memberName}</a></td>

					<td>${shopPointsOrder.pointAllpoint}</td>
					<td>${shopPointsOrder.shippingFee}</td>
					<td>${shopPointsOrder.pointShippingcode}</td>
					<td><#if shopPointsOrder.pointOrderstate==10> 待付款 <#elseif
						shopPointsOrder.pointOrderstate==20> 待发货 <#elseif
						shopPointsOrder.pointOrderstate==30> 待收货 <#elseif
						shopPointsOrder.pointOrderstate==40> 已收货 <#elseif
						shopPointsOrder.pointOrderstate==50> 已完成 <#elseif
						shopPointsOrder.pointOrderstate==60> 已取消 </#if></td>
					<td class="align-center">
						<a href="${base}/shopPointsOrder/detail?orderId=${shopPointsOrder.id}&id=${shopPointsOrder.pointOrderid}">查看</a>
						&nbsp;
						<#if shopPointsOrder.pointOrderstate==20> |&nbsp;
						 <a href="${base}/shopPointsOrder/shipments_deliver?orderId=${shopPointsOrder.id}&id=${shopPointsOrder.pointOrderid}">发货</a> 
						</#if> <!--  <a href="javascript:;" onclick="delRow(this)" >删除</a> -->
					</td>
				</tr>
				</#list>
			</tbody>
			<tfoot>
				<tr class="tfoot">
					<td><input type="checkbox" class="checkall"
						id="checkallBottom">
					</td>
					<td colspan="2"><label for="checkallBottom">全选</label>
						&nbsp;&nbsp; <a href="JavaScript:void(0);" class="btn"
						onclick="delBrand()"><span>删除</span>
					</a></td>
					<td colspan="30"><@layout.pager pager/></td>
				</tr>
			</tfoot>
		</table>
	</form>
</div>
</@layout.body>
