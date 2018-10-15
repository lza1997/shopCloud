<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>lza</title>
    <link rel="shortcut icon" href="${base}/res/css/favicon.ico"/>
    <link href="${base}/res/login/css/base.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${base}/res/js/jquery.js"></script>
    <script>
        var imgArr=['bg1.jpg','bg2.jpg','bg3.jpg','bg4.jpg'];
        function switchBg(){
            var randomBgIndex = Math.floor(Math.random() * imgArr.length);
            var img_url='${base}/res/login/images/'+imgArr[randomBgIndex];
            $("body").css("background","url("+img_url+")");
        }

        function changeCaptcha(){
            var captchaImg = '${base}/generateImage?t='+Math.random();
            $("#captcha_img").attr("src",captchaImg);
        }

        $(function(){
            changeCaptcha();
            switchBg();
            setInterval("switchBg()",5000);
            //跳出框架在主窗口登录
            if(top.location!=this.location)	top.location=this.location;
            $('#username').focus();

        });

    </script>
</head>

<body class="login-page" style="">
<div class="login-content">
    <div class="login-panel">
        <p class="logo animate0 bounceIn">
        	<img src="${base}/res/login/images/NZadmin-logo.png" alt="" style="width:300px;"/>
        </p>

        <form id="login" action="loginCheck" method="post">
            <ol class="login-form">
            <#if error??>
                <li class="login-alert">
                    <p class="alert-error">${error}</p>
                </li>
            </#if>
                <li class="animate1 bounceIn">
                    <input class="acc" type="text" name="username" id="username" placeholder="管理员账号" autocomplete="off"/>
                </li>
                <li class="animate2 bounceIn">
                    <input class="pass" type="password" name="password" id="password" placeholder="登录密码" autocomplete="off"/>
                </li>
               <#-- <li class="animate3 bounceIn">
                    <input class="code" type="text" name="captcha" id="captcha" placeholder="验证码"/>
                    <img src="${base}/generateImage" alt=""/>
                </li>-->
                <li class="animate3 bounceIn">
                    <input class="code" type="text" name="captcha" id="captcha" placeholder="验证码" autocomplete="off"/>
                    <span class="code-mod">
                        <img class="code-img" id="captcha_img" src="" title="点击更换一张"/>
                        <a href="javascript:void(0);" class="code-change" title="更换一张验证码" onclick="changeCaptcha()"></a>
                    </span>
                </li>
                <li class="animate4 bounceIn">
                    <button name="submit">登 录</button>
                    <label><input class="remember" type="checkbox" name="remember_me" value="1"/>记住账号</label>
                </li>
            </ol>
        </form>
    </div>
</div>

<div class="footer-fixed">
    <div class="footer">©2018 lza Inc.</div>
</div>
<!-- footer-wrap] -->
</body>
</html>
