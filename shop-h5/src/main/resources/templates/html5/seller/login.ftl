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
<title>登录页 </title>
<link href="${base}/res/html5/css/style.css" rel="stylesheet" type="text/css" />
<script src="${base}/res/html5/js/jquery-1.10.2.min.js"></script>
<script src="${base}/res/html5/js/jquery.validate.min.js"></script>
<script>

function subForm(){
	if($("#theForm").valid()){
    	$("#submitBtn").attr("disabled",true);
		$.ajax({
        	type: "post",
        	url: '${base}/m/seller/loginCheck',
        	data: $("#theForm").serialize(),
        	dataType: "json",
        	async:false,
        	success:function(data) {
            	if(data.success){
            		setTimeout("window.location='${base}/m/seller/index'" , 200);
            	}else{
                	$("#errors").html(data.message);
                	$("#submitBtn").removeAttr("disabled");
            	}
        	}
    	}); 
  	}
}


jQuery(document).ready(function(){
	jQuery("#theForm").validate({
	    errorPlacement: function(error, element) {  
			element.parent().addClass("bd_red");
			error.appendTo(element.parent().next());  
		},	
		success:function(label) {
			 label.parent().prev().removeClass("bd_red");
		},
		rules: {
			username:{required:true},
			password:{required:true},
			code:{
				required:true,
				remote:{
					url: "${base}/m/seller/codeCheck",  //后台处理程序
		            type: "post",               //数据发送方式
		            dataType: "json",           //接受数据格式 
		            async:false,
		            data: {                     //要传递的数据
		                  "captcha": function(){return jQuery("#code").val();}
				    }
				}
			}
		},
		messages: {
			username:{required:"用户名不能为空"},
			password:{required:"密码不能为空"},
			code:{
		  		required:"验证码不能为空",
		  		remote:"验证码不正确"
			}
		}
	});
	
	document.onkeydown = function(e){ 
	    var ev = document.all ? window.event : e;
	    if(ev.keyCode==13) {
	    	subForm();
		}
    };
  
	$('#submitBtn').click(function(){
		subForm();
	});
  
});

function refreshCode(){
    var captchaImg = '${base}/generateImage?t=' + Math.random();
    $("#code_img").attr("src", captchaImg);

}
</script>
</head>
<body>
<div class="phone_hd"><a class="back" href="javascript:history.go(-1);"><img src="${base}/res/html5/images/back.png" width="25" height="25" /></a>登陆<a class="menu home" href="${base}/m/index/index"><img src="${base}/res/html5/images/home.png" width="25" height="25" /></a></div>
<div class="phone_main">
	<!--登陆页-->
    <form method="post" name="theForm" id="theForm" >
    <input name="login_role" type="hidden" id="login_role" value="user" />
    <div class="phone_login">
    	<ul>
        	<li class="ip"><input name="username" id="username" type="text" placeholder="请输入用户名/邮箱/已验证手机" /></li><li class="yz"></li>
            <li class="ip"><input name="password" id="password" type="password" placeholder="请输入密码" /></li><li class="yz" id="errors"></li>
        	<li class="yzm">
	          <input name="code" type="text"  id="code" placeholder="请输入验证码" />
	          <img src="generateImage"  onclick="refreshCode()" id="code_img" width="73" height="27"/>
	          <a href="javascript:void(0);" onClick="refreshCode();" >
	          <img src="${base}/res/html5/images/refresh.png" width="32" height="32" /></a></li>
	          <li class="yz"></li>            
	          <li class="ip_btn"><input id="submitBtn" type="button" value="登陆" /></li>
            <li><span class="fl"><a href="${base}/m/seller/register">免费注册</a></span><span class="fr"><a href="${base}/m/forget/index">找回密码</a></span></li>
        </ul>
    </div>
	</form>
    <!--底部-->
        <@f.foot/>

<!--按钮-->
    
</div>
</body>
</html>
