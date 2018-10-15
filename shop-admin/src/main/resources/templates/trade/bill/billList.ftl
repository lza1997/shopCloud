<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/My97DatePicker/WdatePicker.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/layer/layer.js" charset="utf-8"></script>
</@layout.head>
<script type="text/javascript">
    $(function(){
        $('#ncsubmit').click(function(){
            $('#formSearch').submit();
        });
    });
</script>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>结算管理</h3>
            <ul class="tab-base">
            	<li><a href="${base}/bill/list"><span>结算管理</span></a></li>
                <li><a href="JavaScript:void(0);" class="current"><span>商家账单列表</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form method="post" action="${base}/bill/orderBillList" name="formSearch" id="formSearch">
        <input type="hidden" name="pageNo" value="${pager.pageNo}">
        <table class="tb-type1 noborder search">
            <tbody>
            <tr>
            	<th><label for="query_start_time">开始时间</th>
                <td><input class="txt Wdate" type="text"  id="query_start_time" name="obStartTime" value="${obStartTime}" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'query_end_time\')}'});"/>
                	<label for="query_start_time">~</label>
                </td>
                <th><label for="query_start_time">结束时间</th>
                <td><input class="txt Wdate" type="text" id="query_end_time" name="obEndTime" value="${obEndTime}" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'query_start_time\')}'});"/></td>
           		<th><label>按年份搜索</label></th>
                <td>
                	<select name="osYear">
       					<option value="">请选择</option>
      					<#list 2010..2020 as t>
							<#if t==orderBill.osYear>
								<option value="${t}" selected="selected">${t}</option>
								continue;
							</#if>
							<option value="${t}">${t}</option>
						</#list>
     				</select>
                </td>
                <th><label>按月份搜索</label></th>
                <td>
                	<select name="osMonth">
       					<option value="">请选择</option>
       					<#list 1..12 as t>
							<#if t==orderBill.osMonth>
								<option value="${t}" selected="selected">${t}</option>
								continue;
							</#if>
							<option value="${t}">${t}</option>
						</#list>
       				</select>
                </td>
            </tr>
            <tr>
            	<input type="hidden" name="storeId" value="${orderBill.obStoreId}"/>
            	<th>账单编号</th>
                <td><input class="txt" type="text" name="obNo" value="${orderBill.obNo}" /></td>
                <th>店铺</th>
                <td><input class="txt" type="text" name="storeName" value="${orderBill.obStoreName}" /></td>
                <th><label>结算状态</label></th>
                <td colspan="2">
	                <select name="obState" class="querySelect">
	         	   		<option value="99" <#if orderBill.obState==99>selected</#if>>所有状态</option>
	                    <option value="10" <#if orderBill.obState==10>selected</#if>>已出账</option>
	                    <option value="20" <#if orderBill.obState==20>selected</#if>>商家已确认</option>
	                    <option value="30" <#if orderBill.obState==30>selected</#if>>平台已审核</option>
	                    <option value="40" <#if orderBill.obState==40>selected</#if>>结算完成</option>
	  				</select>
                </td>
                <td>
                	<a href="javascript:void(0);" id="ncsubmit" class="btn-search " title="查询">&nbsp;</a>
                </td>
            </tr>
            </tbody>
        </table>
    </form>
    <table class="table tb-type2" id="prompt">
        <tbody>
        <tr class="space odd">
            <th colspan="12"><div class="title"><h5>操作提示</h5><span class="arrow"></span></div></th>
        </tr>
        <tr>
            <td>
                <ul>
                    <li>此处列出了详细的店铺账单信息，点击查看可以查看详细的订单信息、退单信息和店铺费用信息</li>
                    <li>账单处理流程为：系统出账 > 商家确认 > 平台审核 > 财务支付(完成结算) 4个环节，其中平台审核和财务支付需要平台介入，请予以关注</li>
                </ul>
            </td>
        </tr>
        </tbody>
    </table>
    <table class="table tb-type2 nobdb">
        <thead>
        <tr class="thead">
            <th class="align-center">账单编号</th>
            <th class="align-center">起止时间</th>
            <th class="align-center">订单金额</th>
            <th class="align-center">佣金金额</th>
            <th class="align-center">退款金额</th>
            <th class="align-center">退还佣金</th>
            <th class="align-center">本期应结</th>
            <th class="align-center">出账日期</th>
          	<th class="align-center">账单状态</th>
          	<th class="align-center">店铺</th>
            <th class="align-center">操作</th>
        </tr>
        </thead>
        <tbody>
        <#list pager.result as orderBill>
        <tr class="hover">
            <td class="align-center">${orderBill.obNo}</td>
            <td class="align-center">${orderBill.obStartTimeStr?string('yyyy-MM-dd')}~${orderBill.obEndTimeStr?string('yyyy-MM-dd')}</td>
            <td class="align-center">
            	<script type="text/javascript">
   					var obOrderTotals = number_format(${orderBill.obOrderTotals},2);
   					document.write(obOrderTotals);
   				</script>
            </td>
            <td class="align-center">
            	<script type="text/javascript">
   					var obCommisTotals = number_format(${orderBill.obCommisTotals},2);
   					document.write(obCommisTotals);
   				</script>
            </td>
            <td class="align-center">
            	<script type="text/javascript">
   					var obOrderReturnTotals = number_format(${orderBill.obOrderReturnTotals},2);
   					document.write(obOrderReturnTotals);
   				</script>
   			</td>
            <td class="align-center">
            	<script type="text/javascript">
   					var obCommisReturnTotals = number_format(${orderBill.obCommisReturnTotals},2);
   					document.write(obCommisReturnTotals);
   				</script>
            </td>
            <td class="align-center">
            	<script type="text/javascript">
   					var obResultTotals = number_format(${orderBill.obResultTotals},2);
   					document.write(obResultTotals);
   				</script>
            </td>
            <td class="align-center">
            	${orderBill.createTimeStr?string('yyyy-MM-dd')}
            </td>
            <td class="align-center">
				<#if orderBill.obState == 10>
					已出账
				<#elseif orderBill.obState == 20>
					卖家已确认
				<#elseif orderBill.obState == 30>
					平台已审核
				<#elseif orderBill.obState == 40>
					结算完成
				</#if>
			</td>
			<td class="align-center">
				${orderBill.obStoreName}:${orderBill.obStoreId}
			</td>
            <td class="align-center">
           		<a href="${base}/bill/orderBillDetail?obId=${orderBill.obId}">查看</a>
            	<#if orderBill.obState == 20>
            		| <a href="javascript:void(0)" onclick="audit('${orderBill.obId}')" >审核</a>
            	</#if>
            </td>
        </tr>
        </#list>
        </tbody>
        <tfoot>
        <tr class="tfoot">
            <td colspan="15" id="dataFuncs">
                <@layout.pager pager/>
                <#if pager.result?size!=0>
               		<a href="javascript:void(0);" onclick="exportExcel();" class="btn">导出excel</a>
            	</#if>
            	<a href="javascript:void(0);" onclick="handTest();" class="btn">手动生成测试数据</a>
            </td>
        </tr>
        </tfoot>
    </table>
