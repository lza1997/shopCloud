<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>确认收货</title>
<meta name="viewport" content="width=device-width,inital-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<link href="${base}/res/html5/css/style.css" rel="stylesheet" type="text/css" />
<script src="${base}/res/html5/js/jquery-1.10.2.min.js"></script>
<script src="${base}/res/html5/js/jquery.validate.min.js"></script>
<script src="${base}/res/js/jquery.js" charset="utf-8"></script>
<script src="${base}/res/js/common.js" charset="utf-8"></script>
<!-- 手机端弹出框开始 -->
<script src="${base}/res/html5/js/mobile/layer.m.js" charset="utf-8"></script>
<!-- 手机端弹出框结束 -->
<script type="text/javascript">
/**确认订单**/
function finishOrder() {	
	var barterId  = $("#barterId").val();
	var fmUrl = '${base}/m/authc/buyer/finishBarter';
	$.ajax({
	           type: "post",
	           url: fmUrl,
	           data: {barterId:barterId},
	           dataType: "json",
		 async:false,
		 success:function(data) {
			if(data.success){
					location.href='${base}/m/authc/buyer/barterList';
			}else{
				layer.open({content:'确认收货失败', time: 1});
			}
		 }
	}); 

	    
	
}
</script>
</head>
<body>
	<div class="phone_hd"><a class="back" href="javascript:history.go(-1);"><img src="${base}/res/html5/images/back.png" width="25" height="25" /></a>返回<a class="menu home" href="${base}/m/index/index"><img src="${base}/res/html5/images/home.png" width="25" height="25" /></a></div>
	<div class="phone_main" >
	    <form action="" method="post" id="myForm">
			<input type="hidden" name="barterId" id="barterId" value="${barterDetail.barterId}">
		    <div class="phone_login" style="margin-top:0px;">
		    	<ul>
		    		<li class="ip" style="border:none; background: none;">
		        		<span id="orderamount">您是否确定已经换货??</span>
		        	</li>
		        	<li class="ip" style="border:none; background: none;">
		        		<label style="float:left;">换货单号：</label>
		        		<span id="orderamount">${barterDetail.barterSn}</span>
		        	</li>
		          	<li class="yz"></li>
		        	<li class="yzm">
			          	<span id="orderamount">请注意： 如果你尚未收到货品请不要点击“确认”。大部分被骗案件都是由于提前确认付款被骗的，请谨慎操作！ </span>
			        </li>
			        <li class="ip_btn"><input id="confirm_button" type="button" onclick="finishOrder()" value="确定" /></li>
		        </ul>
		    </div>
		</form>  
	</div>
</body>
</html>

