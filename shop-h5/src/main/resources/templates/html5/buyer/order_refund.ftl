<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>退款</title>
<meta name="viewport" content="width=device-width,inital-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<#--清除缓存	-->
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
<#--清除缓存	-->
<link href="${base}/res/html5/css/style.css" rel="stylesheet" type="text/css" />
<script src="${base}/res/html5/js/jquery-1.10.2.min.js"></script>
<script src="${base}/res/html5/js/jquery.validate.min.js"></script>
<script src="${base}/res/js/jquery.js" charset="utf-8"></script>
<script src="${base}/res/js/common.js" charset="utf-8"></script>
<!-- 手机端弹出框开始 -->
<script src="${base}/res/html5/js/mobile/layer.m.js" charset="utf-8"></script>
<!-- 手机端弹出框结束 -->
<script type="text/javascript">
/**退款**/
function refund(){
	var orderId=$("input[name='orderId']").val(); //订单id
	var orderRefund=$("input[name='order_refund']").val(); //订单退款金额
	var buyerMessage=$("textarea[name='buyer_message']").val(); //退款原因
	if(orderRefund==''){
		layer.open({content:'请填写退款金额', time: 1});
		return false;
	}else if(buyerMessage==''){
		layer.open({content:'请填写退款原因', time: 1});
		return false;
	} 
	var fmUrl = '${base}/m/authc/buyer/refundOrder';
	$.ajax({
            type: "post",
            url: fmUrl,
            data: {orderId:orderId,orderRefund:orderRefund,buyerMessage:buyerMessage},
            dataType: "json",
		 async:false,
		 success:function(data) {
			if(data.success){
				layer.open({content:'退款提交成功', time: 1});
			}else{
				layer.open({content:'退款提交失败', time: 1});
			}
		}
        }); 
}


$(function(){
	$("input[name='order_refund']").val(toDecimal2(${order.orderAmount}));
	
});
function change(obj){
	$("input[name='order_refund']").change(function(){
		var reg = /^[-\+]?\d+(\.\d+)?$/; //检验是否为数字的正则表达式
		var refundPrice = $(this).val();
		if(refundPrice==''){
			$(this).val(toDecimal2(${order.orderAmount}));
		}else if(!reg.test(refundPrice)){
			layer.open({content:'请您输入正确的金额', time: 1});
			$(this).val(toDecimal2(${order.orderAmount}));
		}else if(refundPrice>${order.orderAmount}){
			layer.open({content:'请您输入正确的金额!', time: 1});
			$(this).val(toDecimal2(${order.orderAmount}));
		}else{
			$(this).val(toDecimal2(refundPrice));
		}
	});
}
//准换价格格式
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
</head>
<body>
	<div class="phone_hd"><a class="back" href="javascript:history.go(-1);"><img src="${base}/res/html5/images/back.png" width="25" height="25" /></a>返回<a class="menu home" href="${base}/m/index/index"><img src="${base}/res/html5/images/home.png" width="25" height="25" /></a></div>
	<div class="phone_main" >
	    <form action="" method="post" id="myForm">
			<input type="hidden" name="orderId" value="${order.orderId}"/>
		    <div class="phone_login" style="margin-top:0px;">
		    	<ul>
		        	<li class="ip" style="border:none; background: none;">
		        		<label style="float:left;">订单金额：</label>
		        		<span id="orderamount"></span>
			        	<script type="text/javascript">
							var amount = number_format(${order.orderAmount},2);
							$("#orderamount").html(amount);
						</script>
		        	</li>
		        	<li class="yz"></li>
		        	<li class="yzm">
			          <label style="float:left;">退款金额：</label>
			          <input type="text" name="order_refund" value="${order.orderAmount}" onChange="change(this)">
			        </li>
		          	<li class="yz"></li> 
			        <li class="yzm">
			          	<label style="float:left;">退款原因：</label>
			        	<textarea name="buyer_message" rows="3" style="width: 50%;" class="textarea w250"></textarea>
			        </li>     
		          	<li class="ip_btn"><input id="confirm_button" type="button" onclick="refund()" value="确定" /></li>
		        </ul>
		    </div>
		</form>  
	</div>
</body>
</html>
