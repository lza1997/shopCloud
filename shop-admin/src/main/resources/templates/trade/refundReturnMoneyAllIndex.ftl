<@p.header title="demo">
<script type="text/javascript" src="${base}/res/jquery.dataTables/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${base}/res/js/grid.js"></script>
<script type="text/javascript" src="${base}/res/js/commons.js"></script>

<link href="${base}/res/js/lib/jquery.dataTables/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
</@p.header>

<body>
	<div class="iframebox">
		<div class="cont-tit">
			<ul>
			<li style="margin-right: 20px">
				<h3>退款管理</h3>
			</li>
				<li>
					<a href="${base}/refundReturn/moneyIndex" class="current"><span >待处理&nbsp;</span></a>
				</li>
				<li>
					<a href="${base}/refundReturn/moneyIndexAll" class="current"><span style="color:#F0F;background-position: 100% -240px;">所有记录&nbsp;</span></a>
				</li>
			</ul>
		</div>
		
		
        <div class="control-mod">
            <form id="acct-form" method="post" action="" name ="queryListForm">
            	<input type="hidden" id="div" value = "#dataListDiv"/>
            	<input type="hidden" name="status" value = "all"/>
            	<input type="hidden" id="pageNo" />
            	 <select name="sType" class="select">
            	  <option value="order_sn">订单编号</option>
            	  <option value="refund_sn">退货编号</option>
            	  <option value="store_name">店铺名</option>
            	  <option value="goods_name">商品名称</option>
            	  <option value="buyer_name">买家会员名</option>
            	  </select>
               	 <input type="text" name="sValue" class="text" placeholder="输入" value=""/>
              	<span class="col">时间：
                    <input id="d5221" name="starttime" class="Wdate" style="width: 120px" type="text" onFocus="var d5222=$dp.$('d5222');WdatePicker({onpicked:function(){d5222.focus();},maxDate:'#F{$dp.$D(\'d5222\')}'})"/>
					至
					<input id="d5222" name="endtime" style="width: 120px" class="Wdate" type="text" onFocus="WdatePicker({minDate:'#F{$dp.$D(\'d5221\')}'})"/>
                </span>
                <button type="button" class="btng" onclick="sbQuery();">搜索</button>
                <button type="button" class="btng" onclick="resetFm();">重置</button>
            </form>
        </div>
        <div style="width:100%;" id="dataListDiv"></div>
	</div>
	
</body>
<script type="text/javascript">
	/*界面初始化*/
	$(function(){
		initDataList();
	});
	
	//初始化
	function initDataList(){
		var div = "#dataListDiv";//显示的list 数据div id 必须传递 
		$.ajax({
            async:false,
            url:"${base}/refundReturn/moneyList",//默认加载list 页面
            data:{div:div,status:'all'},//默认status是待处理的订单
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

	/**搜索方法***/
	function sbQuery(){
		var div = $("#div").val();
		var parma = $("#acct-form").serialize();
		$.ajax({
            async:false,
            url:"${base}/refundReturn/moneyList",//默认加载list 页面
            data:parma,
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
	
	
	
	
	
	</script>
  
