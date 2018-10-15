<link href="${base}/res/css/member.css" rel="stylesheet" type="text/css">
<link href="${base}/res/css/base.css" rel="stylesheet" type="text/css">
<link href="${base}/res/css/member_user.css" rel="stylesheet" type="text/css">
<script src="${base}/res/js/jquery.js" charset="utf-8"></script>	
<div class="eject_con" style="width: 400px">
	<div id="warning"></div>
	<form method="post" action="">
		<input type="hidden" name="form_submit" value="ok"> <input
			type="hidden" name="orderSn" id="orderSn" value="${order.orderSn}">
		<h2>确认货到付款订单</h2>
		<dl>
			<dt>订单编号：</dt>
			<dd>${order.orderSn}</dd>
		</dl>
		<dl class="bottom">
			<dt>&nbsp;</dt>
			<dd>
				<input type="submit" class="submit" id="confirm_button" value="确定">
			</dd>
		</dl>
	</form>
</div>

</div>
</div>
<div style="clear:both; display:block;"></div>
</div>