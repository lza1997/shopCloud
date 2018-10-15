<#assign recommendPointsGoodsTag = newTag("recommendPointsGoodsTag") />
<#assign pager = recommendPointsGoodsTag("{'pageNo':'${pageNo}','pagesize':'${pageSize}'}") />
<#list pager.result as pointsGoods >
 <div <#if (pointsGoods_index+1)%2==0>class="right_xiangxi"<#else>class="left_xiangxi"</#if>>
 <a href="${base}/points/pointsDetail?id=${pointsGoods.id}" target="_blank">
 	<img src="${imgServer}${pointsGoods.pointsGoodsImage}" width="160px;" height="160px;">
 </a>
   <p>${pointsGoods.pointsGoodsName}</p>
    <span style="color:#C81316;font-size:18px;">
	    <b style="font-size:16px">需要积分</b> 
	    ${pointsGoods.pointsnums}
    </span>
 </div>
</#list>  
<script>
	var height = 0;
	var length = $("#content div").length;
	if(length%2==0){
		height = length*125;
	}else{
		height = (length/2+1)*210;
	}
	$("#content").css("height",height);
</script>
