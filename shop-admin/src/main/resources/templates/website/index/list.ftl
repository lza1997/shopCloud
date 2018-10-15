<@layout.head>
<link href="${base}/res/css/font/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
<!--[if IE 7]>
<link rel="stylesheet" href="${base}/res/css/font/font-awesome/css/font-awesome-ie7.min.css">
<![endif]-->
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>首页管理</h3>
            <ul class="tab-base">
                <li><a href="JavaScript:void(0);" class="current"><span>管理</span></a></li>
                <li><a href="${base}/website/index/forward?id=0&type=${type}"><span>新增楼层</span></a></li>
                <#-- <li><a href="${base}/website/index/forwardBanner"><span>新增图片</span></a></li>
                <li><a href="${base}/website/index/getBrand"><span>新增品牌</span></a></li> -->
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <table class="table tb-type2" id="prompt">
        <tbody>
        <tr class="space odd">
            <th colspan="12"><div class="title"><h5>操作提示</h5><span class="arrow"></span></div></th>
        </tr>
        <tr>
            <td>
                <ul>
                    <li>排序越小越靠前，可以控制楼层显示先后。</li>
                </ul>
            </td>
        </tr>
        </tbody>
    </table>
    <table class="table tb-type2 nobdb">
        <thead>
        <tr class="thead">
            <th class="align-center">排序</th>
            <th class="align-center">楼层名称</th>
            <th class="align-center">楼层副标题</th>
            <th class="align-center">显示</th>
            <th class="align-center">操作</th>
        </tr>
        </thead>
        <tbody>
        <#list list as code>
            <tr class="hover">
                <td class="align-center">${code.sort}</td>
                <td class="align-center">${code.showName}</td>
                <td class="align-center">
                       <#if code.codeInfo ??&& code.codeInfo!=null>
	                        <#assign json=code.codeInfo?eval />
	                		${json.subName}
                	   </#if>
                </td>
                <td class="w150 align-center"><#if code.isShow == 1>是<#else>否</#if></td>
                <td class="w150 align-center">
                    <a href="${base}/website/index/forward?id=${code.codeId}&type=${type}">编辑</a>|
                    <a href="${base}/website/index/delete?id=${code.codeId}">删除</a></td>
            </tr>
        </#list>
        </tbody>
    </table>
</div>
</@layout.body>