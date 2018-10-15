<@layout.head>
	<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
	<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
	<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css" />
	<script type="text/javascript" src="${base}/res/js/highchart/highcharts.js"></script>
	<script type="text/javascript" src="${base}/res/js/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${base}/res/js/highchart/highcharts.js"></script>
	<script src="${base}/res/js/layer/layer.js"></script>
</@layout.head>
<@layout.body>
	<div class="page">
		<div class="fixed-bar">
			<div class="item-title">
				<h3>成交统计</h3>
				<ul class="tab-base">
					<li><a href="${base}/platform/report/orderIndex"><span>订单统计</span></a></li>
					<li><a href="javascript:void(0);" class="current"><span>成交订单统计</span></a></li>
				</ul>
			</div>
		</div>

		<!-- 提示栏 -->
		<div class="fixed-empty"></div>

		<table class="table tb-type2" id="prompt">

		</table>

		<!-- 搜索栏 -->
		<form method="post" name="queryListForm" id="acct-form">
			<input type="hidden" name="div" id="div" value="#highchartlist" />
			<input type="hidden" id="pageNo" />
			<input type="hidden" id="orderState" name="orderState" value="${orderState}" />
			<table class="tb-type1 noborder search">
				<tbody>
					<tr>
						<th>时间：</th>
						<td class="w100">
							<select class="querySelect" name="timebutton" onchange="changetime(this.options[this.options.selectedIndex].value)">
								<option value="%Y-%m-%d %h">按日统计</option>
								<option value="%Y-%m-%d">按周统计</option>
								<option value="%Y-%m %u">按月统计</option>
								<option value="%Y-%m">按年统计</option>
							</select>
						</td>
						<th>
							<label for="query_start_time">
								下单时间
						</th>
						<td>
							<input class="txt date" type="text" name="startTime" class="txt Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" value="${startTime}" />
							<label for="query_start_time">~</label>
							<input class="txt date" type="text" name="endTime" class="txt Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" value="${endTime}" />
						</td>
						<td class="w90 tc">
							<input type="hidden" name="condition" value="%Y-%m-%d %h">
							<a href="javascript:searchRangeTime();" class="btn-search"></a>
						</td>
						<td class="w90 tc">
							<input type="button" name="export" value="导出" />
						</td>
					</tr </tbody>
			</table>
		</form>
		<table class="table tb-type2">
			<thead>
				<tr class="thead">
				</tr>
			</thead>
			<tbody>
				<div id="highchartContainer">

				</div>
				<div id="highchartlist">

				</div>
			</tbody>
			<tfoot>
				<tr class="tfoot">
					<td colspan="30">
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</@layout.body>
<script type="text/javascript">
	$(function() {
		getData();
		initDataList();
	});
	/*初始化*/
	function initDataList() {
		var div = "#highchartlist"; //显示的list 数据div id 必须传递
		var orderState = '${orderState}';
		$.ajax({
			async: false,
			url: "${base}/platform/report/kdhighchartorderlist", //默认加载list 页面
			data: {
				div: div,
				orderState: orderState
			},
			error: function() {
				layer.msg("通讯失败!", 1, 9);
				/* frameControl.lhDgFalInfo("通讯失败!");*/
			},
			dataType: 'html',
			type: "POST",
			contentType: "application/x-www-form-urlencoded; charset=utf-8",
			success: function(data) {
				$(div).empty();
				$(div).html(data);
				$(div).hide();
				$(div).fadeIn(300);
			}
		});
	}
</script>
<script type="text/javascript">
	function changetime(str) {
		$("[name=condition]").val(str);
		$("[name=startTime]").val("");
	    $("[name=endTime]").val("");
		getData();
	}
	//查询指定日期
	function searchRangeTime() {
		getData();
	}
	//导出
	$("[name=export]").click(function() {
		var condition = $("[name=condition]").val(); //时间条件
		var orderState = $("#orderState").val(); //店铺状态
		var startime = $("[name=startTime]").val(); //开始时间
		var endtime = $("[name=endTime]").val(); //结束时间
		$.ajax({
			type: "post",
			url: '${base}/platform/report/loadordercount',
			data: {
				"condition": condition,
				"orderState": orderState,
				"startime": startime,
				"endtime": endtime
			},
			dataType: "json",
			async: false,
			success: function(data) {
				if (data.success) {
					layer.msg(data.message, {
						icon: 1
					});
					location.href = '${imgServer}' + data.excelurl;
				} else {
					layer.msg(data.message, {
						icon: 2
					});
				}
			}
		});
	});
	//hightchart报表
	function getData() {
		var xset = []; //X轴数据集  
		var yset = []; //Y轴数据集  
		var condition = $("[name=condition]").val(); //时间条件
		var orderState = $("#orderState").val();; //店铺状态
		var startime = $("[name=startTime]").val(); //开始时间
		var endtime = $("[name=endTime]").val(); //结束时间
		$.ajax({
			type: "post",
			url: '${base}/platform/report/ordercountHighChart',
			data: {
				"condition": condition,
				"orderState": orderState,
				"startime": startime,
				"endtime": endtime
			},
			dataType: "json",
			async: false,
			success: function(data) {
				$.each(data, function(i, item) {
					$.each(item, function(k, v) {
						xset.push(k);
						yset.push(v);
					});
				})
				chart(xset, yset);
			}
		});
	}

	function chart(xset, yset) {
		$('#highchartContainer').highcharts({
			title: {
				text: '订单销量',
				x: -20 //center
			},
			xAxis: {
				categories: xset,
				labels: {
					//X轴倾斜45度
					rotation: -45,
					align: 'right',
					style: {
						fontSize: '12px',
						fontFamily: 'Times New Roman'
					}
				}
			},
			yAxis: {
				title: {
					text: '销量'
				},
				plotLines: [{
					value: 0,
					width: 1,
					color: '#808080'
				}]
			},
			tooltip: {
				valueSuffix: '单'
			},
			legend: {
				layout: 'vertical',
				align: 'right',
				verticalAlign: 'middle',
				borderWidth: 0
			},
			series: [{
				name: '订单销量统计',
				data: yset
			}]
		});
	}
</script>