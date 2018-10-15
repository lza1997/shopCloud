<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;">
    <title>换货详情</title>
    <meta name="apple-mobile-webC-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
	<link combofile="service/service.shtml" rel="stylesheet" href="${base}/res/html5/css/base.s.min.css">
	<script src="${base}/res/js/common.js" charset="utf-8"></script>
	<script src="${base}/res/html5/js/jquery-1.10.2.min.js"></script>
</head>
<body>
	<div class="wx_wrap">
		<div class="refund_wrap">
			  	<div class="opt">
		        	<div class="opt_info">
		        		<p class="txt">
			        	
			        		<em class="state">
				        		<#if barterDetail.barterState==20>
			                    	待审核
				                <#elseif barterDetail.barterState==30>
				                    同意
				                <#elseif barterDetail.barterState==40>
				                	不同意
				                </#if>
							</em>
		        		</p>
						<p class="txt"><strong>换货编号：</strong><em class="num">${barterDetail.barterSn}</em></p>
					</div>
		    	</div>
		    	<div class="mod_info mod_info_auto">
			        <div class="mod_info_hd">
			            <div class="mod_line">
			                <div class="tit">商品名称：</div>
			                <div class="cnt">
			                     ${barterDetail.goodsName}
			                </div>
			            </div>
			            <div class="mod_line">
			                <div class="tit">换货数量：</div>
			                <div class="cnt">
			                    ${barterDetail.goodsNum}
			                </div>
			            </div>
			            <div class="mod_line">
			                <div class="tit">申请时间：</div>
			                <div class="cnt">
			                   ${barterDetail.createTimeStr}
			                </div>
			            </div>
			        </div>
			        <div class="mod_info_bd">
			            <div class="mod_line">换货原因：</div>
			            <div class="mod_line co_gray"> ${barterDetail.buyerMessage}</div>
			        </div>
			    </div>
				<#if barterDetail.sellerMessage??>
				    <div class="refund_num" id="refundFinance">
				        <div class="refund_hd">
				            <em class="co_red">*</em>卖家备注： 
				            <div class="num_list">
				            	
				            		<div class="item"><span>${barterDetail.sellerMessage}</span></div>
				            	
				            </div>
				        </div>
				    </div>
			    </#if>
			    <#if barterDetail.adminMessage??>
				    <div class="refund_num" id="refundFinance">
				        <div class="refund_hd">
				            <em class="co_red">*</em>管理员备注： 
				            <div class="num_list">
				            	
				            		<div class="item"><span>${barterDetail.adminMessage}</span></div>
				            	
				            </div>
				        </div>
				    </div>
			    </#if>
			    <#if barterDetail.orderDaddress??>
				    <div class="mod_info mod_info_auto">
					    <div class="mod_info_hd">
				            <div class="mod_line">
				                <div class="tit">发货人：</div>
				                <div class="cnt">
				                     ${barterDetail.orderDaddress.sellerName}
				                </div>
				            </div>
				            <div class="mod_line">
				                <div class="tit">电话：</div>
				                <div class="cnt">
				                   ${barterDetail.orderDaddress.mobPhone}
				                </div>
				            </div>
				            <div class="mod_line">
				                <div class="tit">邮编：</div>
				                <div class="cnt">
				                   ${barterDetail.orderDaddress.zipCode}
				                </div>
				            </div>
				            <div class="mod_line">
				                <div class="tit">发货地址：</div>
				                <div class="cnt">
				                   ${barterDetail.orderDaddress.areaInfo}&nbsp;${barterDetail.orderDaddress.address}
				                </div>
				            </div>
				            <#if barterDetail.expressName??>
					            <div class="mod_line">
					                <div class="tit">配送公司：</div>
					                <div class="cnt">
					                   ${barterDetail.expressName}
					                </div>
					            </div>
				            </#if>
				            <#if barterDetail.invoiceNo??>
					            <div class="mod_line">
					                <div class="tit">物流单号：</div>
					                <div class="cnt">
					                   ${barterDetail.invoiceNo}
					                </div>
					            </div>
				            </#if>
					    </div>
				    </div>
			    </#if>
			    <#if barterDetail.buyerInvoiceNo ??&& barterDetail.buyerInvoiceNo!=null>
			    	<div class="mod_info mod_info_auto">
					    <div class="mod_info_hd">
				            <div class="mod_line">
				                <div class="tit">发货人：</div>
				                <div class="cnt">
				                     ${barterDetail.storeName}
				                </div>
				            </div>
				            <div class="mod_line">
				                <div class="tit">配送公司：</div>
				                <div class="cnt">
				                   ${barterDetail.sellerExpressName}
				                </div>
				            </div>
				            <div class="mod_line">
				                <div class="tit">物流单号：</div>
				                <div class="cnt">
				                   ${barterDetail.sellerInvoiceNo}
				                </div>
				            </div>
					    </div>
				    </div>
			    </#if>
			    <div class="wuliu">
				    <div class="wuliu_inner">
				        <div class="wuliu_hd">
				            <h3>进度跟踪</h3>
				        </div>
				        <div class="wuliu_bd">
				            <ul class="wuliu_list">
					            <#if barterDetail.shopBarterLogList?? && barterDetail.shopBarterLogList?size gt 0>
									<#list barterDetail.shopBarterLogList as shopbarterlog>
						                <li class="wuliu_now">
		                                    <p class="wuliu_time">${shopbarterlog.createTimeStr}</p>
		                                    <p class="wuliu_title">${shopbarterlog.stateInfo}</p>
						                    <p class="wuliu_time">经办：${shopbarterlog.operator}</p>
						                </li>
						            </#list>
								</#if>  
				            </ul>
				        </div>
				    </div>
				</div>
		</div>
	</div>
</body>
</html>