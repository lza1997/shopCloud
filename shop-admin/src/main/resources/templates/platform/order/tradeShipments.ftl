<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/layer/layer.js" charset="utf-8"></script>
<link href="${base}/res/css/member.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript">
    $(function(){
        $('#ncsubmit').click(function(){
            $('#formSearch').submit();
        });
    });
    
</script>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>发货</h3>
            <ul class="tab-base">
                <li>
					<a  href="${base}/platformOrder/shipments?orderState=20" <#if orderState==20 >class="current"</#if>>等待发货的订单</a>
				</li>
				<li>
					<a  href="${base}/platformOrder/shipments?orderState=30" <#if orderState==30 >class="current"</#if>>发货中的订单</a>
				</li>
				<li>
					<a  href="${base}/platformOrder/shipments?orderState=40" <#if orderState==40 >class="current"</#if>>已收到货的订单</a>
				</li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form method="post" action="${base}/platformOrder/shipments" name="formSearch" id="formSearch">
        <input type="hidden" name="pageNo" value="${pager.pageNo}">
        <table class="tb-type1 noborder search">
            <tbody>
            <tr>
                <th><label>订单号</label></th>
                <td><input class="txt2" type="text" name="orderSn" value="${order.orderSn}" /></td>
                <td><a href="javascript:void(0);" id="ncsubmit" class="btn-search " title="查询">&nbsp;</a>
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
                    <li>点击查看操作将显示订单（包括订单物品）的详细信息</li>
                    <li>点击取消操作可以取消订单（在线支付但未付款的订单和货到付款但未发货的订单）</li>
                    <li>如果平台已确认收到买家的付款，但系统支付状态并未变更，可以点击收到货款操作，并填写相关信息后更改订单支付状态</li>
                </ul></td>
        </tr>
        </tbody>
    </table>
    <table class="table tb-type2 nobdb">
	    <#if orderLists??>
	    	<#if orderLists?size != 0>
	    		<#list orderLists as order>
		    		<tbody>
      					<tr class="thead">
        					<th colspan="20">
        						<span class="fr mr30"></span>
       							<span class="ml5">订单编号：
       								<span class="goods-num">${order.orderSn}</span> 
       							</span>
        					</th>
      					</tr>
      					<#if order.orderGoodsList?size gt 0>
			      			<#assign rowsize = order.orderGoodsList?size>
			      				<#list order.orderGoodsList as orderGoods>
		            				<tr>
		        						<td class="bdl w10"></td>
		        						<td class="w70">
		        							<div class="goods-pic-small">
		        								<span class="thumb size60"><i></i>
		        									<a href="${frontServer}/product/detail?id=${orderGoods.goodsId}" target="_blank">
		        										<img src="${imgServer}${orderGoods.goodsImage}" onload="javascript:DrawImage(this,60,60);" width="60" height="15">
		        									</a>
		        								</span>
		        							</div>
		        						</td>
		        						<td class="tl goods-info">
		        							<dl>
		            							<dt><a target="_blank" href="${frontServer}/product/detail?id=${orderGoods.goodsId}">${orderGoods.goodsName}</a></dt>
		            							<dd>${orderGoods.specInfo}</dd>
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
			                				<td class="bdl bdr order-info w400" rowspan="2">
			                					<dl>
			            							<dt>买家：</dt>
			            							<dd class="vm">
			            								${order.buyerName} 
			                                        		</dd>
			          									</dl>
			          									<#if order.address??>
				          									<dl>
				            									<dt>收货信息：</dt>
				            									<dd class="ts">
				            										<span>${order.address.areaInfo}&nbsp;&nbsp;${address.address}，</span>
				            										<span class="ml5">${order.address.zipCode}，</span>
				            										<span class="ml5">${order.address.trueName}，</span>
				            										<span class="ml10">${order.address.telPhone}</span>
				            										<span class="ml10">${order.address.mobPhone}</span>
				            									</dd>
				          									</dl>
				          								</#if>
			          									<dl>
			            									<dt>运输选择：</dt>
			            									<dd>（免运费）</dd>
			          									</dl>
			          									<div align="right">
				          									<#if orderState==20>
					          									<dl>
					                                    			<dt>&nbsp;</dt>
					            									<dd><a href="${base}/platformOrder/shipments_deliver?orderId=${order.orderId}" class="ncu-btn6 mr10 fr">发货</a></dd>
					                      						</dl>
					                      					<#elseif orderState==30>
					                      						<dl>
					                                    			<dt>&nbsp;</dt>
					            									<dd><a href="${base}/platformOrder/shipments_deliver_update?orderId=${order.orderId}" class="ncu-btn2 mr10 fr">编辑发货信息</a></dd>
					                      						</dl>
				                      						</#if>
			                      						</div>
			                      					</td>
		                      					</#if>
		              						</tr>
              							</#list>
              						</#if>
			 					</tbody>
			 				</#list>
		 				</#if> 	
	 				</#if>
	 	<tfoot>
	        <tr class="tfoot">
	            <td colspan="16" id="dataFuncs">
	                <@layout.pager pager/>
	            </td>
	        </tr>
        </tfoot>
    </table>
</div>
<script type="text/javascript">
</script>
</@layout.body>