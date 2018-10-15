<link href="${base}/res/css/member.css" rel="stylesheet" type="text/css">
<link href="${base}/res/css/base.css" rel="stylesheet" type="text/css">
<link href="${base}/res/css/member_user.css" rel="stylesheet" type="text/css">
<script src="${base}/res/js/jquery.js" charset="utf-8"></script>

<div class="dialog_body" style="position: relative;width: 500px"><h3 class="dialog_head" style="cursor: move;"><span class="dialog_title"><span class="dialog_title_icon"></span></span><span class="dialog_close_button" style="position: absolute; text-indent: -9999px; cursor: pointer; overflow: hidden;">close</span></h3><div class="dialog_content" style="margin: 0px; padding: 0px;"><div class="eject_con">
  <div id="warning" style="display: none;"></div>
  <form id="changeform" action="">
  	<input type="hidden" name="orderId" id="orderId" value="${order.orderId}">
    <input type="hidden" name="form_submit" value="ok">
    <input type="hidden" name="state_info1" value="调整费用">
    <dl>
      <dt>买&nbsp;家：</dt>
      <dd>${order.buyerName}</dd>
    </dl>
    <dl>
      <dt>订单号：</dt>
      <dd><span class="num">${order.orderSn}</span></dd>
    </dl>
    <dl>
      <dt>订单总价：</dt>
      <dd>
        <input type="text" class="text valid" id="orderAmount" name="order_amount" value="${order.orderAmount}">
      </dd>
    </dl>
    <dl class="bottom">
      <dt>&nbsp;</dt>
      <dd>
        <input type="submit" class="submit" id="confirm_button" value="确定">
      </dd>
    </dl>
  </form>
</div>
</div></div>
<script type="text/javascript">
	$(function(){
		var amount = toDecimal2(${order.orderAmount});
		$("#orderAmount").val(amount);
	});
	
	function toDecimal2(x) {   
	    var f = parseFloat(x);   
	    if (isNaN(f)) {   
	        return false;   
	    }   
	    var f = Math.round(x*100)/100;   
	    var s = f.toString();   
	    var rs = s.indexOf('.');   
	    if (rs < 0) {   
	        rs = s.length;   
	        s += '.';   
	    }   
	    while (s.length <= rs + 2) {   
	        s += '0';   
	    }   
	    return s;   
	}  
</script>