<@p.header title="demo">
<script type="text/javascript" src="${base}/res/jquery.dataTables/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${base}/res/js/grid.js"></script>
<script type="text/javascript" src="${base}/res/js/commons.js"></script>

<link href="${base}/res/jquery.dataTables/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
</@p.header>

<body>
	<div class="iframebox">
        <div>
             <form id="acct-form" method="post" action="${base}/refundReturn/updateRefundReturnMoney">
		        <div class="form-mod">
		        	<input type="hidden" name="id" value="${refundReturn.refundId}">
		            <p class="item"><label class="tit">退款订单号：</label>
		                ${refundReturn.refundSn}&nbsp;
		            </p>
		            <p class="item"><label class="tit">商品名称：</label>
		                ${refundReturn.goodsName}&nbsp;
		            </p>
		            <p class="item"><label class="tit">退款金额：</label>
		                ${refundReturn.refundAmount/100}
		            </p>
		            <p class="item"><label class="tit">退款原因：</label>
		                ${refundReturn.buyerMessage}
		            </p>
		            <p class="item"><label class="tit">卖家审核：</label>
		            	<#if refundReturn.sellerState=="1">待审核</#if> 
						<#if refundReturn.sellerState=="2">同意</#if>
						<#if refundReturn.sellerState=="3">不同意</#if>
		            </p>
		            <p class="item"><label class="tit">商家备注：</label>
		                ${refundReturn.sellerMessage}
		            </p>
		            <p class="item"><label class="tit">平台确认：</label>
		            	<#if refundReturn.refundState=="1">处理中</#if> 
						<#if refundReturn.refundState=="2">待处理</#if>
						<#if refundReturn.refundState=="3">已完成</#if>
		            </p>
		            <p class="item"><label class="tit">备注信息：</label>
		                <textarea class="textarea" name="adminMessage"></textarea>
		            </p>
		            <p class="item-btn">
		            	<button type="button" class="btna" onclick="javascript:saveUpdate();">保存</button>
		            	<button type="button" class="btna" onclick="javascript:closeWin();">关闭</button>
		            </p>
		        </div>
		    </form>
        </div>
	</div>
	
</body>
<script type="text/javascript">
	
	
	function closeWin(){
		frameElement.api.close();
	}
	/**修改数据*/
	function saveUpdate(){
		/*首先验证表单是否合法*/
		var opFm = $("#acct-form")[0];
		var fmUrl = opFm.action;
		$.ajax({
             type: "post",
             url: fmUrl,
             data: $(opFm).serialize(),
             dataType: "json",
			 async:false,
			 success:function(data) {
				if(data.success == "true"){
					alert("操作成功");	
					frameElement.api.opener.initDataList();
					frameElement.api.close();
				}else{
					alert(data.msg);
				}
			}
         });
	}
</script>
  
