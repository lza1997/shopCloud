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
<div  class="page">
 <div class="fixed-bar">
        <div class="item-title">
            <h3>结算统计</h3>
           <ul class="tab-base">
                <li><a href="JavaScript:void(0);" name="timebutton" timeArg="%Y-%m-%d" class="current"><span>按日统计</span></a></li>
                <li><a href="JavaScript:void(0);" name="timebutton" timeArg="%Y-%u" ><span>按周统计</span></a></li>
                  <li><a href="JavaScript:void(0);" name="timebutton"timeArg="%Y-%m" ><span>按月统计</span></a></li>
                    <li><a href="JavaScript:void(0);"name="timebutton" timeArg="%Y"><span>按年统计</span></a></li>
            </ul>
           
        </div>
    </div>
      <div class="fixed-empty"></div>
   
    <form method="post" action="#" name="formSearch" id="formSearch">
        <input type="hidden" name="pageNo" value="${pager.pageNo}">
        <table class="tb-type1 noborder search">
            <tbody>
      <tr>
      <!--  <td>
	        <input style="cursor:pointer" type="button" value="本周情况" name="timebutton" timeArg="%Y-%u">&nbsp;
	        <input style="cursor:pointer" type="button" value="本月情况" name="timebutton" timeArg="%Y-%m">&nbsp;
	        <input style="cursor:pointer" type="button" value="今年情况" name="timebutton" timeArg="%Y">
             <input style="cursor:pointer" type="button" value="导出pdf" exportType="pdf" name="export">&nbsp;
 			<input style="cursor:pointer" type="button" value="导出excel" exportType="excel" name="export">&nbsp;
        </td>-->
       <th>查询时间：</th>
        <td>
	        <input type="text" class="txt date"  value="${startTime}" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'});" id="start" /> &#8211;
	        <input type="text" class="txt date"   value="${endTime}" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'});" id="end" />
        </td>
          <th>订单状态：</th>
        <td>
         <select class="querySelect" name="balanceState"> 订单状态：0:已取消;10:待付款;20:待发货;30:待收货;40:交易完成;50:已提交;60:已确认;
                  			 <option value="">请选择...</option>
		                        <option value="0">未结算</option>
		                        <option value="1">已结算</option>
                    </select>
            </td>
        <td>
        	<a href="javascript:void(0);"  onclick="searchRangeTime();" class="btn-search " title="查询"></a>
        </td>
     
      </tr>
        </table>
         <input type="hidden" name="toUrl" value="${toUrl}">
	 	 <input type="hidden" name="condition" value="${condition}">
	 	 <input type="hidden" name="storeId" value="${storeId}">
    </form>
  <!-- JS统计图表 -->
  <div id="container" style="height:850px">
		<iframe id="myframe"  width="100%" height="100%"  frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes" ></iframe>
  </div>
<script type="text/javascript">
$(function(){
	init();
});
//初始化
function init(){
	
	var storeId = $("[name=storeId]").val();
	var toUrl = $("[name=toUrl]").val();
		var args = "";
		var condition = $("[name=condition]").val();
		args += "&toUrl=" + toUrl + "&condition=" +condition + "&storeId=" + storeId
		encodeURI(args)
		var url = '${base}/report/${toUrl}';
				$("#myframe").attr("src",url + "?" + encodeURI(args));
}

//改变报表
function changeReport(){
	var startTime = $("#start").val();
	var endTime = $("#end").val();
	var toUrl = $("[name=toUrl]").val();
	var storeId = $("[name=storeId]").val();
	var condition = $("[name=condition]").val();
	var balanceState = $("[name=balanceState]").val();
	var args = "";
	args += "startTime=" + startTime + "&endTime=" + endTime + "&toUrl=" + toUrl + "&condition=" + condition + "&storeId=" + storeId+"&balanceState="+balanceState;
	var url = '${base}/report/${toUrl}';
	encodeURI(args)
		$("#myframe").attr("src",url + "?" + encodeURI(args));
	//window.location.href = ;
}


</script>

<script type="text/javascript">
$(function(){
	//时间的三个按钮
    $("[name=timebutton]").click(function(){
  		  $("[name=timebutton]").removeClass("current");
   		 $(this).addClass("current");
    	var timeArg = $(this).attr("timeArg");
    	 $("[name=condition]").val(timeArg);
    		changeReport();
    });
});
//查询指定日期
function searchRangeTime(){
	changeReport();
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