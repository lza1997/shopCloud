<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;">
    <title>发货详情</title>
    <meta name="apple-mobile-webC-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
	<link combofile="service/service.shtml" rel="stylesheet" href="${base}/res/html5/css/base.s.min.css">
	<script src="${base}/res/html5/js/jquery-1.10.2.min.js"></script>
	<!-- 手机端弹出框开始 -->
	<script src="${base}/res/html5/js/mobile/layer.m.js" charset="utf-8"></script>
	<!-- 手机端弹出框结束 -->
</head>
<script type="text/javascript">
	$(function(){
		//买家发货
		$("#confirm_button").click(function(){
			var reg = /^[-\+]?\d+(\.\d+)?$/; //检验是否为数字的正则表达式
			var barterId = $("input[name='barterId']").val();
			var expressName = $("input[name='shippingExpressName']").val();
			var invoiceNo = $("input[name='shippingCode']").val();
			if(expressName.trim()==""){
				$("#ExpressNameError").html("请您填写配送公司!");
				return false;
			}
			if(invoiceNo.trim()==""){
				$("#error").html("请您填写物流单号!");
				return false;
			}
			var fmUrl = '${base}/m/authc/buyer/barterDelivery';
			$.ajax({
	             type: "post",
	             url: fmUrl,
	             data: {barterId:barterId,expressName:expressName,invoiceNo:invoiceNo},
	             dataType: "json",
				 success:function(data) {
					 if(data.success){
							location.href="${base}/m/authc/buyer/barterList";
					}else{
						layer.open({content:'发货失败!', time: 1});
						layer.closeAll();
					}
				}
	         });
		});
	});
	//金额格式转换
	function number_format(num, ext){
	    if(ext < 0){
	        return num;
	    }
	    num = Number(num);
	    if(isNaN(num)){
	        num = 0;
	    }
	    var _str = num.toString();
	    var _arr = _str.split('.');
	    var _int = _arr[0];
	    var _flt = _arr[1];
	    if(_str.indexOf('.') == -1){
	        /* 找不到小数点，则添加 */
	        if(ext == 0){
	            return _str;
	        }
	        var _tmp = '';
	        for(var i = 0; i < ext; i++){
	            _tmp += '0';
	        }
	        _str = _str + '.' + _tmp;
	    }else{
	        if(_flt.length == ext){
	            return _str;
	        }
	        /* 找得到小数点，则截取 */
	        if(_flt.length > ext){
	            _str = _str.substr(0, _str.length - (_flt.length - ext));
	            if(ext == 0){
	                _str = _int;
	            }
	        }else{
	            for(var i = 0; i < ext - _flt.length; i++){
	                _str += '0';
	            }
	        }
	    }

	    return _str;
	}
</script>
<body>
	<#if barterDetail??>
  		<#if barterDetail.goodsState?? && barterDetail.goodsState==1>
  		<input name="barterId" value="${barterDetail.barterId}" type="hidden"/>
			<div class="wx_wrap">
				<div class="refund_wrap">
				    	<div class="mod_info mod_info_auto">
				    		<input name="refundId" value="${refundReturn.refundId}" type="hidden"/>
					    	<div class="goods goods_shop">
					            <div class="goods_bd">
					                <div class="goods_item" id="itemInfo">
					                    <div class="goods_img">
					                    	<a target="_blank" href="${base}/m/goods/goodsdetail?id=${barterDetail.goodsId}&url=referer">
					                    		<img src="${imgServer}${barterDetail.goodsImage}" onload="javascript:DrawImage(this,60,60);">
					                    	</a>
					                    </div>
					                    <div class="goods_name">
					                    	<a target="_blank" href="${base}/m/goods/goodsdetail?id=${barterDetail.goodsId}&url=referer">${barterDetail.goodsName}</a>
					                    </div>
					                </div>
					            </div>
	        				</div>
					        <div class="mod_info_bd">
					            <div class="mod_line">换货原因：</div>
					            <div class="mod_line co_gray">${barterDetail.buyerMessage}</div>
					        </div>
					    </div>
					    <div class="refund_num" id="refundFinance">
					        <div class="refund_hd">
					            <em class="co_red">*</em>审核备注： 
					            <div class="num_list">
					            	
					            		<div class="item"><span>${barterDetail.sellerMessage}</span></div>
					            	
					            </div>
					        </div>
					    </div>
					    <div class="mod_info mod_info_auto">
						    <div class="mod_info_hd">
						    	<div class="mod_line"><em style="color:red;">卖家收货地址</em></div>
						    	<#if barterDetail.orderDaddress??>
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
						            <div class="mod_line">
						                <div class="tit" style="color:red;">注意：</div>
						                <div class="cnt" style="color:red;">
						                    请安以上提供收货地址发货后,填写以下发货信息
						                </div>
						            </div>
					            </#if>
						    </div>
					    </div>
					    <div class="refund_num">
		                    <div class="control">
		                        <label><span>*</span>配送公司：</label><span id="ExpressNameError" style="color:red;"></span><br/>
		                        <#-- <select name="shippingExpressId" style="height: 30px;" class="text w150 tip-r">
							      	<#if expressList??>
							      		<#list expressList as express>
							      			<option value="${express.id}">${express.seName}</option>
							      		</#list>
							      	</#if>
								</select> -->
								<input id="shippingExpressName" name="shippingExpressName"  type="text" class="mod_inputTxt" placeholder="配送公司必填">
		                    </div>
	                	</div>
					    <div class="refund_num">
		                    <div class="control">
		                        <label><span>*</span>物流单号：</label><span id="error" style="color:red;"></span><br/>
		                        <input id="shippingCode" name="shippingCode"  type="text" class="mod_inputTxt" placeholder="物流单号必填">
		                    </div>
	                	</div>
	                	<div class="btn_wrap">
        					<a id="confirm_button" name="confirm_button" class="mod_btn mod_btn_bg3 mod_btn_large">提交</a>
    					</div>
				</div>
			</div>
			<#else>
				<div class="mod_line">
	                <div class="cnt" style="color:red;">
	                   您的订单已完成操作
	                </div>
	            </div>
			</#if>
			<#else>
				<div class="mod_line">
	                <div class="cnt" style="color:red;">
	                  请勿查看其它用户信息
	                </div>
	            </div>
			</#if>
</body>
</html>