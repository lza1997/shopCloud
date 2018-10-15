<#assign couponMemberTag = newTag("couponMemberTag")/>
<#assign couponMap = couponMemberTag("{'couponIsUser':'${couponIsUser}','currentTime':'${time}'}") />
<#assign couponlist = couponMap.couponMemberList >


<div class="coupon">

    <#--之定义数据-->
   	<#if couponlist?size gt 0>
		<#list couponlist as couponMember>
            <#if couponMember.couponId ??&& couponMember.endTime>
            <a href="${base}/m/index/shop?storeId=${couponMember.storeId}" target="_blank">
            <div class="coupon_list">
                <div class="coupon_img">
                    <img src="${base}/res/html5/images/juan_red.png" />
                </div>

                    <div class="coupon_con">
                        <div class="coupon_con_img">
                            <img src="${imgServer}/${couponMember.couponPic}" alt="">
                        </div>
                        <div class="coupon_con_p">
                            <p class="title">${couponMember.couponTitle}</p>
                            <p>${couponMember.storeName}</p>
                            <p class="titlecon">
                                <#if couponMember.startTimeStr??>
                                ${couponMember.startTimeStr?string("yyyy-MM-dd")}
                                </#if>
                                ~
                                <#if couponMember.endTimeStr??>
                                ${couponMember.endTimeStr?string("yyyy-MM-dd")}
                                </#if>
                            </p>

                        </div>
                    </div>
                </div>
                </a>
            </#if>
        </#list>
    </#if>
</div>


			
	


