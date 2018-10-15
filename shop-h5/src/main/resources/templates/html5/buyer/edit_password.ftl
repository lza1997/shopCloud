
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
<title>修改密码 - 瑞华信通 B2B2C V3.0 2015版商城系统</title>
<link href="${base}/res/html5/css/style.css" rel="stylesheet" type="text/css" />
<script src="${base}/res/html5/js/jquery-1.10.2.min.js"></script>
<script src="${base}/res/html5/js/jquery.validate.min.js"></script>
<!-- 手机端弹出框开始 -->
<script src="${base}/res/html5/js/mobile/layer.m.js" charset="utf-8"></script>
<!-- 手机端弹出框结束 -->
<script>
    jQuery(document).ready(function(){
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
		password:{
			required:true,
			minlength:6,
			maxlength:20  
		},
		new_password:{
			required:true,
			minlength:6,
			maxlength:20,
		},
		new_password1:{
			required:true,
			equalTo:"#new_password"  
		}
	  },
	messages: {
	    password:{
		required:"旧密码不能为空",
		minlength:"密码长度不能小于6位",
		maxlength:"密码长度不能大于20位"  
		},
		new_password:{
			required:"新密码不能为空",
			minlength:"密码长度不能小于6位",
			maxlength:"密码长度不能大于20位"
		},
		new_password1:{
			required:"验证密码不能为空",
			equalTo:"两次输入不相同"  
		}
	},
  });
  	
  	 //表单提交
    $("#submitBtn").click(function(){
        if($("#theForm").valid()){
                $("#submitBtn").attr("disabled",true);
		          $.ajax({
				         type: "post",
				         url: '${base}/m/forget/updatePass',
				         data: $("#theForm").serialize(),
				         dataType: "json",
						 async:true,
						 success:function(data) {
						 	if(data.success=='true'){
								 window.location.href = "${base}/m/index/login";
							}else{
								  layer.open({content:data.message , time: 1});
		                          //setTimeout(layer.msg(data.message, {icon: 2}),1000);
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
<div class="user_bar"><a class="back" href="${base}/m/authc/buyer/serviceCenter"><img src="${base}/res/html5/images/back_black.png" width="30" height="30" /></a><span class="fl">修改密码</span></div>
<div class="phone_main">
  <form  method="post" name="theForm"  id="theForm" action="">
   <div class="phone_login">
	 <ul>
		    <li class="ip ">
			      <input name="password" id="password" type="password"  placeholder="请输入密码" title="6-20位字符，可由英文、数字及标点符号组成">
		    </li>
		    <li class="yz"></li>
		    <li class="ip ">
			      <input name="new_password" id="new_password" type="password"  placeholder="请输入新密码" title="6-20位字符，可由英文、数字及标点符号组成">
		    </li>
		    <li class="yz"></li>
		    <li class="ip">
			    	<input name="new_password1" id="new_password1" type="password" placeholder="请再次确认密码">
		    </li>
		    <li class="yz"></li>
	 </ul>
  </div>
        <div class="red_submit">
      	   <a href="javascript:void(0)" id="submitBtn">确定</a>
        </div>
  </form>
</div>
<div class="note" id="note" style="display:none"></div>
<div class="brand_class_opcity" style="display:none"></div>
<!--底部-->
<@f.foot/>	
<!--按钮-->

</body>
</html>
