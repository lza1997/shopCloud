<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/layer/layer.js" charset="utf-8"></script>
<link href="${base}/res/css/member.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
</@layout.head>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>发货</h3>
            <ul class="tab-base">
                <li><a href="JavaScript:void(0);" class="current"><span>发货</span></a></li>
            </ul>
        </div>
    </div>
    <div class="main">
      		<style type="text/css">.ncu-table-style tbody td { padding: 6px; text-align: left;}</style>
			<div class="wrap">
  				<div class="step-title"><em>第一步</em>确认收货信息及交易详情</div>
  					<form name="deliver_form" method="POST" id="deliver_form" action="#?act=deliver&op=send" onsubmit="ajaxpost('deliver_form', '', '', 'onerror');return false;">
    					<table class="ncu-table-style order deliver">
            				<tbody>
        						<tr>
          							<td colspan="20" class="sep-row"></td>
        						</tr>
        						<tr>
          							<th colspan="20">
          								<a href="#?act=member_orderprint&order_id=32" target="_blank" class="fr" title="打印订单">
          									<i class="print-order"></i>
          								</a>
          								<span class="fr mr30"></span>
          								<span class="ml5">订单编号：</span>
        								<span class="goods-num">${order.orderSn}</span> 
          								<span class="ml20">下单时间：<em class="goods-time">${order.createTimeStr?string('yyyy-MM-dd HH:mm:ss')}</em></span> 
          							</th>
        						</tr>
        						<#if order.orderGoodsList??>
        							<#list order.orderGoodsList as orderGoods>
		                				<tr>
		          							<td class="bdl w10"></td>
		          							<td class="w70">
		          								<div class="goods-pic-small">
			          								<span class="thumb size60">
			          									<i></i>
			          									<a href="${base}/product/detail?id=${orderGoods.goodsId}" target="_blank">
			          										<img src="${imgServer}${orderGoods.goodsImage}" onload="javascript:DrawImage(this,60,60);" />
			          									</a>
			          								</span>
		          								</div>
		          							</td>
		          							<td class="tl goods-info">
		          								<dl>
		              								<dt><a target="_blank" href="${base}/product/detail?id=${orderGoods.goodsId}">${orderGoods.goodsName}</a></dt>
		              								<dd></dd>
		              								<dd class="tr">
														<script type="text/javascript">
							              					var price = number_format(${orderGoods.goodsPrice},2);
							              					document.write(price);
							              				</script>
							              				&nbsp;x&nbsp;${orderGoods.goodsNum}
							              			</dd>
		            							</dl>
		            						</td>
		            						<#if orderGoods_index == 0>
			                    				<td class="bdl bdr order-info w380" rowspan="1">
			                    					<dl>
			              								<dt>运输选择：</dt>
			              								<dd>
			                           						平邮 (10.00)
			                            				</dd>
			            							</dl>
			            							<dl>
			              								<dt>发货备忘：</dt>
			              								<dd>
			                								<textarea id="deliver_explain" cols="100" rows="2" class="w250 tip-t" title="您可以输入一些发货备忘信息（仅卖家自己可见）">${order.deliverExplain}</textarea>
			              								</dd>
			            							</dl>
			            						</td>
		            						</#if>
		                  				</tr>
	                  				</#list>
                  				</#if>
                  				<#if order.addressList??>
                  					<#list order.addressList as address>
	                				<tr>
	          							<td colspan="20" class="tl bdl bdr" style="padding:8px" id="address">
	          								<strong class="fl">买家收货信息：</strong>
	          								${address.areaInfo}&nbsp;${address.address}&nbsp;&nbsp;${address.trueName}&nbsp;&nbsp;${address.mobPhone}
	          								<#--<a href="javascript:void(0)" nc_type="dialog" dialog_title="修改收货信息" dialog_id="my_address_edit" uri="#?act=deliver&op=buyer_address&order_id=Jm2ZEXU" dialog_width="550" class="fr">修改收货信息</a>-->
	          							</td>
	        						</tr>
	        						</#list>
        						</#if>
              				</tbody>
    					</table>
    					<div class="step-title mt30"><em>第二步</em>确认发货信息</div>
    					<div class="deliver-sell-info" id="daddress">
    						<strong class="fl">我的发货信息：</strong>
            				<#if daddressList??>
            					<#list daddressList as daddress>
            						<#if daddress.addressId == order.daddressId>
            							<div id="daddresDiv">${daddress.areaInfo}&nbsp;${daddress.address}&nbsp;&nbsp;${daddress.sellerName}&nbsp;${daddress.telPhone}&nbsp;${daddress.mobPhone}</div>     
            							<input type="hidden" name="daddressId" id="daddressId" value="${daddress.addressId}">
            						</#if>
            					</#list>
            				</#if>
            			</div>
    					
    					<div class="step-title mt30">
    						<em>第三步</em>选择物流服务
    					</div>
    					<div class="ncm-notes">
    						<i class="lightbulb"></i>
    						您可以通过"发货设置->
    						<a href="#?act=deliver&op=express" target="_parent" >
    							默认物流公司
    						</a>
    						"添加或修改常用货运物流。免运或自提商品可切换下方
    							<span class="red">[无需物流运输服务]</span>
    						选项卡并操作。
    					</div>
    					<div class="tabmenu">
      						<ul class="tab pngFix">
      							<#if order.shippingExpressId!=0>
	        						<li id="eli1" class="active">
	        							<a href="javascript:void(0);" >自行联系物流公司</a>
	        						</li>
        						</#if>
        						<#if order.shippingExpressId==0>
	        						<li id="eli2" class="active">
	        							<a href="javascript:void(0);" >无需物流运输服务</a>
	        						</li>
        						</#if>
      						</ul>
    					</div>
    					<#if order.shippingExpressId!=0>
	    					<table class="ncu-table-style order" id="texpress1">
	      						<tbody>
	        						<tr>
	          							<td class="bdl w150">公司名称</td>
	          							<td class="w250">物流单号</td>
	          							<td class="tc">备忘</td>
	          							<td class="bdr w90 tc">操作</td>
	        						</tr>
	        						<#if expressList??>
	        							<#list expressList as express>
	        								<#if express.id == order.shippingExpressId>
				                        		<tr>
				          							<td class="bdl">${express.seName}</td>
				          							<td class="bdl">
			          									<input name="shippingCode_${express.id}" id="shippingCode_${express.id}" type="text" class="text w200 tip-r" title="正确填写物流单号，确保快递跟踪查询信息正确" value="${order.shippingCode}" />
				          							</td>
				          							<td class="bdl gray" nc_value="2">
				          								<input name="shippingExpressId" type="hidden" class="text w200 tip-r" value="${express.id}" />
				          							</td>
				          							<td class="bdl bdr tc">
				          								<a href="javascript:void(0);" class="ncu-btn2" onclick="confirmShipHSC('${order.orderSn}','${express.id}')">确认</a>
				          							</td>
				        						</tr>
			        						</#if>
	        							</#list>
	        						</#if>
	                      		</tbody>
	    					</table>
	    				</#if>
	    				<#if order.shippingExpressId==0>
	    					<table class="ncu-table-style order" id="texpress2" >
	      						<tbody>
	        						<tr>
	          							<td colspan="2"></td>
	        						</tr>
	        						<tr>
	          							<td class="bdl tr">
	          								<i class="lightbulb"></i>如果订单中的商品无需物流运送(如线下交易或虚拟物品)，您可以直接确认提交
	          							</td>
	          							<td class="bdr tl w250">
	          								<a nc_type='eb' nc_value="e1000" href="javascript:void(0);" class="ncu-btn6" onclick="confirmShip('${order.orderSn}')">确认</a>
	          							</td>
	        						</tr>
	        						<tr>
	          							<td colspan="2"></td>
	        						</tr>
	      						</tbody>
	    					</table>
	    				</#if>
  					</form>
				</div>
    		</div>
