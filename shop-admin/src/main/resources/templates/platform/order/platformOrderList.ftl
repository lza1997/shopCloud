<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/layer/layer.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript">
    $(function(){
        $('#ncsubmit').click(function(){
            $('#formSearch').submit();
        });
    });
</script>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>平台订单</h3>
            <ul class="tab-base">
                <li><a href="JavaScript:void(0);" class="current"><span>管理</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form method="post" action="${base}/platformOrder/list" name="formSearch" id="formSearch">
        <input type="hidden" name="pageNo" value="${pager.pageNo}">
        <table class="tb-type1 noborder search">
            <tbody>
            <tr>
                <th><label>订单号</label></th>
                <td><input class="txt2" type="text" name="orderSn" value="${order.orderSn}" /></td>
                <th><label>订单状态</label></th>
                <td colspan="4"><select name="orderState" class="querySelect">
                    <option value="" <#if order.orderState == null>selected="selected" </#if>>请选择</option>
                    <option value="10" <#if order.orderState == '10'>selected="selected" </#if>>待付款</option>
                    <option value="20" <#if order.orderState == '20'>selected="selected" </#if>>待发货</option>
                    <option value="30" <#if order.orderState == '30'>selected="selected" </#if>>待收货</option>
                    <option value="40" <#if order.orderState == '40'>selected="selected" </#if>>交易完成</option>
                    <option value="50" <#if order.orderState == '50'>selected="selected" </#if>>已提交</option>
					<option value="60" <#if order.orderState == '60'>selected="selected" </#if>>已确认</option>
                    <option value="0" <#if order.orderState == '0'>selected="selected" </#if>>已取消</option>
                </select></td>

            </tr>
            <tr>
                <th><label for="query_start_time">下单时间</th>
                <td><input class="txt date" type="text"  id="query_start_time" value="${order.startTime}"/>
                    <label for="query_start_time">~</label>
                    <input class="txt date" type="text" id="query_end_time" value="${order.endTime}"/></td>
                <th>买家</th>
                <td><input class="txt-short" type="text" name="buyerName" value="${order.buyerName}" /></td>
                <td><a href="javascript:void(0);" id="ncsubmit" class="btn-search " title="查询">&nbsp;</a>

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
                    <li>点击查看操作将显示订单（包括订单物品）的详细信息</li>
                    <li>点击取消操作可以取消订单（在线支付但未付款的订单和货到付款但未发货的订单）</li>
                    <li>如果平台已确认收到买家的付款，但系统支付状态并未变更，可以点击收到货款操作，并填写相关信息后更改订单支付状态</li>
                </ul></td>
        </tr>
        </tbody>
    </table>
    <table class="table tb-type2 nobdb">
        <thead>
        <tr class="thead">
            <th>订单号</th>
            <th>买家</th>
            <th class="align-center">下单时间</th>
            <th class="align-center">订单总额</th>
            <th class="align-center">支付总额</th>
            <th class="align-center">支付方式</th>
            <th class="align-center">订单状态</th>
            <th class="align-center">操作</th>
        </tr>
        </thead>
        <tbody>
        <#list pager.result as str>
        <tr class="hover">
            <td>${str.orderSn}</td>
            <td>${str.buyerName}</td>
            <td class="nowrap align-center">${str.createTimeStr?string("yyyy-MM-dd  HH:mm:ss")}</td>
            <td class="align-center">${str.orderTotalPrice}</td>
            <td class="align-center">${str.orderAmount}</td>
            <td class="align-center">${str.paymentName}</td>
            <td class="align-center">
                <#if str.orderState==10>待付款</#if>
                <#if str.orderState==20>待发货</#if>
                <#if str.orderState==30>待收货</#if>
                <#if str.orderState==40>交易完成</#if>
                <#if str.orderState==50>已提交</#if>
                <#if str.orderState==60>已确认</#if>
                <#if str.orderState==0>已取消</#if>
            </td>
            <td class="w144 align-center"><a href="${base}/orders/show?id=${str.orderId}">查看</a>
                <!-- 取消订单 -->
                <#if str.orderState==10>
                | <a href="javascript:void(0)" onclick="updateAmount('${str.orderId}')" target="_blank" class="ncu-btn6 mt5" id="order1_action_confirm">调整费用</a>
                </#if>
                <#if str.orderState==20>
                | <a href="${base}/platformOrder/shipments_deliver?orderId=${str.orderId}" class="ncu-btn6 mt5">发货</a>
                </#if>
                <#if str.orderState==50>
                | <a href="javascript:void(0)" onclick="confirmOrder('${str.orderId}')" class="ncu-btn2 mt5" >订单确认</a>
				</#if>   
				<#if str.orderState==60>
                | <a href="${base}/platformOrder/shipments_deliver?orderId=${str.orderId}" class="ncu-btn6 mt5">发货</a>
                </#if> 
				<#if str.refundLog??>
        			<#if str.refundLog.refundState == 1>
        				| <a href="javascript:void(0)" onclick="refund('${str.refundLog.logId}')" >退款</a>
        			</#if>
        		</#if> 
        		<#if str.returnOrder??>
        			<#if str.returnOrder.returnState == 1>
        				| <a href="javascript:void(0)" onclick="returnOrder('${str.returnOrder.returnId}')" >退货</a>
        			</#if>
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
        </tr>
        </tfoot>
    </table>
