<html><head>
    <meta charset="UTF-8">
    <title>后台管理</title>
    <link href="${base}/res/css/skin_0.css" rel="stylesheet" type="text/css"/>
    <style id="style-1-cropbar-clipper">
    .en-markup-crop-options {
        top: 18px !important;
        left: 50% !important;
        margin-left: -100px !important;
        width: 200px !important;
        border: 2px rgba(255,255,255,.38) solid !important;
        border-radius: 4px !important;
    }

    .en-markup-crop-options div div:first-of-type {
        margin-left: 0px !important;
    }
    </style></head>
<body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>系统消息</h3>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <table class="table tb-type2 msg">
        <tbody class="noborder">
        <tr>
            <td rowspan="5" class="msgbg"><br><br><br><br><br><br><br><br></td>
            <td class="tip">${msg}</td>
        </tr>
        <#if !noAuto?exists || noAuto==false>
        <tr>
            <td class="tip2">若不选择将自动跳转</td>
        </tr>
        </#if>
        <tr>
            <td>          <a href="${referer}" class="btns"><span>返回上一页</span></a>
                <#if !noAuto?exists || noAuto==false><script type="text/javascript"> window.setTimeout("javascript:location.href='${referer}'", 2000); </script></#if>
            </td>
        </tr>
        </tbody>
    </table>
</div>

</body></html>