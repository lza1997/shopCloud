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
            <h3>退货记录</h3>
            <ul class="tab-base">
                <li><a href="JavaScript:void(0);" class="current"><span>审核</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <input name="refundId" value="${refundReturn.refundId}" type="hidden"/>
		<table class="ncu-table-style">
			<thead>
				<tr>
					<th class="w10"></th>
					<th class="w70"></th>
					<th>商品名称</th>
					<th>退款金额</th>
					<th>退货数量</th>
				</tr>
			</thead>
			<tbody>
				<tr class="bd-line">
					<td></td>
					<td>
						<div class="goods-pic-small">
							<span class="thumb size60">
								<i></i>
								<a target="_blank" href="${base}/product/detail?id=${refundReturn.goodsId}">
									<img style="display: inline;" src="${imgServer}${refundReturn.goodsImage}" onload="javascript:DrawImage(this,60,60);">
								</a>
							</span>
						</div>
					</td>
					<td>
						<dl class="goods-name">
							<dt>
								<a href="${frontServer}/product/detail?id=${refundReturn.goodsId}" target="_blank">${refundReturn.goodsName}</a>
							</dt>
							<#-- <dd>${returnGoods.specInfo}</dd> -->
						</dl>
					</td>
					<td>
						<script type="text/javascript">
             					var price = number_format(${refundReturn.refundAmount},2);
             					document.write(price);
             				</script>
					</td>
					<td class="w150 bdl bdr" id="goodsNum">${refundReturn.goodsNum}</td>
				</tr>
			</tbody>
		</table>
		<div class="wrap-shadow">
			<div class="wrap-all ncu-order-view"> 
				<dl>
			    	<dt>图片信息：</dt>
                	<table>
                		<tr>
                			<td><ul class="img_ul" id="return_img"></ul></td>
                			<td>
                				<#if refundReturn.picInfo!=''>
							     	<#list refundReturn.picInfo?split(',') as img>
							     		<#if img!=''>
							     			<img width="80px" height="80px" src="${imgServer}${img}"/>
							     		</#if>
							     	</#list>
						     	</#if>
                			</td>
                		</tr>
                	</table>
                </dl>
                <dl>
                	<dt>退货原因：</dt>
  						<dd>${refundReturn.buyerMessage}</dd>
                </dl>
				<dl>
			      <dt class="required"><em class="pngFix"></em>审核备注：</dt>
			      <dd style="width:320px;">
			        <textarea style="height: 100px;" name="return_message" class="textarea w300" rows="5"></textarea>
			      </dd>
			    </dl>
			    <dl class="bottom">
			      <dt>&nbsp;</dt>
			      <dd>
			        <input type="submit" class="submit" onclick="returnOrder(2)" value="同意">
			      </dd>
			      <dd>
			      	<input type="submit" class="submit" onclick="returnOrder(3)" value="拒绝">
			      </dd>
			    </dl>
			</div>
		</div>
</div>
<script type="text/javascript">
	function returnOrder(sellerState){
		var refundId=$("input[name='refundId']").val();
		var sellerMessage = $("textarea[name='return_message']").val();
		var fmUrl = '${base}/platformOrder/returnOrder';
		$.ajax({
             type: "post",
             url: fmUrl,
             data: {refundId:refundId,sellerState:sellerState,sellerMessage:sellerMessage},
             dataType: "json",
			 async:false,
			 success:function(data) {
				if(data.success){
					layer.msg("审核成功!",{icon:1},function(){
						location.href="${base}/platformOrder/returnOrderList";
					});	
				}else{
					layer.msg("审核失败!",{icon:2},function(){
						layer.closeAll();
					});		
				}
			}
         });   
	}
</script>
</@layout.body>