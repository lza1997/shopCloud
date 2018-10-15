<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/jquery.validation.min.js"></script>
<script type="text/javascript" src="${base}/res/js/layer/layer.js"></script>
<script src="${base}/res/js/area.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<style>
	.transinput{
		background-color: transparent;border:none; outline:none;
	}
	.select{width: 100px;height: 26px;}
</style>
</@layout.head>
<@layout.body>
<div class="page">
    <table class="table tb-type2 order">
        <tbody>
        <tr class="space">
            <th colspan="15">订单状态</th>
        </tr>
        <tr>
            <td colspan="2">
                <ul>
                    <li>
                        <strong>订单号:</strong>${order.orderSn}
                        ( 支付单号 : ${order.paySn} )
                    </li>
                    <li><strong>订单状态:</strong>
                        <#if order.orderState==10>待付款</#if>
                        <#if order.orderState==20>待发货</#if>
                        <#if order.orderState==30>待收货</#if>
                        <#if order.orderState==40>交易完成</#if>
                        <#if order.orderState==0>已取消</#if>
                    </li>
                    <li>
                    	<strong>支付金额:</strong>
                    	<span class="red_common">¥
                    		<script type="text/javascript">
	    						var amount = number_format(${order.orderAmount},2);
	    						document.write(amount);
	    					</script>
                    	</span>
                        <#if (order.refundAmount > 0)>
                            (退款:¥
                            	<script type="text/javascript">
		    						var amount = number_format(${order.refundAmount},2);
		    						document.write(amount);
		    					</script>)
                        </#if>
                    </li>
                    <li><strong>余额支付金额:</strong>¥
                    	<script type="text/javascript">
    						var predepositAmount = number_format(${order.predepositAmount},2);
    						document.write(predepositAmount);
    					</script>
                    </li>
                    <li><strong>商品总额:</strong>¥
                    	<script type="text/javascript">
    						var goodsamount = number_format(${order.goodsAmount},2);
    						document.write(goodsamount);
    					</script>
                    </li>
                    <li><strong>运费:</strong>
                    	<#if order.shippingFee??>
					    	<#if order.shippingFee!=0>
					    		¥
		                    	<script type="text/javascript">
		    						var ship = number_format(${order.shippingFee},2);
		    						document.write(ship);
		    					</script>
		    				<#else>
	              				（免运费）
			          		</#if>
			          	<#else>
			          		（免运费）
			          	</#if>
                    </li>
                </ul>
            </td>
        </tr>
        <tr class="space">
            <th colspan="2">订单详情</th>
        </tr>
        <tr>
            <th>订单信息</th>
        </tr>
        <tr>
            <td><ul>
                <li><strong>买家：</strong>${order.buyerName}</li>
                <li><strong>店铺：</strong>${order.storeName}</li>
                <li><strong>支付方式：</strong>${order.paymentName}</li>
                <li><strong>下单时间：</strong>${order.createTimeStr?string("yyyy-MM-dd HH:mm:ss")}</li>
                <#if order.paymentTimeStr??>
                    <li><strong>支付时间：</strong>${order.paymentTimeStr?string("yyyy-MM-dd HH:mm:ss")}</li>
                </#if>
                <#if order.finnshedTimeStr??>
                    <li><strong>完成时间：</strong>${order.finnshedTimeStr?string("yyyy-MM-dd HH:mm:ss")}</li>
                </#if>
                <#if order.orderMessage != null && order.orderMessage != ''>
                    <li><strong>买家附言：</strong>${order.orderMessage}</li>
                </#if>
            </ul></td>
        </tr>
        <tr>
            <th>收货人及发货信息</th>
        </tr>
        <tr>
            <td>
                <ul>
                	<#if order.address??>
                	<form action="#" id="addressForm">
                		<input name="addressId" value="${order.address.addressId}" type="hidden"/>
               			<li>
               				<em style="color:red;display:none;">*</em>
               				<strong>收货人姓名：</strong>
               				<span id="trueNameSp">${order.address.trueName}</span>
               				<input name="trueName" value="${order.address.trueName}" style="display: none;"/>
               			</li>
               			<li>
               				<em style="color:red;display:none;">*</em>
               				<strong>收货人手机：</strong>
               				<span id="mobPhoneSp">${order.address.mobPhone}</span>
               				<input name="mobPhone" value="${order.address.mobPhone}" style="display: none;"/>
               			</li>
               			<!-- <li>
               				<em style="color:red;display:none;">*</em>
               				<strong>收货人电话：</strong>
               				<input name="telPhone" value="${order.address.telPhone}" disabled="disabled" class="transinput"/>
               			</li> -->
               			<li>
               				<em style="color:red;display:none;">*</em>
               				<strong>邮编：</strong>
               				<span id="zipCodeSp">${order.address.zipCode}</span>
               				<input name="zipCode" value="${order.address.zipCode}" style="display: none;"/>
               			</li>
               			<li>
               				<em style="color:red;display:none;">*</em>
               				<strong>收货地区：</strong>
               				<div id="region" style="display: none;">
	                        	<input id="city_id" type="hidden" name="cityId" value="">
								<input id="area_id" class="area_ids" type="hidden" name="areaId" value="">
								<input id="area_info" class="area_names" type="hidden" name="areaInfo" value="">
	                            <span id="spanarea">
							       	<select name="provinceId" id="area">
							       		<option selected="selected" value="0">请选择</option>
							         	<#if areas??>
							  				<#list areas as str>
							  					<option value="${str.areaId}" >${str.areaName}</option>
							  				</#list>
										</#if>
						         	</select> 	
								</span>
								<span id="spancity"></span>
								<span id="spanqu"></span>
								<span class="areaMsg" style="color: red"></span>
	                        </div>
               				<span id="areaInfoSp">${order.address.areaInfo}&nbsp;</span>
               			</li>
               			<li>
               				<em style="color:red;display:none;">*</em>
               				<strong>详细地址：</strong>
               				<span id="addressSp">${order.address.address}</span>
               				<input name="address" value="${order.address.address}" style="width: 200px;display: none;"/>
               			</li>
               			<li id="update_address"><a href="javascript:void(0)" onclick="updateAddress();">修改收货地址</a></li>
               			<li id="save_address" style="display:none;">
               				<a href="javascript:void(0)" onclick="saveAddress(this);">保存</a>
               				<a href="javascript:void(0)" onclick="cancel();">取消</a>	
               			</li>
               		</form>
                	</#if>
                </ul>
            </td>
        </tr>
        <tr>
            <th>发票信息</th>
        </tr>
        <tr>
            <td>
                <ul>
                	<li>${order.invoice}</li>
                </ul>
            </td>
        </tr>
        <tr>
            <th>商品信息</th>
        </tr>
        <tr>
            <td><table class="table tb-type2 goods ">
                <tbody>
                <tr>
                    <th></th>
                    <th>商品信息</th>
                    <th class="align-center">单价</th>
                    <th class="align-center">数量</th>
                    <th class="align-center">小计</th>
                </tr>
                <#list order.orderGoodsList as goods>
                    <tr>
                        <td class="w60 picture"><div class="size-56x56"><span class="thumb size-56x56"><i></i><a href="javascript:;" target="_blank"><img src="${imgServer}${goods.goodsImage}" onload="javascript:DrawImage(this,60,60);" /> </a></span></div></td>
                        <td class="w50pre"><p><a href="${frontServer}/product/detail?id=${goods.goodsId}" target="_blank">${goods.goodsName}</a></p></td>
                        <td class="w96 align-center">
                        	<span class="red_common">￥
                        		<script type="text/javascript">
		    						var price = number_format(${goods.goodsPrice},2);
		    						document.write(price);
		    					</script>
                        	</span>
                        </td>
                        <td class="w96 align-center">${goods.goodsNum}</td>
                        <td class="w96 align-center">
                        	<span class="red_common">￥
                        		<script type="text/javascript">
		    						var payprice = number_format(${goods.goodsPrice*goods.goodsNum},2);
		    						document.write(payprice);
		    					</script>
                        	</span>
                        </td>
                        
                    </tr>
                </#list>
                </tbody>
            </table></td>
        </tr>
        <#if vo.refundList?? && vo.refundList?size != 0>
            <tr>
                <th>退款记录</th>
            </tr>
            <#list vo.refundList as refund>
                <tr>
                    <td>发生时间：${refund.addTimeStr?string("yyyy-MM-dd HH:mm:ss")}&emsp;&emsp;退款单号：${refund.refundSn}&emsp;&emsp;退款金额：￥${refund.refundAmount}&emsp;备注：${refund.goodsName}</td>
                </tr>
            </#list>
        </#if>
        <#if vo.returnList?? && vo.returnList?size != 0>
        <tr>
            <th>退货记录</th>
        </tr>
            <#list vo.returnList as return>
            <tr>
                <td>发生时间：${return.addTimeStr?string("yyyy-MM-dd HH:mm:ss")}&emsp;&emsp;退款单号：${return.refundSn}&emsp;&emsp;退款金额：￥${return.refundAmount}&emsp;备注：${return.goodsName}</td>
            </tr>
            </#list>
        </#if>
        <#if order.orderLogList?? && order.orderLogList?size != 0>
        <tr>
            <th>操作历史</th>
        </tr>
            <#list order.orderLogList as log>
            <tr>
                <td>
                    ${log.operator}&emsp;于&emsp;${log.createTimeStr?string("yyyy-MM-dd HH:mm:ss")}&emsp;${log.stateInfo}
                </td>
            </tr>
            </#list>
        </#if>
        </tbody>
        <tfoot>
        <tr class="tfoot">
            <td><a href="JavaScript:void(0);" class="btn" onclick="history.go(-1)"><span>返回</span></a></td>
        </tr>
        </tfoot>
    </table>
