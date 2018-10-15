<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>系统文章</h3>
            <ul class="tab-base">
                <li><a href="JavaScript:void(0);" class="current"><span>管理</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <table class="table tb-type2" id="prompt">
        <tbody>
        <tr class="space odd">
            <th class="nobg" colspan="12"><div class="title"><h5>操作提示</h5><span class="arrow"></span></div></th>
        </tr>
        <tr>
            <td>
                <ul>
                    <li>在相关操作处可查看具体内容，例：在注册会员时须查看用户服务协议</li>
                </ul></td>
        </tr>
        </tbody>
    </table>
    <table class="table tb-type2 nobdb">
        <thead>
        <tr class="thead">
        	<th class="align-center">ID</th>
            <th class="align-center">标题</th>
            <th class="align-center">添加时间</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
     <#list list as document>

     <tr class="hover">
     	 <td class="align-center">${document.docId}</td>
         <td class="align-center">${document.docTitle}</td>
         <td class="align-center">${document.createTimeStr?string("yyyy-MM-dd HH:mm:ss")}</td>
         <td class="w96"><a href="${base}/website/document/forward?id=${document.docId}">编辑</a></td>
     </tr>
    </#list>
        </tbody>
    </table>
</div>
</@layout.body>