<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>申请退款</title>
<meta name="viewport" content="width=device-width,inital-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<link href="${base}/res/html5/css/style.css" rel="stylesheet" type="text/css" />
<script src="${base}/res/html5/js/jquery-1.10.2.min.js"></script>
<script src="${base}/res/html5/js/jquery.validate.min.js"></script>
<script src="${base}/res/js/jquery.js" charset="utf-8"></script>
<script src="${base}/res/js/common.js" charset="utf-8"></script>
<!-- 手机端弹出框开始 -->
<script src="${base}/res/html5/js/mobile/layer.m.js" charset="utf-8"></script>
<!-- 手机端弹出框结束 -->
<script type="text/javascript" src="${base}/res/js/ajaxfileupload/ajaxfileupload.js" charset="utf-8"></script>
<style>
	/* 上传图片标签 */
	.addImg {
		display: block;
		width: 80px;
		margin-top: 5px;
		height: 80px;
		line-height: 80px;
		border: 1px solid #ccc;
		color: #999;
		text-align: center;
	}
	 a:visited {color: #999} 
	 .img_li{
	 	display: inline; 
	 	padding: 10px;
	 }
	 .img_ul{
	 	padding-top: 10px;
	 }
</style>
<script type="text/javascript">
$(function(){
	$("#confirm_button").click(function(){
		var orderId = $("input[name='orderId']").val(); //订单id
		var buyerMessage = $("textarea[name='buyer_message']").val(); //退货原因
		var refundAmount = $("input[name='refundAmount']").val(); //退款金额
		//判断填写退货数量为0
		if(refundAmount==0){
			layer.open({content: '请您填写退款金额!', time: 1});
			return false;
		}
		//判断退货原因是否填写
		if(buyerMessage==''){
			layer.open({content: '请填写退货原因', time: 1});
			return false;
		} 
		//商品多图
		var goodsImageMore = "";
		$("[name=deletePhoto]").each(function(){
			goodsImageMore += $(this).attr("imageSrc") + ",";
		});
		var fmUrl = '${base}/m/authc/buyer/orderRefund';
		$.ajax({
             type: "post",
             url: fmUrl,
             data: {orderId:orderId,buyerMessage:buyerMessage,goodsImageMore:goodsImageMore,refundAmount:refundAmount},
             dataType: "json",
			 success:function(data) {
				if(data.success){
						location.href='${base}/m/authc/buyer/orderList?orderState=99';
				}else{
					layer.open({content:'退款提交失败!', time: 1});
				}
			}
         }); 
	});
});
function change(obj){
	
	var reg = /^\d+$/; //检验是否为数字的正则表达式
	var returnGoodsNum = $(obj).val();
	var goodsNum =$("input[name='goodsNum']").val();;
	if(returnGoodsNum==''){
		$(obj).val(goodsNum);
	}else if(!reg.test(returnGoodsNum)){
		layer.open({content:'请您输入正确的数量!', time: 1});
		$(obj).val(goodsNum);
	}else if(returnGoodsNum>goodsNum){
		layer.open({content:'请您输入正确的数量!', time: 1});
		$(obj).val(goodsNum);
	}
}
//删除上传的图片
$("[name=deletePhoto]").live("click", function(){
	$(this).parent().remove();
});

/*上传退货图片*/
function ajaxImageUploads(myBlogImage){
	var imgNo = $("#return_img").find("li").length;
	$.ajaxFileUpload({
        //处理文件上传操作的服务器端地址(可以传参数,已亲测可用)
        url:"${base}/user/returnImageFileUpload",
        secureuri:false,                       //是否启用安全提交,默认为false
        fileElementId:myBlogImage,           //文件选择框的id属性
        dataType:'json',                       //服务器返回的格式,可以是json或xml等
        data:{imgNo:imgNo},						   //已上传的图片数量
        success:function(data, status){        //服务器响应成功时的处理函数
            if(data.success){
            	var count = parseInt(data.listimgSize);
            	var strs01 = data.photoNewName.split(",");
            	var imgBasePath = '${imgServer}'
            	var imgPath = data.imgPath;
            	for(var i = 0; i < count; i++){	         
            		var photoSrc01 = imgPath + "/" + strs01[i];
            		var photoServcerSrc = imgBasePath + imgPath + "/" + strs01[i];
            		$("#return_img").append("<li class='img_li'><img style='width:82px;height:82px' src='"+photoServcerSrc+"'/><a href='javascript:void(0)' imageSrc='"+photoSrc01+"' name='deletePhoto'> 删除</a></li>");
            	}
            }else{
            	layer.open({content:'最多上传三张图片', time: 1});
            }
        },
        error:function(data, status, e){ //服务器响应失败时的处理函数
        	layer.open({content:'图片上传失败，请重试！', time: 1});
        }
    });
}
</script>
</head>
<body class="user_bg">
<div class="phone_hd">
	<a class="back" href="javascript:history.go(-1);"><img src="${base}/res/html5/images/back.png" width="25" height="25" /></a>返回
	<a class="menu home" href="${base}/m/index/index"><img src="${base}/res/html5/images/home.png" width="25" height="25" /></a>
</div>
<#if order??>
<div class="order_page">
		<table class="trade_table" cellpadding="0" cellspacing="0">
	    	<tbody>
	        	<tr>
	            	<td class="td_left"><img src="${base}/res/html5/images/order_info_01.png" width="30" height="30" /></td>
	                <td>
	                	<ul>
			           		 <li class="big"><span class="fl">订单退款</span></li>
	                       
	                    </ul>
	                </td>
	            </tr>
	        </tbody>
	    </table>
	    <form action="" method="post" id="myForm">
	    	<input name="orderId" value="${order.orderId}" type="hidden"/>
			<div class="order_page_box">
				<div class="order_goods">
				<#if order.orderGoodsList??>
					<#list order.orderGoodsList as orderGoods>
						<input name="orderGoodsId" value="${orderGoods.recId}" type="hidden"/>
				       	<div class="dt">
				       		<a  href="${base}/m/goods/goodsdetail?id=${orderGoods.goodsId}">
		          				<img src="${imgServer}${orderGoods.goodsImage}" width="50" height="50">
		          			</a>
				       	</div>
				        <div class="dd dd_01">
					        <span class="name">
					        	<a href="${base}/m/goods/goodsdetail?id=${orderGoods.goodsId}">${orderGoods.goodsName}</a>
					        </span></br>
					        <span class="name">
					        	${orderGoods.specInfo}
					        </span>
					        <span class="size"> </span>
				        </div>
			        </#list>
				</#if>
		         <div class="dd dd_01">
			        <span class="name"></br>
					<label>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						退款金额：&nbsp;
						<input type="text" name="refundAmount" value="${order.orderAmount+order.predepositAmount}"  disabled="true"/>            
			  		</label>
			        </span>
			        <span class="size"> </span>
		         </div>
		        </div>
		        <div class="order_goods">
			       	<span class="fl">
			       		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;退款原因：
			       	</span>
			        <span class="fl">
			       		<textarea name="buyer_message"></textarea>
			       	</span>
			       
		        </div>
		        <div class="order_goods">
			       	<span class="fl">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			       		退款信息只能填写提交一次，建议与卖家沟通后认真填写。
			       	</span>
		        </div>
		        <div class="order_goods">
			    	<span class="fl">
			       		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;图片信息：
			       	</span>
	               	<table>
	               		<tr>
	               			<td><ul class="img_ul" id="return_img"></ul></td>
	               			<td>
	               				<a class="addImg" href="#none" style="position: relative; z-index: 1;text-decoration:none;">添加图片
			                		<input type="file" onChange="ajaxImageUploads('myBlogImage1')" style="opacity:0; top:0; left:0; width:100%; height:100%; margin:0; position:absolute;" id="myBlogImage1" name="myfiles" class="file" multiple="multiple"/>
			                	</a>
	               			</td>
	               		</tr>
	               	</table>
                </div>
			</div>
			<div class="order_foot">
				<a class="bg_red" href="javascript:void(0)" id="confirm_button" name="confirm_button"> 确定 </a>             
		    </div>
	</form>
</div>

<#else>
	<div class="wrap-shadow">
		<div class="wrap-all ncu-order-view"> 
			<p style="font-size: 30px;">您的订单已申请退款</p>
		</div>
	</div>
</#if>

</body>
</html>