</div>
<script>
	$(function(){
		formValidate();
		init_area('${order.address.provinceId}','${order.address.cityId}','${order.address.areaId}');
	});
	
	jQuery.validator.addMethod("isMobPhone",function(value,element){
		var pattern = /^1\d{10}$/; //手机号格式
		return this.optional(element) || (pattern.test(value));  
	},"请填写正确的手机号");
	
	var formValidate = function(){
		$('#addressForm').validate({
		    errorPlacement: function(error, element){
		        $(element).next('.field_notice').hide();
		        $(element).after(error);
		    },
		    rules : {
		    	trueName : {
		    		required   : true
		    	},
		        mobPhone : {	
					required   : true,
					isMobPhone : true
		        },
		        address : {
		        	required   : true
		        },
		        zipCode : {
		        	required   : true
		        }
		    },
		    messages : {
		    	trueName : {
		    		required   : '请填写收货人姓名'
		    	},
		        mobPhone : {
					required : '请填写收货人手机',
					isMobPhone : '请填写正确的手机号'
		        },
		        address : {
		        	required   : '请填写收货地址'
		        },
		        zipCode : {
		        	required   : '请填写邮编'
		        }
		    }
		});
	}
	
	function saveAddress(obj){
		if($('#addressForm').valid()){
			//保存,取消链接标签设置为显示
			$(obj).attr("onclick","");
			var provinceId = $('#area').val(); //省的id
            var cityId = $('#city').val(); //城市id
            var areaId = $('#qu').val(); //区的id
			if(provinceId==''||provinceId=='0'){
                $(".areaMsg").html('请选择省份');
                return false;
            }else{
                $(".areaMsg").html('');
            }
            if(cityId==''||cityId=='0'){
                $(".areaMsg").html('请选择城市');
                return false;
            }
            if(areaId==''||areaId=='0'){
                $(".areaMsg").html('请选择区');
                return false;
            }else{
                $(".areaMsg").html('');
            }

            var provinceval = $('#area').find("option:selected").html(); //省的值
            var cityval = $('#city').find("option:selected").html(); //城市的值
            var quval = $('#qu').find("option:selected").html(); 	 //区的值
            var areaInfo=provinceval+","+cityval+","+quval;//保存到常用地址表
            $('#area_info').val(areaInfo);
			var address = $("#addressForm").serialize();
			$.ajax({
	        	url:'${base}/orders/updateOrderAddress',
	            type:'post',
	            data : address,
	            dataType:'json',
	            success:function(data){
	            	if(data.result==1){
						layer.msg('保存成功', {icon: 1, time:500}, function(){
							location.reload();
						});
	            	}else{
	            		//保存,取消链接标签设置为显示
						$(obj).attr("onclick","saveAddress();");
	            	}
	            },error:function(){
	            	//保存,取消链接标签设置为显示
					$(obj).attr("onclick","saveAddress();");
	            	cancel();
	            	layer.msg('通信失败', {icon: 2});
	            }
	        });
		}
	}
	
	//修改收货地址
	function updateAddress(){
		//获取收货地址form表单下的所有input
		var transin = $("#addressForm").find("input");
		//获取收货地址form表单下的所有<em>
		var formems = $("#addressForm").find("em");
		//获取收货地址form表单下的所有<span>
		var formsp = $("#addressForm").find("span");
		//收货地址form表单下的所有input设置为显示
		transin.css("display","inline");
		//收货地址form表单下的所有<em>设置为显示
		formems.css("display","inline");
		//收货地址form表单下的所有<span>设置为隐藏
		formsp.css("display","none");
		//修改收货地址链接标签设置为隐藏
		$("#update_address").css("display","none");
		//保存,取消链接标签设置为显示
		$("#save_address").css("display","inline");
		//收货地区选择显示
		$("#region").css("display","inline");
		$("#region").find("span").css("display","inline");
	}
	
	//取消修改
	function cancel(){
		//获取收货地址form表单下的所有input
		var transin = $("#addressForm").find("input");
		//获取收货地址form表单下的所有<em>
		var formems = $("#addressForm").find("em");
		//获取收货地址form表单下的所有<span>
		var formsp = $("#addressForm").find("span");
		//获取收货地址form表单下的所有<label>
		var formlab = $("#addressForm").find("label");
		//收货地址form表单下的所有input设置为隐藏
		transin.css("display","none");		
		//收货地址form表单下的所有<em>设置为隐藏
		formems.css("display","none");
		//收货地址form表单下的所有<span>设置为显示
		formsp.css("display","inline");
		//修改收货地址链接标签设置为显示
		$("#update_address").css("display","inline");
		//保存,取消链接标签设置为隐藏
		$("#save_address").css("display","none");
		//收货地区选择隐藏
		$("#region").css("display","none");
		//删除validation的错误label
		formlab.remove();
	}
</script>
</@layout.body>