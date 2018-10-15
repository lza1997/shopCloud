<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/jquery.edit.js"></script>
<script src="${base}/res/js/layer/layer.js"></script>
<script type="text/javascript" src="${base }/res/js/TimeUtils.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/My97DatePicker/WdatePicker.js"></script>
</@layout.head>
<@layout.body>
<div>
 <div>
     <div>
         <h3>商品流量情况</h3>
     </div>
 </div>
    <table>
      <tr>
        <td>
	        <input style="cursor:pointer" type="button" value="本周情况" name="timebutton" timeArg="week">&nbsp;
	        <input style="cursor:pointer" type="button" value="本月情况" name="timebutton" timeArg="month">&nbsp;
	        <input style="cursor:pointer" type="button" value="今年情况" name="timebutton" timeArg="year">
            <!-- <input style="cursor:pointer" type="button" value="导出pdf" exportType="pdf" name="export">&nbsp;
 			<input style="cursor:pointer" type="button" value="导出excel" exportType="excel" name="export">&nbsp; -->
        </td>
        <th>查询时间：</th>
        <td>
	        <input type="text" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" id="start" style="margin-top: 10px;"/> &#8211;
	        <input type="text" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" id="end" style="margin-top: 10px;"/>
        </td>
        <td>
        	<input type="button" id="rangeTime" onclick="searchRangeTime();" value="查询">
        </td>
      </tr>
    </table>
  <form method="get" action="javascript:void(0);" name="queryListForm" id="timeCondition">
	  <input type="hidden" name="startTime" value="${startTime}">
	  <input type="hidden" name="endTime" value="${endTime}">
	  <input type="hidden" name="toUrl" value="${toUrl}">
	  <input type="hidden" name="condition" value="${condition}">
	  <input type="hidden" name="storeId" value="${storeId}">
  <form>
  <!-- JS统计图表 -->
  <div id="container" style="width: 800px; height: 400px; margin: 0 auto">
  
  </div>
<script type="text/javascript">
$(function(){
	init();
});
//初始化
function init(){
	/* if('${toUrl}' == 'storeSellCount'){
		$("#goodsTable").attr("class","active");
	}else if('${toUrl}' == 'storeTotalCount'){
		$("#storeTable").attr("class","active");
	} */
	if('${condition}' == "assign"){
		$("#start").attr("value",$("[name=startTime]").val());
		$("#end").attr("value",$("[name=endTime]").val());
	}
	var url = '${base}/report/${toUrl}';
	var args = {
			"startTime":$("[name=startTime]").val(),
			"endTime":$("[name=endTime]").val(),
			"toUrl":$("[name=toUrl]").val(),
			"condition":$("[name=condition]").val(),
			"storeId":$("[name=storeId]").val()
			};
	$.post(url, args, function(data){
		if(data == ""){
			var condition = $("[name=condition]").val();
			if(condition == "week"){
				layer.msg("这周暂无商品有访问量" , {icon:2});
			}else if(condition == "month"){
				layer.msg("当月暂无商品有访问量" , {icon:2});
			}else if(condition == "year"){
				layer.msg("今年暂无商品有访问量" , {icon:2});
			}else if(condition == "today"){
				layer.msg("今日暂无商品有访问量" , {icon:2});
			}else if(condition == "assign"){
				layer.msg("您选择的日期中暂无商品有访问量" , {icon:2});
			}
		}else{
			$("#container").append(data);
		}
	});
}

//改变报表
function changeReport(condition){
	var startTime = $("[name=startTime]").val();
	var endTime = $("[name=endTime]").val();
	var toUrl = $("[name=toUrl]").val();
	var storeId = $("[name=storeId]").val();
	var args = "";
	args += "startTime=" + startTime + "&endTime=" + endTime + "&toUrl=" + toUrl + "&condition=" + condition + "&storeId=" + storeId
	var url = '${base}/report/${baseUrl}';
	window.location.href = url + "?" + args;
}

//切换table
function changeReportTable(toUrl){
	$("[name=startTime]").attr("value","");
	$("[name=endTime]").attr("value","");
	$("[name=toUrl]").attr("value",toUrl);
	changeReport("today");
}
</script>

<script type="text/javascript">
$(function(){
	//时间的三个按钮
    $("[name=timebutton]").click(function(){
    	var timeArg = $(this).attr("timeArg");
    	if(timeArg == "week"){
    		var startTime = getWeekStartDate();
    		$("[name=startTime]").attr("value",startTime);
    		changeReport(timeArg);
    	}else if(timeArg == "month"){
    		var startTime = getMonthStartDate();
    		$("[name=startTime]").attr("value",startTime);
    		changeReport(timeArg);
    	}else if(timeArg == "year"){
    		var startTime = nowYear + "-01-01" + " 00:00:00"; 
    		$("[name=startTime]").attr("value",startTime);
    		changeReport(timeArg);
    	}
    });
});
//查询指定日期
function searchRangeTime(){
	//设置开始时间
	var startTime = $("#start").val();
	$("[name=startTime]").attr("value",startTime);
	//设置结束时间
	var endTime = $("#end").val();
	$("[name=endTime]").attr("value",endTime);
	changeReport("assign");
}
//导出
$("[name=export]").click(function(){
	var startTime = $("[name=startTime]").val();
	var endTime = $("[name=endTime]").val();
	var toUrl = $("[name=toUrl]").val();
	var condition = $("[name=condition]").val();
	var storeId = $("[name=storeId]").val();
	var exportType = $(this).attr("exportType");
	var args = "";
	args += "startTime=" + startTime + "&endTime=" + endTime + "&toUrl=" + toUrl + "&condition=" + condition + "&exportType=" + exportType
	window.location.href='${base}/report/'+toUrl + "?"+args;
});
</script>    
  </div>
    <div class="clear"></div>
</div>
</@layout.body>