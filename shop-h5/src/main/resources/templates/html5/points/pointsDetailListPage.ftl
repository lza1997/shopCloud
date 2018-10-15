<#assign shopPointsLogListTag = newTag("shopPointsLogListTag")/>
<#assign shopPointsLogList =shopPointsLogListTag("{'tagDataType':'2','pageSize':'${pageSize}','pageNo':'${pageNo}'}")>
<#if shopPointsLogList?? && shopPointsLogList?size gt 0>
<#list shopPointsLogList as shopPointsLog>
<div class="con_list1">
   <ul>
	    <li class="one" style="width: 30%;height: 35px;">${shopPointsLog.createTimeStr}</li>
	    <li class="two" style="width: 23%;height: 35px;">${shopPointsLog.points}</li>
	    <li class="three" style="width: 19%;height: 35px;">${shopPointsLog.stage}</li>
	    <li class="four" style="width: 28%;height: 35px;">${shopPointsLog.desc}</li>
    </ul>
</div>
</#list>
</#if>