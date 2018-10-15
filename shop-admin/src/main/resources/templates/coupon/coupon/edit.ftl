<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/admincp.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/common_select.js" charset="utf-8"></script>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>优惠券编辑</h3>
            <ul class="tab-base">
                <li><a href="${base}/coupon/list"><span>列表</span></a></li>
                <li><a href="javascript:void(0);" class="current"><span>编辑</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form id="class_form" method="post" action="${base}/coupon/update">
        <input type="hidden" name="couponId" value="${coupon.couponId}"/>
        <table class="table tb-type2">
            <tbody>
	            <tr class="noborder">
	                <td class="required" colspan="2"><label class="validation" for="className">优惠券名称：</label></td>
	            </tr>
	            <tr class="noborder">
	                <td class="vatop tips">${coupon.couponTitle}</td>
	            </tr>
	            
	            <tr>
	                <td class="required" colspan="2"><label class="validation" for="classSort">优惠金额：</label></td>
	            </tr>
	            <tr class="noborder">
	                <td class="vatop tips">${coupon.couponPrice}</td>
	            </tr>
	            
	            <tr>
	                <td class="required" colspan="2"><label class="validation" for="classShow">店铺名称：</label></td>
	            </tr>
	            <tr class="noborder">
	                <td class="vatop tips">${coupon.storeName}</td>
	            </tr>
	           
	            <tr>
	                <td class="required" colspan="2"><label class="validation" for="classShow">分类名称：</label></td>
	            </tr>
	            <tr class="noborder">
	                <td class="vatop tips">${coupon.couponTypeName}</td>
	            </tr>
	            
	            <tr>
	                <td class="required" colspan="2"><label class="validation" for="classShow">使用期限：</label></td>
	            </tr>
	            <tr class="noborder">
	                <td class="vatop tips">${coupon.startTimeStr?string('yyyy-MM-dd')}-${coupon.endTimeStr?string('yyyy-MM-dd')}</td>
	            </tr>
	            
	            <tr>
	                <td class="required" colspan="2"><label class="validation" for="classShow">优惠券图片：</label></td>
	            </tr>
	            <tr class="noborder">
	                <td class="vatop tips">${coupon.couponPic}</td>
	            </tr>
	            
	            <tr>
	                <td class="required" colspan="2"><label class="validation" for="classShow">使用条件：</label></td>
	            </tr>
	            <tr class="noborder">
	                <td class="vatop tips">${coupon.couponDesc}</td>
	            </tr>
	            
	            <tr>
	                <td class="required" colspan="2"><label class="validation" for="classShow">上架：</label></td>
	            </tr>
	            <tr>
		            <td class="vatop rowform onoff" rowspan="4">
		                <label for="store_state1" class="cb-enable <#if coupon.couponState == 0>selected</#if>" ><span>是</span></label>
		                <label for="store_state0" class="cb-disable <#if coupon.couponState == 1>selected</#if>" ><span>否</span></label>
		                <input id="store_state1" name="couponState" <#if coupon.couponState == 0>checked="checked"</#if>  value="0" type="radio"/>
		                <input id="store_state0" name="couponState" <#if coupon.couponState == 1>checked="checked"</#if> value="1" type="radio"/>
		            </td>
		        </tr>
		        
		        <tr>
	                <td class="required" colspan="2"><label class="validation" for="classShow">推荐：</label></td>
	            </tr>
	            <tr>
		            <td class="vatop rowform onoff" rowspan="4">
		                <label for="store_recommend1" class="cb-enable <#if coupon.couponRecommend == 1>selected</#if>" ><span>是</span></label>
		                <label for="store_recommend0" class="cb-disable <#if coupon.couponRecommend == 0>selected</#if>" ><span>否</span></label>
		                <input id="store_recommend1" name="couponRecommend" <#if coupon.couponRecommend == 1>checked="checked"</#if>  value="1" type="radio"/>
		                <input id="store_recommend0" name="couponRecommend" <#if coupon.couponRecommend == 0>checked="checked"</#if> value="0" type="radio"/>
		            </td>
		        </tr>
		        
		        <tr>
	                <td class="required" colspan="2"><label class="validation" for="classShow">审核通过：</label></td>
	            </tr>
	            <tr>
		            <td class="vatop rowform onoff" rowspan="4">
		                <label for="store_AllowState1" class="cb-enable <#if coupon.couponAllowState == 1 || coupon.couponAllowState == 0>selected</#if>" ><span>通过</span></label>
		                <label for="store_AllowState0" class="cb-disable <#if coupon.couponAllowState == 2>selected</#if>" ><span>不通过</span></label>
		                <input id="store_AllowState1" name="couponAllowState" <#if coupon.couponAllowState == 1 || coupon.couponAllowState == 0>checked="checked"</#if>  value="1" type="radio"/>
		                <input id="store_AllowState0" name="couponAllowState" <#if coupon.couponAllowState == 2>checked="checked"</#if> value="2" type="radio"/>
		            </td>
		        </tr>
            
            </tbody>
            <tfoot>
            <tr class="tfoot">
                <td colspan="15"><a id="submitBtn" class="btn" href="JavaScript:void(0);"> <span>提交</span> </a></td>
            </tr>
            </tfoot>
        </table>
    </form>
</div>
<script type="text/javascript">
    $(function(){
        //按钮先执行验证再提交表单
        $("#submitBtn").click(function(){
             $("#class_form").submit();
        });
    });

</script>
</@layout.body>