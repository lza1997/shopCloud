<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width,inital-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
<#--清除缓存	-->
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
<#--清除缓存	-->
<title>商品咨询 </title>
<link href="${base}/res/html5/css/style.css" rel="stylesheet" type="text/css" />
<script src="${base}/res/html5/js/jquery-1.10.2.min.js"></script>
<script src="${base}/res/js/layer/layer.js"></script>
<link href="${base}/res/css/mycart.css" rel="stylesheet" type="text/css" />
<link href="${base}/res/css/global.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/res/js/jquery.raty/jquery.raty.min.js" ></script>
<script type="text/javascript">
function subConsult() {
    var content = $("#consultContent").val();
    var goodsId = ${goodsId};
    if (content != '') {
        $.ajax({
            url: '${base}/product/saveConsult',
            dataType: 'json',
            data: $("#consultForm").serializeArray(),
            success: function (data) {
                if (data.success) {
                    location.href="${base}/m/goods/goodsConsultList?goodsId="+goodsId;
                } else {
                	layer.open({content:'咨询发布失败', time: 1});
                }
            }
        })
    }
}
</script>
</head>
<body>
<div class="phone_hd">
	<a class="back" href="javascript:history.go(-1);">
		<img src="${base}/res/html5/images/back.png" width="25" height="25" />
	</a>返回
	<a class="menu home" href="${base}/m/index/index">
		<img src="${base}/res/html5/images/home.png" width="25" height="25" />
	</a>
</div>
<div class="order_page">
		<table class="trade_table" cellpadding="0" cellspacing="0">
	    	<tbody>
	        	<tr>
	            	<td class="td_left"><img src="${base}/res/html5/images/order_info_01.png" width="30" height="30" /></td>
	                <td>
	                	<ul>
			           		 <li class="big"><span class="fl" style="color:white;">商品咨询</span></li>
	                    </ul>
	                </td>
	            </tr>
	        </tbody>
	    </table>
	  <!--   <form >
			
		    <dt>内容：</dt>
		    <dd>
		    	<textarea  ></textarea>
		        <p class="text-note">※ 请输入不要超过 <b>150</b> 个字</p>
		        <button type="button" class="btng" >提交</button>
		    </dd>
		</form> -->
	    <form id="consultForm" method="post" action="${base}/product/consult" name="queryListForm">
	    	<#assign goodsBaseTag =newTag("goodsBaseInfoTag")>
			<#assign goodsInfo =goodsBaseTag("{'goodsid':'${goodsId}'}")>
		    <input type="hidden" name="goodsId" value="${goodsInfo.goodsId}"/>
		    <input type="hidden" name="cgoodsName" value="${goodsInfo.goodsName}"/>
		    <input type="hidden" name="storeId" value="${goodsInfo.storeId}"/>
		    <input type="hidden" name="div" id="div" value="#kfzxData"/>
			<div class="order_page_box">
        		<input name="goodsId" value="${orderGoods.recId}" type="hidden"/>
		        <div class="order_goods">
			       	<span class="fl">
			       		咨询内容：
			       	</span>
			        <span class="fl">
			       		<textarea class="textarea" name="consultContent" id="consultContent" style="width: 600px; height: 100px;"></textarea>
			       	</span>
			       
		        </div>
		        <div class="order_goods">
			       	<span class="fl">
			       		※ 请输入不要超过 <b>150</b> 个字
			       	</span>
		        </div>
			</div>
			<div class="order_foot">
				<a class="bg_red" href="javascript:void(0)" onclick="subConsult()"> 确定 </a>             
		    </div>
	</form>
</div>
</body>
</html>
