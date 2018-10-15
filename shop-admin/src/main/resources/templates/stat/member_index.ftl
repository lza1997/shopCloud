<@p.header title="demo">
<script type="text/javascript" src="${base}/res/jquery.dataTables/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${base}/res/js/grid.js"></script>
<script type="text/javascript" src="${base}/res/js/commons.js"></script>
<script type="text/javascript" src="${base}/res/js/jsPlugins/echarts/esl.js"></script>
<script type="text/javascript" src="${base}/res/js/jsPlugins/echarts/echarts-map.js"></script>
<link href="${base}/res/js/lib/jquery.dataTables/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
</@p.header>

<body>
	<div class="iframebox">
		<h3 class="cont-tit">会员统计</h3>
        <ul class="cont-tab">
        	<li class="cur" id="hy"><a href="javaScript:void(0);" onclick ="initDataList(1);">新增会员</a></li>
        	<li id="qy"><a href="javaScript:void(0);" onclick ="initDataList(2);">区域分析</a></li>
        </ul>
       
        <div style="width:100%;" id="dataListDiv"></div>
	</div>
	
</body>
<script type="text/javascript">
	/*界面初始化*/
	$(function(){
		initDataList(1);
		$("#month").show();
	});
	
	//初始化
	function initDataList(type){
		var url = "";
		if(type =='1'){
			$('#qy').removeAttr("class");
			$("#hy").attr("class", "cur"); 
			url = "${base}/stat/member/monthlist";//默认加载list 页面
		}else{
			$('#hy').removeAttr("class");
			$("#qy").attr("class", "cur"); 
			url = "${base}/stat/member/maplist";//默认加载list 页面
		}
		var div = "#dataListDiv";//显示的list 数据div id 必须传递 
		$.ajax({
            async:false,
            url:url,
            data:{div:div},
            error:function(){frameControl.lhDgFalInfo("通讯失败!");},
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

	
	
	/*重置表单*/
	function resetFm(){$("#acct-form")[0].reset();}
	
	
	$(document).ready(function(){
	  $("#select").change(function(){
	  
			var val = $(this).val();
			if(val == "1"){
				$("#day").show();
				$("#month").hide();
			}
			if(val == "2"){
				$("#day").hide();
				$("#month").hide();
			}
			if(val == "3"){
				$("#month").show();
				$("#day").hide();
			}
	  });
	});
	
	
	//$("#22").click(function(){
	  //$("p").hide();
	//});
	
	//$("#show").click(function(){
	 //$("p").show();
	//});
	
	
	</script>
  
