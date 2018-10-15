<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;">
    <title>退货详情</title>
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
			        		<strong>审核状态：</strong>
			        		<em class="state">
								<#if refundReturn.sellerState==1>
			                    	待审核
				                <#elseif refundReturn.sellerState==2>
				                    同意
				                <#elseif refundReturn.sellerState==3>
				                	不同意
				                </#if>
							</em>
		        		</p>
		        		<p class="txt">
			        		<strong>平台确认：</strong>
			        		<em class="state">
				        		<#if refundReturn.refundState??>
									<#if refundReturn.refundState==1>
										未申请
									<#elseif refundReturn.refundState==2>
										待处理
									<#elseif refundReturn.refundState==3>
										已完成
									</#if>
								<#else>
									无
								</#if>
			        		</em>
		        		</p>
						<p class="txt"><strong>退货编号：</strong><em class="num">${refundReturn.refundSn}</em></p>
					</div>
		    	</div>
		    	<#if orderGoodsId==0>
		    		<div class="mod_info mod_info_auto">
		    		<#list refundReturn.orderGoodsList as orderGoods>
				        <div class="mod_info_hd">
				            <div class="mod_line">
				                <div class="tit">商品名称：</div>
				                <div class="cnt">
				                     ${orderGoods.goodsName}
				                </div>
				            </div>
				            <div class="mod_line">
				                <div class="tit">退货数量：</div>
				                <div class="cnt">
				                    ${orderGoods.goodsNum}
				                </div>
				            </div>
				            <div class="mod_line">
				                <div class="tit">申请时间：</div>
				                <div class="cnt">
				                   ${refundReturn.createTimeStr}
				                </div>
				            </div>
				        </div>
				    </#list>
				        <div class="mod_info_bd">
				            <div class="mod_line">详细描述原因：</div>
				            <div class="mod_line co_gray"> ${refundReturn.buyerMessage}</div>
				        </div>
				    </div>
				    <div class="refund_num" id="refundFinance">
				        <div class="refund_hd">
				            <em class="co_red">*</em>退款金额： 
				            <div class="num_list">
				            	
				            		<div class="item">
				            		<span>
					            		<script type="text/javascript">
			              					var price = number_format(${refundReturn.refundAmount},2);
			              					document.write(price);
			              				</script>
		              				</span>
		              				</div>
				            	
				            </div>
				        </div>
				    </div>
					<#if refundReturn.sellerMessage??>
					    <div class="refund_num" id="refundFinance">
					        <div class="refund_hd">
					            <em class="co_red">*</em>卖家备注： 
					            <div class="num_list">
					            	
					            		<div class="item"><span>${refundReturn.sellerMessage}</span></div>
					            	
					            </div>
					        </div>
					    </div>
				    </#if>
				    <#if refundReturn.adminMessage??>
					    <div class="refund_num" id="refundFinance">
					        <div class="refund_hd">
					            <em class="co_red">*</em>管理员备注： 
					            <div class="num_list">
					            	
					            		<div class="item"><span>${refundReturn.adminMessage}</span></div>
					            	
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
						            <#if refundReturn.returnLogList?size gt 0>
										<#list refundReturn.returnLogList as returnLog>
							                <li class="wuliu_now">
			                                    <p class="wuliu_time">${returnLog.createTimeStr}</p>
			                                    <p class="wuliu_title">${returnLog.stateInfo}</p>
							                    <p class="wuliu_time">经办：${returnLog.operator}</p>
							                </li>
							            </#list>
									</#if>  
					            </ul>
					        </div>
					    </div>
					</div>
		    	<#else>
			    	<div class="mod_info mod_info_auto">
				        <div class="mod_info_hd">
				            <div class="mod_line">
				                <div class="tit">商品名称：</div>
				                <div class="cnt">
				                     ${refundReturn.goodsName}
				                </div>
				            </div>
				            <div class="mod_line">
				                <div class="tit">退货数量：</div>
				                <div class="cnt">
				                    ${refundReturn.goodsNum}
				                </div>
				            </div>
				            <div class="mod_line">
				                <div class="tit">申请时间：</div>
				                <div class="cnt">
				                   ${refundReturn.createTimeStr}
				                </div>
				            </div>
				        </div>
				        <div class="mod_info_bd">
				            <div class="mod_line">详细描述原因：</div>
				            <div class="mod_line co_gray"> ${refundReturn.buyerMessage}</div>
				        </div>
				    </div>
				    <div class="refund_num" id="refundFinance">
				        <div class="refund_hd">
				            <em class="co_red">*</em>退款金额： 
				            <div class="num_list">
				            	
				            		<div class="item">
				            		<span>
					            		<script type="text/javascript">
			              					var price = number_format(${refundReturn.refundAmount},2);
			              					document.write(price);
			              				</script>
		              				</span>
		              				</div>
				            	
				            </div>
				        </div>
				    </div>
					<#if refundReturn.sellerMessage??>
					    <div class="refund_num" id="refundFinance">
					        <div class="refund_hd">
					            <em class="co_red">*</em>卖家备注： 
					            <div class="num_list">
					            	
					            		<div class="item"><span>${refundReturn.sellerMessage}</span></div>
					            	
					            </div>
					        </div>
					    </div>
				    </#if>
				    <#if refundReturn.adminMessage??>
					    <div class="refund_num" id="refundFinance">
					        <div class="refund_hd">
					            <em class="co_red">*</em>管理员备注： 
					            <div class="num_list">
					            	
					            		<div class="item"><span>${refundReturn.adminMessage}</span></div>
					            	
					            </div>
					        </div>
					    </div>
				    </#if>
				    <div class="mod_info mod_info_auto">
					    <div class="mod_info_hd">
				            <div class="mod_line">
				                <div class="tit">发货人：</div>
				                <div class="cnt">
				                     ${refundReturn.orderDaddress.sellerName}
				                </div>
				            </div>
				            <div class="mod_line">
				                <div class="tit">电话：</div>
				                <div class="cnt">
				                   ${refundReturn.orderDaddress.mobPhone}
				                </div>
				            </div>
				            <div class="mod_line">
				                <div class="tit">邮编：</div>
				                <div class="cnt">
				                   ${refundReturn.orderDaddress.zipCode}
				                </div>
				            </div>
				            <div class="mod_line">
				                <div class="tit">发货地址：</div>
				                <div class="cnt">
				                   ${refundReturn.orderDaddress.areaInfo}&nbsp;${refundReturn.orderDaddress.address}
				                </div>
				            </div>
				            <div class="mod_line">
				                <div class="tit">配送公司：</div>
				                <div class="cnt">
				                   ${refundReturn.expressName}
				                </div>
				            </div>
				            <div class="mod_line">
				                <div class="tit">物流单号：</div>
				                <div class="cnt">
				                   ${refundReturn.invoiceNo}
				                </div>
				            </div>
					    </div>
				    </div>
				    <div class="wuliu">
					    <div class="wuliu_inner">
					        <div class="wuliu_hd">
					            <h3>进度跟踪</h3>
					        </div>
					        <div class="wuliu_bd">
					            <ul class="wuliu_list">
						            <#if refundReturn.returnLogList?size gt 0>
										<#list refundReturn.returnLogList as returnLog>
							                <li class="wuliu_now">
			                                    <p class="wuliu_time">${returnLog.createTimeStr}</p>
			                                    <p class="wuliu_title">${returnLog.stateInfo}</p>
							                    <p class="wuliu_time">经办：${returnLog.operator}</p>
							                </li>
							            </#list>
									</#if>  
					            </ul>
					        </div>
					    </div>
					</div>
		    	</#if>
		    
		</div>
	</div>
</body>
</html>