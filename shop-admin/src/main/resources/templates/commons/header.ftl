<#macro header title="">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <meta http-equiv="Content-Type" content="text/html;" charset="UTF-8">
    <title>${title}</title>
    <link rel="shortcut icon" href="${base}/res/css/favicon.ico"/>
    <link href="${base}/res/css/skin_0.css" rel="stylesheet" type="text/css" id="cssfile"/>

    <script type="text/javascript" src="${base}/res/js/jquery.js"></script>
    <script type="text/javascript" src="${base}/res/js/jquery.validation.min.js"></script>
    <script type="text/javascript" src="${base}/res/js/jquery.cookie.js"></script>
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="${base}/res/js/html5shiv.js" type="text/javascript"></script>
    <script src="${base}/res/js/respond.min.js" type="text/javascript"></script>
    <![endif]-->
    <script src="${base}/res/js/admincp.js" type="text/javascript"></script>
    <script src="${base}/res/js/common.js" type="text/javascript"></script>
    <script type="text/javascript" src="${base}/res/js/layer/layer.js"></script>
    <script type="text/javascript">
        var APP_BASE = '${base}';
    </script>
    <#nested>
</head>
</#macro>

<#macro footer></#macro>