</div>
<script type="text/javascript">
	function audit(obId){
		layer.open({
		    type: 2,
		    area: ['500px', '460px'],
		    skin: 'layui-layer-rim',
		    title: '结算审核',
		    content :  ['${base}/bill/auditBillIndex?obId='+ obId, 'no'],
		    success: function(layero, index){
		    	layer.getChildFrame('#confirm_button',index).on('click', function(){
		    		layer.getChildFrame('#confirm_button').attr("disabled","disabled");
		    		var obId = layer.getChildFrame('input[name="obId"]').val();
		    		var obPayContent = layer.getChildFrame('[name="obPayContent"]').val();
		    		var fmUrl = '${base}/bill/auditBill';
		    		$.ajax({
			             type: "post",
			             url: fmUrl,
			             data: {obId:obId,obPayContent:obPayContent},
			             dataType: "json",
						 success:function(data) {
						 	if(data.result==1){
						 		layer.msg("审核成功!",{icon:1,time:1000},function(){
						 			location.reload();
						 		});
						 	}else{
						 		layer.msg(data.message,{icon:2,time:1000},function(){
						 			layer.getChildFrame('#confirm_button').attr("disabled",false);
						 		});
						 	}
						 }
					});
		    	});
		    }
		});
	}
	
	function exportExcel(){
		var formVal = $("#formSearch").serialize();
		location.href="${base}/bill/exportBillExcel?"+formVal;
	}
	
	function handTest(){
		layer.confirm("是否生成测试数据?生成后会造成数据混乱,导致账单无法使用,请谨慎操作!",{icon:7},function(){
			$.ajax({
	             type: "post",
	             url: "${base}/bill/manualOperationTest",
	             data: {},
	             dataType: "json",
				 success:function(data) {
				 	if(data.result==1){
				 		layer.msg("生成成功!",{icon:1,time:1000},function(){
				 			location.reload();
				 		});
				 	}else{
				 		layer.msg(data.message,{icon:2,time:1000},function(){
				 			layer.closeAll();
				 		});
				 	}
				 }
			});
		});
	}
</script>
</@layout.body>