</div>
<script type="text/javascript">
function confirmShip(orderSn){
	var deliverExplain = $("#deliver_explain").val(); //发货备注
	var daddressId = $("#daddressId").val(); //发货地址id
	if(daddressId==''){
		layer.msg("请设置发货地址!",{icon:2});
		return false;
	}
	$.ajax({
		type: "post",
 		url: '${base}/transport/shipments_save',
		data: {orderSn:orderSn,deliverExplain:deliverExplain,daddressId:daddressId},
		dataType: "json",
		success:function(data) {
			if(data.success){
				layer.alert("发货成功!",{icon:1},function(){
					location.href='${base}/platformOrder/shipments?orderState=30';
				});
			}else{
				layer.alert("发货失败!",{icon:2});
			}
		}
	});  
}

function confirmShipHSC(orderSn,id){
	var deliverExplain = $("#deliver_explain").val(); //发货 备注
	var daddressId = $("#daddressId").val(); //发货地址id
	var shipcode = "#shippingCode_"+id;
	var shippingCode = $(shipcode).val(); //物流单号
	if(daddressId==''){
		layer.msg("请设置发货地址!",{icon:2});
		return false;
	}
	$.ajax({
		type: "post",
 		url: '${base}/platformOrder/shipments_save',
		data: {orderSn:orderSn,deliverExplain:deliverExplain,daddressId:daddressId,shippingExpressId:id,shippingCode:shippingCode},
		dataType: "json",
		success:function(data) {
			if(data.success){
				layer.alert("发货成功!",{icon:1},function(){
					location.href='${base}/platformOrder/shipments?orderState=30';
				});
			}else{
				layer.alert("发货失败!",{icon:2});
			}
		}
	});  
}

</script>