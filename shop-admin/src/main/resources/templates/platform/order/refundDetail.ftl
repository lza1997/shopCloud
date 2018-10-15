<link href="${base}/res/css/member.css" rel="stylesheet" type="text/css">
<link href="${base}/res/css/base.css" rel="stylesheet" type="text/css">
<link href="${base}/res/css/member_user.css" rel="stylesheet" type="text/css">
<script src="${base}/res/js/jquery.js" charset="utf-8"></script>
<script src="${base}/res/js/common.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/layer/layer.js" charset="utf-8"></script>
<div class="eject_con" style="width: 500px">
  <div id="warning"></div>
  <dl>
    <dt>店铺：</dt>
    <dd>${refundLog.storeName}</dd>
  </dl>
  <dl>
    <dt>退款编号：</dt>
    <dd class="goods-num">${refundLog.refundSn}</dd>
  </dl>
  <dl>
    <dt>申请时间：</dt>
    <dd class="goods-time">${refundLog.createTimeStr?string('yyyy-MM-dd HH:mm:ss')}</dd>
  </dl>
  <dl>
    <dt>退款金额：</dt>
    <dd class="goods-price">
    	<script type="text/javascript">
    		var refund = number_format(${refundLog.orderRefund},2);
    		document.write(refund);
    	</script>
    </dd>
  </dl>
    <dl>
    <dt>退款原因：</dt>
    <dd>${refundLog.buyerMessage}</dd>
  </dl>
    <dl>
    <dt>审核状态：</dt>
    <dd>
    	<#if refundLog.refundState==1>
    		审核中
    	<#elseif refundLog.refundState==2>
    		审核通过
    	<#elseif refundLog.refundState==3>
    		已拒绝
    	</#if>
    </dd>
  </dl>
  <dl>
    <dt>卖家备注：</dt>
    <dd>${refundLog.refundMessage}</dd>
  </dl>
   <dl>
    <dt></dt>
    <dd></dd>
  </dl> 
</div>
