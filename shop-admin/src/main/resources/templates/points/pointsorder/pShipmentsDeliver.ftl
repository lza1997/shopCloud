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
  					<form name="deliver_form" id="deliver_form" method="POST" id="deliver_form" action="#?act=deliver&op=send" onsubmit="ajaxpost('deliver_form', '', '', 'onerror');return false;">
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
        								<span class="goods-num">${shopPointsOrder.pointOrdersn}</span> 
        								  <#assign dateFormatTag = newTag("dateFormatTag")/>
                  						<#assign pointAddtime = dateFormatTag("{'date':'${shopPointsOrder.pointAddtime }'}")/>
          								<span class="ml20">下单时间：<em class="goods-time">${pointAddtime}</em></span> 
          							</th>
        						</tr>
        						<#if shopPointsOrderGoodsList??>
        							<#list shopPointsOrderGoodsList as orderGoods>
		                				<tr>
		          							<td class="bdl w10"></td>
		          							<td class="w70">
		          								<div class="goods-pic-small">
			          								<span class="thumb size60">
			          									<i></i>
			          									<a href="${frontServer}/points/detail?id=${orderGoods.pointGoodsid}" target="_blank">
			          										<img src="${orderGoods.pointGoodsimage}" onload="javascript:DrawImage(this,60,60);" />
			          									</a>
			          								</span>
		          								</div>
		          							</td>
		          							<td class="tl goods-info">
		          								<dl>
		              								<dt><a target="_blank" href="${frontServer}/points/detail?id=${orderGoods.pointGoodsid}">${orderGoods.pointGoodsname}</a></dt>
		              								<dd></dd>
		              								<dd class="tr">
							              				${orderGoods.pointGoodspoints}积分&nbsp;x&nbsp;${orderGoods.pointGoodsnum}
							              			</dd>
		            							</dl>
		            						</td>
		            						<#if orderGoods_index == 0>
			                    				<td class="bdl bdr order-info w380" rowspan="${shopPointsOrderGoodsList?size }">
			                    					<dl>
			              								<dt>运输选择：</dt>
			              								<dd>
			                           						${shopPointsOrder.shippingName}(￥ ${shopPointsOrder.shippingFee })
			                            				</dd>
			            							</dl>
			            							<dl>
			              								<dt>发货备忘：</dt>
			              								<dd>
			                								<textarea id="deliver_explain" cols="80" rows="2" class="w250 tip-t" title="您可以输入一些发货备忘信息（仅卖家自己可见）">${shopPointsOrder.remarks}</textarea>
			              								</dd>
			            							</dl>
			            						</td>
		            						</#if>
		                  				</tr>
	                  				</#list>
                  				</#if>
                  				<#if shoppointsOrderAddress??>
                  					<#list shoppointsOrderAddress as address>
	                				<tr>
	          							<td colspan="20" class="tl bdl bdr" style="padding:8px" id="address">
	          								<strong class="fl">买家收货信息：</strong>
	          								${address.pointAreainfo}&nbsp;${address.pointAddress}&nbsp;&nbsp;${address.pointTruename}&nbsp;&nbsp;${address.pointMobphone}
	          								<#--<a href="javascript:void(0)" nc_type="dialog" dialog_title="修改收货信息" dialog_id="my_address_edit" uri="#?act=deliver&op=buyer_address&order_id=Jm2ZEXU" dialog_width="550" class="fr">修改收货信息</a>-->
	          							</td>
	        						</tr>
	        						</#list>
        						</#if>
              				</tbody>
    					</table>
    				<div class="step-title mt30">
    						<em>第二步</em>选择物流服务
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
        						<li id="eli1" class="active">
        							<a href="javascript:void(0);" onclick="etab(1)">自行联系物流公司</a>
        						</li>
        						<li id="eli2" class="normal">
        							<a href="javascript:void(0);" onclick="etab(2)">无需物流运输服务</a>
        						</li>
      						</ul>
    					</div>
    					<table class="ncu-table-style order" id="texpress1">
      						<tbody>
        						<tr>
          							<td class="bdl w150">公司名称</td>
          							<td class="w250">物流单号</td>
          							<td class="tc">备忘</td>
          							<td class="bdr w90 tc">操作</td>
        						</tr>
        						<#if expressList??>
        						
        							<#if shopPointsOrder.pointShippingEcode??&&shopPointsOrder.pointShippingEcode!=''>
        								<#list expressList as express>
        								<#if shopPointsOrder.pointShippingEcode == express.ECode>
        									<tr>
		          							<td class="bdl">${express.seName}</td>
		          							<td class="bdl">
		          								<input name="shippingCode_${express.id}" id="shippingCode_${express.id}" type="text" class="text w200 tip-r" title="正确填写物流单号，确保快递跟踪查询信息正确" value="${shopPointsOrder.pointShippingcode}" />
		          							</td>
		          							<td class="bdl gray" nc_value="2">
		          								<input name="shippingExpressId" type="hidden" class="text w200 tip-r" value="${express.id}" />
		          							</td>
		          							<td class="bdl bdr tc">
		          								<a href="javascript:void(0);" class="ncu-btn2" onclick="confirmShipHSC('${shopPointsOrder.id}','${express.id}')">确认</a>
		          							</td>
		        						</tr>
		        						</#if>
		        						</#list>
        							<#else>
	        							<#list expressList as express>
			                        		<tr>
			          							<td class="bdl">${express.seName}</td>
			          							<td class="bdl">
			          									<input name="shippingCode_${express.id}" id="shippingCode_${express.id}" type="text" class="text w200 tip-r" title="正确填写物流单号，确保快递跟踪查询信息正确" />
			          							</td>
			          							<td class="bdl gray" nc_value="2">
			          								<input name="shippingExpressId" type="hidden" class="text w200 tip-r" value="${express.id}" />
			          							</td>
			          							<td class="bdl bdr tc">
			          								<a href="javascript:void(0);" class="ncu-btn2" onclick="confirmShipHSC('${shopPointsOrder.id}','${express.id}')">确认</a>
			          							</td>
			        						</tr>
	        							</#list>
        							</#if>
        						</#if>
                      		</tbody>
    					</table>
    					
    					<table class="ncu-table-style order" id="texpress2" <#if expressList??>style="display:none"</#if>>
    						<tbody>
    							<tr>
          							<td class="bdl bdr tc">
          								免运或自提商品无需物流运输服务，若确认，将直接发货
          								<a href="javascript:void(0);" class="ncu-btn2" onclick="confirmShip('${shopPointsOrder.id}')">确认</a>
          							</td>
        						</tr>
    						</tbody>
    					</table>
  					</form>
				</div>
    		</div>
  		</div>
