<@layout.head>
	<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
	<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
	<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css" />
	<script type="text/javascript" src="${base}/res/js/highchart/highcharts.js"></script>
	<script type="text/javascript" src="${base}/res/js/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${base}/res/js/highchart/highcharts.js"></script>
</@layout.head>
<@layout.body>
	<div class="page">
		<div class="fixed-bar">
			<div class="item-title">
				<h3>流量统计</h3>
				<ul class="tab-base">
					<li><a href="" class="current"><span>统计列表</span></a></li>
				</ul>
			</div>
		</div>

		<!-- 提示栏 -->
		<div class="fixed-empty"></div>

		<table class="table tb-type2" id="prompt">
			<tbody>
				<tr style="background: none repeat scroll 0% 0% rgb(255, 255, 255);" class="space odd">
					<th colspan="12">
						<div class="title">
							<h5>操作提示</h5>
							<span class="arrow"></span></div>
					</th>
				</tr>
				<tr style="background: none repeat scroll 0% 0% rgb(255, 255, 255);" class="odd">
					<td>
						<ul>
							<li>1、已参加其它活动，也可同时参加满即送活动。</li>
						</ul>
					</td>
				</tr>
			</tbody>
		</table>

		<!-- 搜索栏 -->
		<form method="post" name="queryListForm" id="acct-form">
			<table class="tb-type1 noborder search">
				<tbody>
					<tr>
						<th>时间：</th>
						<td class="w100">
							<select class="querySelect" name="timebutton" onchange="changetime(this.options[this.options.selectedIndex].value)">
								<option value="%Y-%m-%d">按周统计</option>
								<option value="%Y-%m %u">按月统计</option>
							</select>
						</td>
						<th>
							<label for="query_start_time">
								查询时间
						</th>
						<td>
							<input class="txt date" type="text" name="startTime" class="txt Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" value="${startTime}" />
							<label for="query_start_time">~</label>
							<input class="txt date" type="text" name="endTime" class="txt Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" value="${endTime}" />
						</td>
						<td class="w90 tc">
							<input type="hidden" name="condition" value="%Y-%m-%d">
							<a href="javascript:searchRangeTime();" class="btn-search"></a>
						</td>
					</tr 
				</tbody>
			</table>
		</form>

		<table class="table tb-type2">
			<thead>
				<tr class="thead">
				</tr>
			</thead>
			<tbody>
				<div id="container"></div>
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
	});

	function changetime(str) {
		$("[name=condition]").val(str);
		getData();
	}

	function searchRangeTime() {
		getData();
	}
	//hightchart报表
	function getData() {
		var xset = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30]; //X轴数据集  
		var yset = []; //Y轴数据集  
		var condition = $("[name=condition]").val(); //时间条件
		var startime = $("[name=startTime]").val(); //开始时间
		var endtime = $("[name=endTime]").val(); //结束时间
		$.ajax({
			type: "post",
			url: '${base}/platform/report/goodsstatcount',
			data: {
				"condition": condition,
				"startime": startime,
				"endtime": endtime
			},
			dataType: "json",
			async: false,
			success: function(data) {
				getstatcount(xset, data);
			}
		});
	}
	//初始化
	function getstatcount(xset, data) {
		$('#container').highcharts({
			"xAxis": {
				"categories": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30]
			},
			"series": [{
				"data": data,
				"name": "浏览量"
			}],
			"legend": {
				"enabled": false
			},
			"title": {
				"text": "商品访问量TOP30",
				"x": -20
			},
			"chart": {
				"type": "column"
			},
			"credits": {
				"enabled": false
			},
			"exporting": {
				"enabled": false
			},
			"yAxis": {
				"title": {
					"text": "\u8bbf\u95ee\u6b21\u6570"
				}
			}
		});
	}
</script>