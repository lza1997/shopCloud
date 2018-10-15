<#-- 自定义的分页指令。
属性说明：
   pageNo      当前页号(int类型)
   pageSize    每页要显示的记录数(int类型)
   toURL       点击分页标签时要跳转到的目标URL(string类型)
   recordCount 总记录数(int类型)
 使用方式：
  <#if recordCount??>
    <#import "/pager.ftl" as q>
    <@q.pager pageNo=pageNo pageSize=pageSize recordCount=recordCount toURL="testpager.do"/>
  </#if>
 -->
<#-- 版权归qiujy所有，转载请注明。qjyong@gmail.com -->

<#macro pager pageNo pageSize toURL recordCount>  
  <#-- 定义局部变量pageCount保存总页数 -->
  <#assign pageCount=((recordCount + pageSize - 1) / pageSize)?int>  
	<#if recordCount==0><#return/></#if>
<#-- 输出分页样式 -->

<#-- 页号越界处理 -->
  <#if (pageNo > pageCount)>
    <#assign pageNo=pageCount>
  </#if>
  <#if (pageNo < 1)>
    <#assign pageNo=1>
  </#if>
<#-- 输出分页表单 -->
<div class="pagination">
<form method="post" action="" name="qPagerForm">
<#-- 把请求中的所有参数当作隐藏表单域(无法解决一个参数对应多个值的情况) -->
<#list RequestParameters?keys as key>
<#if (key!="pageNo" && RequestParameters[key]??)>
<input type="hidden" name="${key}" value="${RequestParameters[key]}"/>
</#if>
</#list>
<input type="hidden" name="pageNo" value="${pageNo}"/>
<#-- 上一页处理 -->
    <ul>
        <#if (pageNo == 1)>
            <li><span>首页</span></li>
            <li><span>上一页</span></li>
        <#else>
            <li><a href="javascript:void(0)" class="demo" onclick="turnOverPage(1)" title="首页"><span>首页</span></a></li>
            <li><a href="javascript:void(0)" class="demo" onclick="turnOverPage(${pageNo - 1})" title="上一页"><span>上一页</span></a></li>
        </#if>
    <#-- 如果前面页数过多,显示... -->
        <#assign start=1>
        <#if (pageNo > 4)>
            <#assign start=(pageNo - 1)>
        <li><a href="javascript:void(0)" class="demo"  onclick="turnOverPage(1)"><span>1</span></a></li>
        <li>  <a href="javascript:void(0)" class="demo"  onclick="turnOverPage(2)"><span>2</span></a></li>
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
    </ul>
</form>
<script type="text/javascript">
  function turnOverPage(no){
    var queryForm=document.queryListForm;
    if(no>${pageCount}){no=${pageCount};}
    if(no<1){no=1;}
    var div = queryForm.div.value;
    var data = "pageNo="+no+"&"+$(queryForm).serialize();
    $.ajax({
        url:APP_BASE+"${toURL}",//默认加载list 页面
        data:data,
        dataType:'html',
        type: "POST",
		contentType:"application/x-www-form-urlencoded; charset=utf-8", 
        success: function(data){
			$(div).empty();
			$(div).html(data);
			$(div).hide();
			$(div).fadeIn(300);
		}
    });
  }
</script>
</div> 
</#macro>  