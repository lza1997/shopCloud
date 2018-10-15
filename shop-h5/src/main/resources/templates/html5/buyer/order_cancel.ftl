<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>取消订单</title>
<meta name="viewport" content="width=device-width,inital-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
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
	/**取消订单**/
	function orderCancel(){
		layer.open({
		    content: '您确定要取消订单吗？',
		    btn: ['确认', '取消'],
		    shadeClose: false,
		    yes: function(){
		    	var orderSn=$("#orderSn").val();
				var cancelCause = $("input[name='state_info']:checked").val();
				var fmUrl = '${base}/m/authc/buyer/cancelOrder';
				$.ajax({
		             type: "post",
		             url: fmUrl,
		             data: {orderSn:orderSn,cancelCause:cancelCause},
		             dataType: "json",
					 async:false,
					 success:function(data) {
						if(data.success){
								location.href='${base}/m/authc/buyer/orderList?orderState=10';
						}else{
							layer.open({content: '订单取消失败', time: 1});	
						}
					}
		         }); 
		    }, no: function(){
		    
		    }
		});
	}
</script>
</head>
<body>
	<div class="phone_hd"><a class="back" href="javascript:history.go(-1);"><img src="${base}/res/html5/images/back.png" width="25" height="25" /></a>返回<a class="menu home" href="${base}/m/index/index"><img src="${base}/res/html5/images/home.png" width="25" height="25" /></a></div>
	<div class="phone_main" >
	    <form action="" method="post" id="myForm">
			<input type="hidden" name="orderSn" id="orderSn" value="${orderSn}">
		    <div class="phone_login" style="margin-top:0px;">
		    	<ul>
		    		<li class="ip" style="border:none; background: none;">
		        		<span id="orderamount">您确定要取消下面的订单吗?</span>
		        	</li>
		        	<li class="ip" style="border:none; background: none;">
		        		<label style="float:left;">订单编号：</label>
		        		<span id="orderamount">${orderSn}</span>
		        	</li>
		          	<li class="yz"></li> 
			        <li class="yzm">
			          	<label style="float:left;"> 取消原因：</label>
			        </li>
		        	<ul>
			          <li>
			            <input type="radio" checked="" name="state_info" id="d1" value="改买其他商品">
			            <label for="d1">改买其他商品</label>
			          </li>
			          <li>
			            <input type="radio" name="state_info" id="d2" value="改用其他方式购买">
			            <label for="d2">改用其他方式购买</label>
			          </li>
			          <li>
			            <input type="radio" name="state_info" id="d3" value="从其他店铺购买">
			            <label for="d3">从其他店铺购买</label>
			          </li>
			          <li>
			            <input type="radio" name="state_info" flag="other_reason" id="d4" value="其他原因">
			            <label for="d4">其他原因</label>
			          </li>
			          <li id="other_reason" style="display:none;">
			            <textarea name="state_info1" rows="2" id="other_reason_input"></textarea>
			          </li>
       				</ul>
			        <li class="ip_btn"><input id="confirm_button" type="button" onclick="orderCancel()" value="确定" /></li>
		        </ul>
		    </div>
		</form>  
	</div>
</body>
</html>

