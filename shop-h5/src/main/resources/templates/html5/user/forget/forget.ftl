<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width,inital-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
<#--清除缓存	-->
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
<#--清除缓存	-->
<title>登陆页 </title>
<link href="${base}/res/html5/css/style.css" rel="stylesheet" type="text/css" />
<script src="${base}/res/html5/js/jquery-1.10.2.min.js"></script>
<script src="${base}/res/html5/js/jquery.validate.min.js"></script>
<!-- 手机端弹出框开始 -->
<script src="${base}/res/html5/js/mobile/layer.m.js" charset="utf-8"></script>
<!-- 手机端弹出框结束 -->
<script type="text/javascript">
	var wait=60;
	function time(o) {
		console.log(wait);
		if (wait == 0) {
			o.removeAttr("disabled");
			o.val("免费获取验证码");
			o.removeClass("code_disabled");
			wait = 60;
		} else {
			o.attr("disabled", true);
			o.addClass("code_disabled");
			o.val("重新发送(" + wait + ")");
			wait--;
			setTimeout(function() {
				time(o)
			}, 1000)
		}
	}
	/* var reg =/^0{0,1}(13[0-9]|15[0-9]|15[0-9]|18[0-9]|17[0-9])[0-9]{8}$/; */
	var reg = /^1\d{10}$/;
	//添加数量
	$(function() {
		//鼠标操作数量 离开文本框 
		//保存调用的js
		$("#validBtn").click(function() {
			var self = $(this);
			var mobile = $('#mobile').val();//
			if(!reg.test(mobile)){
				layer.open({content:'请输入正确的手机号!', time: 1});
				return false;
			} 
			var getTimestamp = new Date().getTime();
			$.post("${base}/m/forget/getValid?mobile=" + mobile
					+ "&currStr=" + getTimestamp, null, function(data) {
				if (data) {
					if (data.success == "true") {
					    time(self);//验证用户存在后再出验证码
						$("#erro-span").html("");
						$("#test").html(data.message);
						//$("#captcha_img").html(data.validCode);
					} else {
						layer.open({content:data.message, time: 1});
					}
				}
			});
		});
	});
	
	function toVaild(){
		var mobile = $('#mobile').val();//
		var validCode = $('#validCode').val();//
		if(!reg.test(mobile)){
			layer.open({content:'请输入正确的手机号!', time: 1});
			return false;
		} 
		if(validCode==""){
			layer.open({content:'请输入验证码!', time: 1});
			return false;
		}
 	}
</script>
</head>
<body>
<div class="phone_hd"><a class="back" href="javascript:history.go(-1);"><img src="${base}/res/html5/images/back.png" width="25" height="25" /></a>重置密码<a class="menu home" href="${base}/m/index/index"><img src="${base}/res/html5/images/home.png" width="25" height="25" /></a></div>
<div class="phone_main">
	<!--登陆页-->
    <form action="${base}/m/forget/checkValidCode" method="post" id="myForm" onsubmit="return toVaild()">
    <input name="login_role" type="hidden" id="login_role" value="user" />
    <div class="phone_login">
    	<ul>
        	<li class="ip">
	        	<input name="mobile" id="mobile" autocomplete="off" type="text" placeholder="请输入验证手机" />
	        	<input class="text" type="hidden" name="flags" value="${flags}"/>
        	</li>
        	<li class="yz"></li>
        	<li class="yzm">
	          <input type="text" name="validCode" id="validCode" placeholder="请输入动态验证码" />
	           <!--<a title="免费获取" href="javascript:void(0)" class="register btn" id="validBtn">免费获取</a> -->
	          <input type="button" id="validBtn" value="免费获取">
	          <!-- <font id="captcha_img"></font> --><#if error??><span id="erro-span" style="color:red">${error}</span></#if><span id="test"></span>
              <label style="color: red;" id="errors"></label>  
	        </li>
	          <li class="yz"></li>            
	          <li class="ip_btn"><input id="forgetSubmit" type="submit" value="下一步" /></li>
        </ul>
    </div>
	</form>
    <!--底部-->
       <@f.foot/>

<!--按钮-->
    
</div>
</body>
</html>
