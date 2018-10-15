<#macro head title="管理后台">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge;chrome=1">
    <meta http-equiv="Content-Type" content="text/html;" charset="UTF-8">
    <title>${title}</title>
    <link href="${base}/res/css/skin_0.css" rel="stylesheet" type="text/css" id="cssfile"/>

    <script type="text/javascript" src="${base}/res/js/jquery.js"></script>
    <script type="text/javascript" src="${base}/res/js/jquery.validation.min.js"></script>
    <script type="text/javascript" src="${base}/res/js/admincp.js"></script>
    <script type="text/javascript" src="${base}/res/js/jquery.cookie.js"></script>
    <script type="text/javascript" src="${base}/res/js/common.js"></script>

    <script type="text/javascript">
        var APP_BASE = '${base}';
        LOADING_IMAGE = "${base}/res/images/loading.gif";
    </script>
    <#nested>
</head>
</#macro>

<#macro body>
<body>
<div id="append_parent"></div>
<div id="ajaxwaitid"></div>
    <#nested>
</body>
</html>
</#macro>

<#macro pager pager>
<#-- 定义局部变量pageCount保存总页数 -->
    <#assign pageNo=pager.pageNo?int>
    <#assign pageSize=pager.pageSize?int>
    <#assign recordCount=pager.totalRows?int>

    <#assign pageCount=pager.pageCount?int>
    <#if pager.totalRows==0><#return/></#if>
<#-- 输出分页样式 -->

<#-- 页号越界处理 -->
    <#if (pageNo > pageCount)>
        <#assign pageNo=pageCount>
    </#if>
    <#if (pageNo < 1)>
        <#assign pageNo=1>
    </#if>
<#-- 输出分页表单 -->
<#--共${recordCount}条数据,分${((recordCount+pageSize -1)/pageSize)?int}页,每页显示${pageSize}条-->
<div class="pagination">
    <ul><li>
        <#-- 上一页处理 -->
            <#if (pageNo == 1)>
                <li><span>首页</span></li>
            <#else>
                <li><a class="demo" href="javascript:void(0);" onclick="turnOverPage(1)"><span>首页</span></a></li>
                <li><a class="demo" href="javascript:void(0);" onclick="turnOverPage(${pageNo - 1})"><span>上一页</span></a></li>
            </#if>
        <#-- 如果前面页数过多,显示... -->
            <#assign start=1>
            <#if (pageNo > 4)>
                <#assign start=(pageNo - 1)>
                <li><a class="demo" href="javascript:void(0);" onclick="turnOverPage(1)"><span>1</span></a></li>
                <li><a class="demo" href="javascript:void(0);" onclick="turnOverPage(2)"><span>2</span></a></li>
                <li><span>...</span></li>
            </#if>
        <#-- 显示当前页号和它附近的页号 -->
            <#assign end=(pageNo + 1)>
            <#if (end > pageCount)>
                <#assign end=pageCount>
            </#if>
            <#list start..end as i>
                <#if (pageNo==i)>
                    <li><span class="currentpage">${i}</span></li>
                <#else>
                    <li><a class="demo" href="javascript:void(0);" onclick="turnOverPage(${i})"><span>${i}</span></a></li>
                </#if>
            </#list>
        <#-- 如果后面页数过多,显示... -->
            <#if (end < pageCount - 2)>
                <li><span>...</span></li>
            </#if>
            <#if (end < pageCount - 1)>
                <li><a class="demo" href="javascript:void(0);" onclick="turnOverPage(${pageCount - 1})"><span>${pageCount - 1}</span></a></li>
            </#if>
            <#if (end < pageCount)>
                <li><a class="demo" href="javascript:void(0);" onclick="turnOverPage(${pageCount})"><span>${pageCount}</span></a></li>
            </#if>
        <#-- 下一页处理 -->
            <#if (pageNo == pageCount)>
                <li><span>末页</span></li>
            <#else>
                <li><a class="demo" href="javascript:void(0);" onclick="turnOverPage(${pageNo + 1})"><span>下一页</span></a></li>
                <li><a class="demo" href="javascript:void(0);" onclick="turnOverPage(${((recordCount+pageSize -1)/pageSize)?int})"><span>末页</span></a></li>
            </#if>
        <script language="javascript">
            function turnOverPage(no) {
                var queryForm = document.formSearch;
                if (no >${pageCount}) {
                    no =${pageCount};
                }
                if (no < 1) {
                    no = 1;
                }
                queryForm.pageNo.value=no;
                queryForm.submit();
            }
        </script>
    </ul>
</div>
</#macro>