</div>
<script type="text/javascript">
    $(function(){
        $('#query_start_time').datepicker({dateFormat: 'yy-mm-dd'});
        $('#query_end_time').datepicker({dateFormat: 'yy-mm-dd'});
        $('#ncsubmit').click(function(){
            $('#formSearch').submit();
        });
    });
    
    /**调整费用**/
	function updateAmount(id) {
	   	layer.open({
		    type: 2,
		    area: ['400px', '200px'],
		    skin: 'layui-layer-rim',
		    title: '调整订单费用',
		    //content: APP_BASE + '/cart/addresslist'
		    content :  ['${base}/platformOrder/updateAmountIndex?orderId=' + id, 'no'],
		    success: function(layero, index){
		    	layer.getChildFrame('#confirm_button',index).on('click', function(){
					var orderId=layer.getChildFrame("#orderId",index).val();
					var orderAmount=layer.getChildFrame("#orderAmount",index).val();
					var fmUrl = '${base}/platformOrder/updateAmount';
					$.ajax({
			             type: "post",
			             url: fmUrl,
			             data: {orderId:orderId,orderAmount:orderAmount},
			             dataType: "json",
						 async:false,
						 success:function(data) {
							if(data.success){
								parent.layer.msg("订单修改成功",{icon:1},function(){
									location.reload();
								});	
							}else{
								parent.layer.msg("订单修改失败",{icon:2},function(){
									location.reload();
								});		
							}
						}
			         });  
				});	
		    }
		});
	}
	
	/**订单确认**/
	function confirmOrder(id) {
	   	layer.open({
		    type: 2,
		    area: ['400px', '200px'],
		    skin: 'layui-layer-rim',
		    title: '订单确认',
		    //content: APP_BASE + '/cart/addresslist'
		    content :  ['${base}/platformOrder/confirmOrderIndex?orderId=' + id, 'no'],
		    success: function(layero, index){
		    	layer.getChildFrame('#confirm_button',index).on('click', function(){
					var orderSn=layer.getChildFrame("#orderSn",index).val();
					var fmUrl = '${base}/platformOrder/confirmOrder';
					$.ajax({
			             type: "post",
			             url: fmUrl,
			             data: {orderSn:orderSn},
			             dataType: "json",
						 async:false,
						 success:function(data) {
							if(data.success){
								parent.layer.msg("订单确认成功",{icon:1},function(){
									location.reload();
								});	
							}else{
								parent.layer.msg("订单确认失败",{icon:2},function(){
									location.reload();
								});		
							}
						}
			         });  
				});	
		    }
		});
	}
	
	/**退款审核**/
	function refund(id) {
	   	layer.open({
		    type: 2,
		    area: ['500px', '400px'],
		    skin: 'layui-layer-rim',
		    title: '订单退款',
		    //content: APP_BASE + '/cart/addresslist'
		    content :  ['${base}/platformOrder/refundOrderIndex?logId=' + id, 'no'],
		    success: function(layero, index){
		    	layer.getChildFrame('#confirm_button',index).on('click', function(){
					var logId=layer.getChildFrame("input[name='logId']",index).val();
					var refundState = layer.getChildFrame("input[name='refund_state']:checked",index).val();
					var refundMessage = layer.getChildFrame("input[name='refund_message']",index).val();
					var fmUrl = '${base}/platformOrder/refundOrder';
					$.ajax({
			             type: "post",
			             url: fmUrl,
			             data: {logId:logId,refundState:refundState,refundMessage:refundMessage},
			             dataType: "json",
						 async:false,
						 success:function(data) {
							if(data.success){
								parent.layer.msg("审核成功!",{icon:1},function(){
									location.reload();
								});	
							}else{
								parent.layer.msg("审核失败!",{icon:2},function(){
									location.reload();
								});		
							}
						}
			         });  
				});	
		    }
		});
	}
	
	/**退货审核**/
	function returnOrder(id){
		layer.open({
		    type: 2,
		    area: ['500px', '400px'],
		    skin: 'layui-layer-rim',
		    title: '订单退货',
		    //content: APP_BASE + '/cart/addresslist'
		    content :  ['${base}/platformOrder/returnOrderIndex?returnId=' + id, 'no'],
		    success: function(layero, index){
		    	layer.getChildFrame('#confirm_button',index).on('click', function(){
					var returnId=layer.getChildFrame("input[name='returnId']",index).val();
					var returnState = layer.getChildFrame("input[name='return_state']:checked",index).val();
					var returnMessage = layer.getChildFrame("input[name='return_message']",index).val();
					var fmUrl = '${base}/platformOrder/returnOrder';
					$.ajax({
			             type: "post",
			             url: fmUrl,
			             data: {returnId:returnId,returnState:returnState,returnMessage:returnMessage},
			             dataType: "json",
						 async:false,
						 success:function(data) {
							if(data.success){
								parent.layer.msg("审核成功!",{icon:1},function(){
									location.reload();
								});	
							}else{
								parent.layer.msg("审核失败!",{icon:2},function(){
									location.reload();
								});		
							}
						}
			         });   
				});	
		    }
		});
	}
</script>
</@layout.body>