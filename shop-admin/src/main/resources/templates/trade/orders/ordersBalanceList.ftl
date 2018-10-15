<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/My97DatePicker/WdatePicker.js" charset="utf-8"></script>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>订单管理</h3>
            <ul class="tab-base">
                <li><a href="JavaScript:void(0);" class="current"><span>管理</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form method="post" action="${base}/orders/balanceList" name="formSearch" id="formSearch">
        <input type="hidden" name="pageNo" value="${pager.pageNo}">
        <table class="tb-type1 noborder search">
            <tbody>
            <tr>
                <th>店铺</th>
                <td><input class="txt2" type="text" name="storeName" value="${order.storeName}" /></td>
                <th><label for="query_start_time">下单时间</th>
                <td><input class="txt date" type="text" name="startTime" class="txt Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'});" value="${startTime}"/>
                    <label for="query_start_time">~</label>
                    <input class="txt date" type="text" name="endTime" class="txt Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'});" value="${endTime}"/></td>
                <th><label>结算状态</label></th>
                <td colspan="2"><select name="balanceState" class="querySelect">
                    <option value="" <#if order.balanceState == null>selected="selected" </#if>>请选择</option>
                    <option value="0" <#if order.balanceState == '0'>selected="selected" </#if>>未结算</option>
                    <option value="1" <#if order.balanceState == '1'>selected="selected" </#if>>已结算</option>
                </select></td>
                <td>
                	<a href="javascript:void(0);" id="ncsubmit" class="btn-search " title="查询">&nbsp;</a>
                </td>
            </tr>
            </tbody>
        </table>
    </form>
    <table class="table tb-type2" id="prompt">
        <tbody>
        <tr class="space odd">
            <th colspan="12"><div class="title"><h5>操作提示</h5><span class="arrow"></span></div></th>
        </tr>
        <tr>
            <td>
                <ul>
                    <li>点击结算操作将更改订单结算状态</li>
                    <li>选中订单点击"批量结算"按钮将批量修改订单结算状态</li>
                    <li>下列订单都为已完成订单</li>
                </ul>
            </td>
        </tr>
        </tbody>
    </table>
    <table class="table tb-type2 nobdb">
        <thead>
        <tr class="thead">
        	<th></th>
            <th>订单号</th>
            <th>店铺</th>
            <th>买家</th>
            <th class="align-center">下单时间</th>
            <th class="align-center">订单总额</th>
            <th class="align-center">支付方式</th>
            <th class="align-center">订单状态</th>
            <th class="align-center">操作</th>
        </tr>
        </thead>
        <tbody>
        <#list pager.result as str>
        <tr class="hover">
        	<td class="w48">
        		<#if str.balanceState==0>
        			<input type="checkbox" name="ids" value="${str.orderId}" class="checkitem">
        			<img fieldid="5" status="close" nc_type="flex" src="/shop-admin/res/images/tv-item.gif"> 
        		</#if>
        	</td>
            <td>${str.orderSn}</td>
            <td>${str.storeName}</td>
            <td>${str.buyerName}</td>
            <td class="nowrap align-center">${str.createTimeStr?string("yyyy-MM-dd  HH:mm:ss")}</td>
            <td class="align-center">${str.orderAmount}</td>
            <td class="align-center">${str.paymentName}</td>
            <td class="align-center">
                <#if str.orderState==10>待付款</#if>
                <#if str.orderState==20>待发货</#if>
                <#if str.orderState==30>待收货</#if>
                <#if str.orderState==40>交易完成</#if>
                <#if str.orderState==0>已取消</#if>
            </td>
            <td class="w144 align-center">
            	<#if str.balanceState==0>
            		<a href="javascript:void(0)" onclick="balanceBySn('${str.orderSn}')">结算</a>
            	<#else>
            		已结算
            	</#if>
            </td>
        </tr>
        </#list>
        </tbody>
        <tfoot>
        <tr class="tfoot">
            <td colspan="15" id="dataFuncs">
                <@layout.pager pager/>
            </td>
            <tr class="tfoot">
				<td><input type="checkbox" class="checkall" id="checkall_2">
				</td>
				<td id="batchAction" colspan="15"><span class="all_checkbox">
						<label for="checkall_2">全选</label> </span>&nbsp;&nbsp;<a
					href="JavaScript:void(0);" class="btn" onclick="delClass()"> <span>结算</span>
				</a></td>
			</tr>
        </tr>
        </tfoot>
    </table>
</div>
<script type="text/javascript">
    $(function(){
        $('#ncsubmit').click(function(){
            $('#formSearch').submit();
        });
    });
    
    function balanceBySn(orderSn){
    	if (confirm('您确定要进行结算操作吗?')) {
	    	$.ajax({
		    	url : "${base}/orders/balance",
		        type : 'post',
		        data : {'orderSn' : orderSn},
		        dataType : 'json',
		        success : function(data){
		            if(data.success){
		            	window.location = '${base}/orders/balanceList?pageNo='+${pager.pageNo};
		            }else{
						alert("结算失败!");
		            }
		        }
		    });
	    }
    }
    
    function delClass() {
		var items = $("input[name='ids']:checked").length;
		if (items == 0) {
			alert("请至少选择一个要操作的项目");
		} else {
			if (confirm('您确定要进行结算操作吗?')) {
				var ids = '';
				$("input[name='ids']:checked").each(function(){
					ids += $(this).val()+",";
				});
				$.ajax({
			    	url : "${base}/orders/balance",
			        type : 'post',
			        data : {'ids' : ids},
			        dataType : 'json',
			        success : function(data){
			            if(data.success){
			            	window.location = '${base}/orders/balanceList?pageNo='+${pager.pageNo};
			            }else{
							alert("结算失败!");
			            }
			        }
			    });
			}
		}
	}
</script>
</@layout.body>