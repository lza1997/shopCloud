<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,inital-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta name="apple-wap-web-app-capable" content="yes">
    <meta name="apple-wap-web-app-status-bar-style" content="black-translucent">
<#--清除缓存	-->
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
<#--清除缓存	-->
    <title>${store.storeName}</title>
    <link href="${base}/res/html5/css/style.css" rel="stylesheet" type="text/css"/>
    <script src="${base}/res/html5/js/jquery-1.10.2.min.js"></script>
    <!-- 手机端弹出框开始 -->
    <script src="${base}/res/html5/js/mobile/layer.m.js" charset="utf-8"></script>
    <!-- 手机端弹出框结束 -->
    <script type="text/javascript" src="${base}/res/js/ajaxfileupload/ajaxfileupload.js"></script>
</head>
<body style="background:#fff">


<div class="ncu-form-style">
    <form method="post" id="profile_form" action="">
        <input type="hidden" name="memberId" id="memberId" value="${member.memberId}"/>
        <div class="ncu-form-style">
            <dl>
                <dd>
                    <input type="hidden" id="memberAvatar" name="memberAvatar" value=""/>
                    <p class="picture">
                    <#if member.memberAvatar??>
	            	   <#if member.memberType??>
	            		<img src="${member.memberAvatar}" id="memberAvatarimage" width="120" height="120" alt="" nc_type="avatar"/>
	            		<#else>
	            		 <img src="${imgServer}/${member.memberAvatar}" width="120" height="120" alt="" nc_type="avatar"/>
	            	  </#if>
	            	  
	            	<#else>
	            		<img src="${base}/res/images/member/default_image.png" id="memberAvatarimage" nc_type="store_Labelimage"
                             style="width: 200px;height: 60px;"/>
	            	</#if>
                    </p>
                    <p class="select_box">
                        <input type="file" name="files" hidefocus="true" id="memberAvatarfile" nc_type="change_storeLable_file"
                               onChange="ajaxFileUploads('memberAvatarfile','memberAvatarimage','memberAvatar');"/>
                        <span><i class="fa fa-image fa-2x"></i></span>
                    </p>
                </dd>
            </dl>
            <dl class="bottom">
                <dt>&nbsp;</dt>
                <dd>

                </dd>
            </dl>
            <input type="button" id="submitBtn" name="Submit" value="保存修改" class="submitsubmit fl" title="立即注册"/>
            <!-- <input type="submit" class="submit" value="保存修改" /> -->
        </div>
    </form>
</div>
<script type="text/javascript">
    $(function () {
        $("#submitBtn").click(function () {
            $.ajax({
                type: "post",
                url: '${base}/user/setting/updateFace',
                data: $("#profile_form").serialize(),
                dataType: "json",
                async: false,
                success: function (data) {
                    if (data.success) {
                        location.href = "${base}/m/authc/buyer/center";
                    } else {
                        layer.open({content: '上传失败!', time: 1});
                    }
                }
            });
        });
    });
    //上传图片
    function ajaxFileUploads(myBlogImage, imgId, img) {
        $.ajaxFileUpload({
            //处理文件上传操作的服务器端地址(可以传参数,已亲测可用)
            url: '${base}/fileupload/fileUpload',
            secureuri: false,                      //是否启用安全提交,默认为false
            fileElementId: myBlogImage,           //文件选择框的id属性
            dataType: 'json',                       //服务器返回的格式,可以是json或xml等
            fileSize: 5120000,
            allowType: 'jpg,jpeg,png,JPG,JPEG,PNG',
            success: function (data, status) {        //服务器响应成功时的处理函数
                if (true == data.success) {     //0表示上传成功(后跟上传后的文件路径),1表示失败(后跟失败描述)
                    //alert(data.result);
                    $("img[id='" + imgId + "']").attr("src", "${imgServer}" + data.result);
                    $("#" + img).val(data.result);
                }
            },
            error: function (data, status, e) { //服务器响应失败时的处理函数
                layer.msg('图片上传失败，请重试！！', {icon: 2});
                //layer.msg('图片上传失败，请重试！！', 1, 8);
                //$('#result').html('图片上传失败，请重试！！');
            }
        });
    }
</script>
</body>
</html>