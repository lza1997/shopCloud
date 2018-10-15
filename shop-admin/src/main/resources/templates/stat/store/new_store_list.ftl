
<div id="main" style="height: 400px; width:1000px; border: 1px solid #ccc; padding: 10px;"></div>
<div class="cont-mod" style="width:1000px; border: 1px solid #ccc; padding: 10px;">
    <!-- 数据列表 -->
    <table class="member-list" id="acct_grid" border="0" style="padding: 10px;">
        <thead>
        <tr>
            <th width="20%">日期</th>
            <th width="19%">上月</th>
            <th width="10%">本月</th>
            <th width="10%">同比</th>
            <th width="15%">操作</th>
        </tr>
        </thead>
        <tbody id="grid">
        <#if datas??>
            <#list datas as str>
            <tr>
                <td>${str.day}</td>
                <td>${str.yesCount}</td>
                <td>${str.todayCount}</td>
                <td></td>
                <td></td>
            </tr>
            </#list>
        </#if>
        </tbody>
    </table>
</div>

<script type="text/javascript" language="javascript">
    require.config({
        packages: [{
            name: 'echarts',
            location: '${base}/res/js/jsPlugins/echarts',
            main: 'echarts'
        },
            {
                name: 'zrender',
                location: '${base}/res/js/jsPlugins/echarts/zrender', // zrender与echarts在同一级目录
                main: 'zrender'
            }
        ]
    });


    require(
            [
                'echarts',
                'echarts/chart/line'
            ],
            //回调函数
            DrawEChart
    );

    //渲染ECharts图表
    function DrawEChart(ec) {



        //图表渲染的容器对象
        var chartContainer = document.getElementById("main");
        //加载图表
        var myChart = ec.init(chartContainer);
        myChart.setOption({
            //图表标题
            title: {
                text: "新增统计", //正标题
                //link: "http://www.stepday.com", //正标题链接 点击可在新窗口中打开
                x: "center", //标题水平方向位置
                //subtext: "", //副标题
                //sublink: "http://www.stepday.com", //副标题链接
                //正标题样式
                textStyle: {
                    fontSize:24
                },
                //副标题样式
                subtextStyle: {
                    fontSize:12,
                    color:"red"
                }
            },
            //数据提示框配置
            tooltip: {
                trigger: 'axis' //触发类型，默认数据触发，见下图，可选为：'item' | 'axis' 其实就是是否共享提示框
            },
            //图例配置
            legend: {
                data: ['上月', '本月'], //这里需要与series内的每一组数据的name值保持一致
                y:"bottom"
            },
            //工具箱配置
            toolbox: {
                show: true, //是否显示工具箱
                feature: {
                    mark: false, // 辅助线标志，上图icon左数1/2/3，分别是启用，删除上一条，删除全部
                    dataView: { readOnly: false }, // 数据视图，上图icon左数8，打开数据视图
                    magicType: ['line', 'bar'],      // 图表类型切换，当前仅支持直角系下的折线图、柱状图转换，上图icon左数6/7，分别是切换折线图，切换柱形图
                    restore: true, // 还原，复位原始图表，上图icon左数9，还原
                    saveAsImage: true  // 保存为图片，上图icon左数10，保存
                }
            },
            calculable: true,
            //轴配置
            xAxis: [
                {
                    type: 'category',
                    data: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11',
                        '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23',
                        '24','25','26','27','28','29','30','31'],
                    name: "日期"
                }
            ],
            //Y轴配置
            yAxis: [
                {
                    type: 'value',
                    splitArea: { show: true },
                    name:"新增会员数"
                }
            ],
            //图表Series数据序列配置
            series: [
                {
                    name: '上月',
                    type: 'line',
                    data: [${yestoday}]
                },
                {
                    name: '本月',
                    type: 'line',
                    data: [${today}]
                }
            ]
        });
    }
</script>
