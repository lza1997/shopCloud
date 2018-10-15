<link href="${base}/res/css/member.css" rel="stylesheet" type="text/css">
<link href="${base}/res/css/base.css" rel="stylesheet" type="text/css">
<link href="${base}/res/css/member_user.css" rel="stylesheet" type="text/css">
<script src="${base}/res/js/jquery.js" charset="utf-8"></script>
<script src="${base}/res/js/common.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/layer/layer.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/My97DatePicker/WdatePicker.js" charset="utf-8"></script>
<div class="eject_con" style="width: 500px">
  <div id="warning"></div>
  	<input type="hidden" name="obId" value="${orderBill.obId}"/> 
  	<dl>
      	<dt>应结金额：</dt>
      	<dd>
			<b style="color: red;">¥
				<script type="text/javascript">
	        		var obResultTotals = number_format(${orderBill.obResultTotals},2);
	        		document.write(obResultTotals);
	        	</script>
			</b>
		</dd>
    </dl>
    <dl>
      	<dt>订单金额：</dt>
      	<dd>
			<script type="text/javascript">
				var obOrderTotals = number_format(${orderBill.obOrderTotals},2);
				document.write(obOrderTotals);
			</script>
		</dd>
    </dl>
    <dl>
      	<dt>运费：</dt>
      	<dd>
			<script type="text/javascript">
				var obShippingTotals = number_format(${orderBill.obShippingTotals},2);
				document.write(obShippingTotals);
			</script>
		</dd>
    </dl>
    <dl>
    	<dt>佣金金额：</dt>
      	<dd>
			<script type="text/javascript">
				var obCommisTotals = number_format(${orderBill.obCommisTotals},2);
				document.write(obCommisTotals);
			</script>
		</dd>
    </dl>
    <dl>
    	<dt>促销活动费用：</dt>
      	<dd>
			<script type="text/javascript">
				var obStoreCostTotals = number_format(${orderBill.obStoreCostTotals},2);
				document.write(obStoreCostTotals);
			</script>
		</dd>
    </dl>
    <#if orderBill.obOrderReturnTotals??>
	    <dl>
	    	<dt>退单金额：</dt>
	      	<dd>
				<script type="text/javascript">
					var obOrderReturnTotals = number_format(${orderBill.obOrderReturnTotals},2);
					document.write(obOrderReturnTotals);
				</script>
			</dd>
	    </dl>
    </#if>
    <#if orderBill.obCommisReturnTotals??>
    	<dl>
	    	<dt>退还佣金：</dt>
	      	<dd>
				<script type="text/javascript">
					var obCommisReturnTotals = number_format(${orderBill.obCommisReturnTotals},2);
					document.write(obCommisReturnTotals);
				</script>
			</dd>
	    </dl>
    </#if>
    <dl>
      <dt>付款备注：</dt>
      <dd>
		<textarea name="obPayContent" rows="3" class="textarea w200"></textarea>
      </dd>
    </dl>
    <dl>
      <dt>&nbsp;</dt>
      <dd>
        <p class="hint">
        	<#if orderBill.obResultTotals &lt;= 0>
        		应结金额=退单金额-退还佣金
        	<#else>
        		应结金额=订单总金额-店铺促销活动费用-佣金金额
        	</#if>
        	<br/>结算完成请点击确认按钮修改结算状态
        </p>
      </dd>
    </dl>
    <dl class="bottom">
      <dt>&nbsp;</dt>
      <dd>
        <input type="submit" class="submit" id="confirm_button" value="确定"/>
      </dd>
    </dl>
</div>