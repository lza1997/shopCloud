<link href="${base}/res/css/member.css" rel="stylesheet" type="text/css">
<link href="${base}/res/css/base.css" rel="stylesheet" type="text/css">
<link href="${base}/res/css/member_user.css" rel="stylesheet" type="text/css">
<script src="${base}/res/js/jquery.js" charset="utf-8"></script>
<script src="${base}/res/js/common.js" charset="utf-8"></script>
<div class="eject_con" style="width: 500px;">
  <div id="warning"></div>
    <input type="hidden" name="form_submit" value="ok">
    <input type="hidden" name="logId" value="${refundLog.logId}" />
    <dl>
      <dt>订单金额：</dt>
      <dd>
      	<script type="text/javascript">
      		var amount = number_format(${refundLog.orderAmount},2);
      		document.write(amount);
      	</script>
      	
      </dd>
    </dl>
    <dl>
      <dt>退款金额：</dt>
      <dd>
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
      <dt class="required"><em class="pngFix"></em>是否同意：</dt>
      <dd>
        <label>
          <input type="radio" name="refund_state" value="2" checked />
          是 </label>
        <label>
          <input type="radio" name="refund_state" value="3" />
          否 </label>
      </dd>
    </dl>
    <dl>
      <dt class="required"><em class="pngFix"></em>备注信息：</dt>
      <dd>
        <textarea name="refund_message" rows="3" class="textarea w300"></textarea>
      </dd>
    </dl>
    <dl>
      <dt>&nbsp;</dt>
      <dd>
        <p class="hint">只能提交一次，请认真选择。<br>如果不同意，系统将代替买家自动发起投诉，请及时处理。<br>系统管理员仲裁投诉时可修改为同意。</p>
      </dd>
    </dl>
    <dl class="bottom">
      <dt>&nbsp;</dt>
      <dd>
        <input type="submit" class="submit" id="confirm_button" value="确定">
      </dd>
    </dl>
</div>
 