<script type="text/javascript">
function etab(t){
	if (t==1){
		$('#eli1').removeClass('normal').addClass('active');
		$('#eli2').removeClass('active').addClass('normal');
		$('#texpress1').css('display','');
		$('#texpress2').css('display','none');
	}else{
		$('#eli1').removeClass('active').addClass('normal');
		$('#eli2').removeClass('normal').addClass('active');
		$('#texpress1').css('display','none');
		$('#texpress2').css('display','');
	}
}

function confirmShip(orderId){
	var deliverExplain = $("#deliver_explain").val(); //发货备注
	$.ajax({
		type: "post",
		url: '${base}/shopPointsOrder/shipments_save',
		data: {'orderId':orderId,'remarks':deliverExplain},
		dataType: "json",
		success:function(data) {
			if(data.success){
				layer.alert("发货成功!",{icon:1},function(){
					location.href='${base}/shopPointsOrder/shipments?orderState=30';
				});
			}else{
				layer.alert("发货失败!",{icon:2});
			}
		}
	});  
}

function confirmShipHSC(orderId,id){
	var shipcode = "#shippingCode_"+id;
	var shippingCode = $(shipcode).val(); //物流单号
	if(shippingCode == "" && id != ""){
		layer.alert("发货失败!请填写物流单号！",{icon:2});
		return;
	}
	var deliverExplain = $("#deliver_explain").val(); //发货备注
	$.ajax({
		type: "post",
 		url: '${base}/shopPointsOrder/shipments_save',
		data: {'orderId':orderId,'remarks':deliverExplain,'shippingExpressId':id,'shippingCode':shippingCode},
		dataType: "json",
		success:function(data) {
			if(data.success){
				layer.alert("发货成功!",{icon:1},function(){
					location.href='${base}/shopPointsOrder/shipments?orderState=30';
				});
			}else{
				layer.alert("发货失败!",{icon:2});
			}
		}
	});  
}
function updateDaddress(){
	layer.open({
        type:2,
        move: false,
        shade: false,
        title: '选择地址',
        content:['${base}/platformOrder/shipments_daddress', 'no'],
        area: ['550px', '450px']
    });
} 

</script>
