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
<title>注册页</title>
<link href="${base}/res/html5/css/style.css" rel="stylesheet" type="text/css" />
<script src="${base}/res/html5/js/jquery-1.10.2.min.js"></script>
<script src="${base}/res/html5/js/jquery.validate.min.js"></script>
<script>
	function isWeiXin(){ 
		var ua = window.navigator.userAgent.toLowerCase(); 
		if(ua.match(/MicroMessenger/i) == 'micromessenger'){ 
			return true; 
		}else{ 
			return false; 
		} 
	} 
	window.onload = function(){ 
		if(isWeiXin()){
			//$("#divWeiXin").attr({style: "display:none;background:#fff;margin-top:45px;"});
			$("#divWeiXinRegister").css('display','block');
			$("#divOrtherRegister").css('display','none');
		}else{
			$("#divWeiXinRegister").css('display','none');
			$("#divOrtherRegister").css('display','block');
		}
	}
</script>
<script>
jQuery(document).ready(function(){
	
	jQuery.validator.addMethod("lettersonly", function(value, element) {
        return this.optional(element) || /^[^:%,'\*\"\s\<\>\&]+$/i.test(value);
    }, "Letters only please");
    jQuery.validator.addMethod("lettersmin", function(value, element) {
        return this.optional(element) || ($.trim(value.replace(/[^\u0000-\u00ff]/g,"aa")).length>=3);
    }, "Letters min please");
    jQuery.validator.addMethod("lettersmax", function(value, element) {
        return this.optional(element) || ($.trim(value.replace(/[^\u0000-\u00ff]/g,"aa")).length<=15);
    }, "Letters max please");
     jQuery.validator.addMethod("chmobile", function(value, element) {
    	    var pattern = /^1\d{10}$/;
        	return this.optional(element) || (pattern.test(value));
        }, "mobile");
 	//表单验证
  	jQuery("#theForm").validate({
		errorPlacement: function(error, element) {  
					   element.parent().addClass("bd_red");
        			 error.appendTo(element.parent().next());  
   					 },	
		success:function(label) {
	     						 label.parent().prev().removeClass("bd_red");
							},
		rules: {
			memberName:{
						  required : true,
		                  lettersmin : true,
		                  lettersmax : true,
		                  lettersonly : true,
		                  remote   : {
		                      url :'${base}/checkMemeber',
		                      type:'get',
		                      data:{
		                          name : function(){
		                              return $('#user_name').val();
		                          }
		                      }
		                  }
			},
			 memberPasswd : {
                 required : true,
                 minlength: 6,
                 maxlength: 20
             },
             password_confirm : {
                 required : true,
                 equalTo  : '#password'
             },
             memberEmail : {
                 required : true,
                 email    : true,
                 remote   : {
                     url : '${base}/m/index/checkEmail',
                     type: 'get',
                     data:{
                         email : function(){
                             return $('#email').val();
                         }
                     }
                 } 
             },
             memberMobile : {
                 required : true,
                 chmobile:true,
                 remote   : {
                     url : '${base}/m/index/checkMobile',
                     type: 'get',
                     data:{
                         mobile : function(){
                             return $('#mobile').val();
                         }
                     }
                 } 
             },
			code:{
				required:true,
				remote:{
					url: "${base}/m/index/codeCheck",  //后台处理程序
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
				memberName : {
		            required : '用户名不能为空',
		            lettersmin : '用户名必须在3-15个字符之间',
		            lettersmax : '用户名必须在3-15个字符之间',
		            lettersonly: '用户名不能包含敏感字符',
		            remote	 : '该用户名已经存在'
		        },
		        memberPasswd  : {
                    required : '密码不能为空',
                    minlength: '密码长度应在6-20个字符之间',
                    maxlength: '密码长度应在6-20个字符之间'
                },
                password_confirm : {
                    required : '请再次输入您的密码',
                    equalTo  : '两次输入的密码不一致'
                },
                memberEmail : {
                    required : '电子邮箱不能为空',
                    email    : '这不是一个有效的电子邮箱',
                    remote	 : '该电子邮箱已经存在'
                },
                memberMobile : {
                    required : '手机号不能为空',
                    chmobile:'请填写正确格式的手机号',
                    remote : '该手机号已存在'
                },
				code:{
			  		required:"验证码不能为空",
			  		remote:"验证码不正确"
		}
	},
  });
  	
  	 //表单提交
    $("#submitBtn").click(function(){
        if($("#theForm").valid()){
                $("#submitBtn").attr("disabled",true);
		         $.ajax({
				         type: "post",
				         url: '${base}/m/index/sign',
				         data: $("#theForm").serialize(),
				         dataType: "json",
						 async:true,
						 success:function(data) {
						 	if(data.success){
								 setTimeout("window.location='${base}/m/index/login'" , 200);
							}else{
		                         $("#submitBtn").removeAttr("disabled");
							}
						 }
				 });
			}
     });
});
</script>
</head>
<body>
<div class="phone_hd"><a class="back" href="javascript:history.go(-1);"><img src="${base}/res/html5/images/back.png" width="25" height="25" /></a>免费注册<a class="menu home" href="${base}/m/index/index"><img src="${base}/res/html5/images/home.png" width="25" height="25" /></a></div>
<div class="phone_main">
	<div id="divOrtherRegister">
		<form action="" method="post" name="theForm" id="theForm">
	    <div class="phone_login">
	      <ul>
	        <li class="ip ">
	          <input type="text" id="user_name" name="memberName"  placeholder="请输入用户名" title="3-20位字符，可由中文、英文、数字及“_”、“-”组成" />
	        </li>
	        <li class="yz"></li>
	        <li class="ip">
	          <input type="password" id="password" name="memberPasswd" placeholder="请输入密码" title="6-20位字符，可由英文、数字及标点符号组成"/>
	        </li>
	        <li class="yz"></li>
	        <li class="ip">
	          <input type="password" id="password_confirm" name="password_confirm" placeholder="请确认密码" title="请再次输入您的密码"/>
	        </li>
	        <li class="yz"></li>
	        <li class="ip">
	          <input type="text" id="email" name="memberEmail" placeholder="请输入您的邮箱" title="请输入常用的邮箱，将用来找回密码、接受订单通知等"/>
	        </li>
	        <li class="yz"></li>
	        <li class="ip">
	          <input type="text" id="mobile" name="memberMobile" placeholder="请输入您的手机号" title="请输入您的手机号"/>
	        </li>
	        <li class="yz"></li>
	                <script>
	                 function refreshCode(){
	                	 var captchaImg = '${base}/generateImage?t=' + Math.random();
	                     $("#code_img").attr("src", captchaImg);
	                 }
	             </script>
	        <li class="yzm">
	          <input name="code" type="text"  id="code" placeholder="请输入验证码" />
	          <img src="generateImage"  onclick="refreshCode()" id="code_img" width="73" height="27"/>
		      <a href="javascript:void(0);" onClick="refreshCode();" >
	          	<img src="${base}/res/html5/images/refresh.png" width="32" height="32" />
	          </a>
	        </li>
	        <li class="yz"></li>        
	
	        <li class="ip_btn">
	          <input id="submitBtn" type="submit"   value="立即注册"/>
	        </li>
	        <li><span class="fl"><a href="${base}/m/index/login">登陆</a></span><span class="fr"><a href="">找回密码</a></span></li>
	      </ul>
	    </div>
	  </form>
	</div>
  <!--注册页-->
    <div id="divWeiXinRegister">
      <div style="margin-top:50%" class="weixin-btn">使用微信一键注册<a href="${weixinurl}" target="_blank" class="weixin" title="微信"><i class="fa fa-weixin"></i>  微信</a></div>
    </div>
  <#--</form>-->
  <!--底部-->
  <!--底部-->
        <div style="position:absolute; bottom:0; width: 100%;">
       <@f.foot/>
        </div>
<!--按钮-->
 </div>
</body>
</html>
