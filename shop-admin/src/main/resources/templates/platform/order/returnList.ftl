<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/layer/layer.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/My97DatePicker/WdatePicker.js"></script>
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
            <h3>退款记录</h3>
            <ul class="tab-base">
                <li><a href="JavaScript:void(0);" class="current"><span>管理</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form method="post" action="${base}/platformOrder/returnOrderList" name="formSearch" id="formSearch">
        <input type="hidden" name="pageNo" value="${pager.pageNo}">
        <table class="tb-type1 noborder search">
            <tbody>
            <tr>
                <th><label>订单号</label></th>
                <td><input class="txt2" type="text" name="orderSn" value="${refundReturn.orderSn}" /></td>
                <th><label>退货编号</label></th>
                <td><input class="txt2" type="text" name="refundSn" value="${refundReturn.refundSn}" /></td>
            </tr>
            <tr>
                <th><label for="query_start_time">退货时间</th>
                <td><input class="txt date" type="text"  id="query_start_time" name="startTime" value="${startTime}" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"/>
                    <label for="query_start_time">~</label>
                    <input class="txt date" type="text" id="query_end_time" name="endTime" value="${endTime}" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"/></td>
                <th>买家</th>
                <td><input class="txt-short" type="text" name="buyerName" value="${refundReturn.buyerName}" /></td>
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
                    <li>点击查看操作将显示退货申请的详细信息</li>
                    <li>点击审核操作将调到买家申请退货的审核页面</li>
                </ul></td>
        </tr>
        </tbody>
    </table>
    <table class="table tb-type2 nobdb">
        <thead>
        <tr class="thead">
            <th>订单号</th>
            <th>退款编号</th>
            <th>买家会员名</th>
            <th class="align-center">退货数量</th>
            <th class="align-center">退款时间</th>
            <th class="align-center">审核状态</th>
            <th class="align-center">平台确认</th>
            <th class="align-center">操作</th>
        </tr>
        </thead>
        <tbody>
        <#list pager.result as str>
        <tr class="hover">
            <td>${str.orderSn}</td>
            <td>${str.refundSn}</td>
            <td>${str.buyerName}</td>
            <td align="center">${str.goodsNum}</td>
            <td class="nowrap align-center">${str.createTimeStr?string("yyyy-MM-dd")}</td>
            <td class="align-center">
            	<#if str.sellerState==1>
					待审核
				<#elseif str.sellerState==2>
					同意
				<#elseif str.sellerState==3>
					不同意
				</#if>
            </td>
            <td class="align-center">
            	<#if str.refundState??>
					<#if str.refundState==1>
						处理中
					<#elseif str.refundState==2>
						待处理
					<#elseif str.refundState==3>
						已完成
					</#if>
				<#else>
					无
				</#if>
            </td>
            <td class="w144 align-center">
            	<a href="${base}/platformOrder/refundReturnDetail?refundId=${str.refundId}">查看</a>
            	<#if str.sellerState==1>
            		| <a href="${base}/platformOrder/returnOrderIndex?refundId=${str.refundId}">审核</a>
            	</#if>
            	<#if str.goodsState==2>
					<a href="javascript:void(0)" onclick="confirm('${str.refundId}')">确认收货</a>
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
	function confirm(refundId){
		layer.open({
		    type: 2,
		    area: ['500px', '275px'],
		    skin: 'layui-layer-rim',
		    title: '确认收货',
		    //content: APP_BASE + '/cart/addresslist'
		    content :  ['${base}/platformOrder/refundReturnConfirmIndex?refundId=' + refundId, 'no'],
		    success: function(layero, index){
		    	layer.getChildFrame('#confirm_button',index).on('click', function(){
					var refundId=layer.getChildFrame("#refundId",index).val();
					var receiveMessage = layer.getChildFrame("#receiveMessage",index).val();
					var fmUrl = '${base}/platformOrder/refundReturnConfirm';
					$.ajax({
			             type: "post",
			             url: fmUrl,
			             data: {refundId:refundId,receiveMessage:receiveMessage},
			             dataType: "json",
						 success:function(data) {
							if(data.success){
								parent.layer.alert("确认收货成功",{icon:1},function(){
									location.reload();
									parent.layer.closeAll();
								});	
							}else{
								parent.layer.alert("确认收货失败",{icon:2},function(){
									parent.layer.closeAll();
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