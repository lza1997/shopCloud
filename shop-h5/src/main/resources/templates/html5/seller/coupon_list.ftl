<#assign couponTag =newTag("couponTag")>  
							<#assign couponlist =couponTag("{'storeId':'${storeId}'}")>
							<#if couponlist?size gt 0>
							<#list couponlist as coupon>
								<#if coupon.couponState == 0>
<div class="container-fluid top25">
	<div class="row re" style="padding-top:10px;">
		<div class="col-xs-12 col-sm-12 text-center">
			<img class="img-responsive" src="${base}/res/html5/images/juan_grey.png" />
		</div>
		<div class="abs">
			<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5 white padding10">
				<p>
					<span class="pull-left re left10">
						<font class="f20 bottomer">￥</font>
						<font class="f60 impact">${couponMember.couponPrice}</font>
				    	<font class="f12 bottomer1 left10">优惠券</font>
				    </span>
			    </p>
			</div>
			
			<div class="col-xs-7 col-sm-7 col-md-7 col-lg-7 padding10">
				<p>
			    	<span class="f20 white text-center heiti left10 padding5">${couponMember.storeName}</span>
			    </p>
			    <div class="clear"></div>
				<p class="f16 top5 white text-left heiti">过期时间：${couponMember.endTimeStr?string("yyyy-MM-dd")}</p>
			</div>
			<#if couponIsUser==2>
				<div class="juan"><img width="100px;" height="30px;" src="${base}/res/html5/images/juan1.png" class="img-responsive" /></div>
			</#if>
		</div>
    </div>
</div>
</#list>
<#else>
	<p style="text-align:center">暂无符合要求的优惠券</p>
</#if>

