<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/jquery.edit.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery.nyroModal/custom.min.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/jquery.poshytip.min.js" charset="utf-8"></script>
<link href="${base}/res/js/jquery.nyroModal/styles/nyroModal.css" rel="stylesheet" type="text/css" id="cssfile2" />
<script type="text/javascript">
    $(function(){
	    $("#submitBtn").click(function(){
	            $("#form_store_verify").submit();
	    });
	    
	    //当入驻状态为待审核时显示
	    if('${storeJoinin.joininState}'!=null&&'${storeJoinin.joininState}'!=10){
	       $("#checkstate").hide();
	       $("#submitBtn").hide();
	    } 
    });
</script>
</@layout.head>
<@layout.body>
<div class="page">
<div class="fixed-bar">
    <div class="item-title">
        <h3>店铺</h3>
        <ul class="tab-base">
            <li><a href="${base}/store/manager/list"><span>管理</span></a></li>
            <li><a href="${base}/store/manager/auditList" ><span>开店申请</span></a></li>
            <li><a href="JavaScript:void(0);" class="current"><span>查看店铺</span></a></li>
        </ul>
    </div>
</div>
<div class="fixed-empty"></div>
<table border="0" cellpadding="0" cellspacing="0" class="store-joinin">
	<thead>
		<tr>
			<th colspan="20">公司及联系人信息</th>
		</tr>
	</thead>
	<tbody>
		<tr style="background: rgb(255, 255, 255);">
			<th class="w150">公司名称：</th>
			<td colspan="20">${storeJoinin.companyName}</td>
		</tr>
		<tr style="background: rgb(255, 255, 255);">
			<th>公司所在地：</th>
			<td>${storeJoinin.companyAddress}</td>
			<th>公司详细地址：</th>
			<td colspan="20">${storeJoinin.companyAddressDetail}</td>
		</tr>
		<tr style="background: rgb(255, 255, 255);">
			<th>公司电话：</th>
			<td>${storeJoinin.companyPhone}</td>
			<th>员工总数：</th>
			<td>${storeJoinin.companyEmployeeCount}&nbsp;人</td>
			<th>注册资金：</th>
			<td>${storeJoinin.companyRegisteredCapital}&nbsp;万元 </td>
		</tr>
		<tr style="background: rgb(255, 255, 255);">
			<th>联系人姓名：</th>
			<td>${storeJoinin.contactsName}</td>
			<th>联系人电话：</th>
			<td>${storeJoinin.contactsPhone}</td>
			<th>电子邮箱：</th>
			<td>${storeJoinin.contactsEmail}</td>
		</tr>
	</tbody>
</table>

<table border="0" cellpadding="0" cellspacing="0" class="store-joinin">
	<thead>
		<tr>
			<th colspan="20">营业执照信息（副本）</th>
		</tr>
	</thead>
	<tbody>
		<tr style="background: rgb(255, 255, 255);">
			<th class="w150">营业执照号：</th>
			<td>${storeJoinin.contactsEmail}</td>
		</tr>
		<tr style="background: rgb(255, 255, 255);">

			<th>营业执照所在地：</th>
			<td>${storeJoinin.businessLicenceAddress}</td>
		</tr>
		<tr style="background: rgb(255, 255, 255);">

			<th>营业执照有效期：</th>
			<td>
			<#if storeJoinin.businessLicenceStartStr??>
	                ${storeJoinin.businessLicenceStartStr?string("yyyy-MM-dd")}
            </#if>
            -
            <#if storeJoinin.businessLicenceEndStr??>
	                ${storeJoinin.businessLicenceEndStr?string("yyyy-MM-dd")}
            </#if>
			</td>
		</tr>
		<tr style="background: rgb(255, 255, 255);">
			<th>法定经营范围：</th>
			<td colspan="20">${storeJoinin.businessSphere}</td>
		</tr>
		<tr style="background: rgb(255, 255, 255);">
			<th>营业执照
				<br> 电子版：
			</th>
			<td colspan="20">
			   <a nctype="nyroModal"  href="${imgServer}${storeJoinin.businessLicenceNumberElectronic}">
	            	<img src="${imgServer}${storeJoinin.businessLicenceNumberElectronic}" alt="" />
	            </a>
			</td>
		</tr>
	</tbody>
</table>

<table border="0" cellpadding="0" cellspacing="0" class="store-joinin">
	<thead>
		<tr>
			<th colspan="20">组织机构代码证</th>
		</tr>
	</thead>
	<tbody>
		<tr style="background: rgb(255, 255, 255);">
			<th>组织机构代码：</th>
			<td colspan="20">${storeJoinin.organizationCode}</td>
		</tr>
		<tr style="background: rgb(255, 255, 255);">
			<th>组织机构代码证
				<br> 电子版：</th>
			<td colspan="20">
				<a nctype="nyroModal"  href="${imgServer}${storeJoinin.organizationCodeElectronic}">
	            	<img src="${imgServer}${storeJoinin.organizationCodeElectronic}" alt="" />
	            </a>
			</td>
		</tr>
	</tbody>
</table>

<table border="0" cellpadding="0" cellspacing="0" class="store-joinin">
	<thead>
		<tr>
			<th colspan="20">一般纳税人证明：</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th>一般纳税人证明：</th>
			<td colspan="20">
				<a nctype="nyroModal"  href="${imgServer}${storeJoinin.generalTaxpayer}">
	            	<img src="${imgServer}${storeJoinin.generalTaxpayer}" alt="" />
	            </a>
			</td>
		</tr>
	</tbody>
</table>

<table border="0" cellpadding="0" cellspacing="0" class="store-joinin">
	<thead>
		<tr>
			<th colspan="20">开户银行信息：</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th class="w150">银行开户名：</th>
			<td>${storeJoinin.bankAccountName}</td>
		</tr>
		<tr>
			<th>公司银行账号：</th>
			<td>${storeJoinin.bankAccountNumber}</td>
		</tr>
		<tr>
			<th>开户银行支行名称：</th>
			<td>${storeJoinin.bankName}</td>
		</tr>
		<tr>
			<th>支行联行号：</th>
			<td>${storeJoinin.bankCode}</td>
		</tr>
		<tr>
			<th>开户银行所在地：</th>
			<td colspan="20">${storeJoinin.bankAddress}</td>
		</tr>
		<tr>
			<th>开户银行许可证
				<br>电子版：</th>
			<td colspan="20">
				<a nctype="nyroModal"  href="${imgServer}${storeJoinin.bankLicenceElectronic}">
	            	<img src="${imgServer}${storeJoinin.bankLicenceElectronic}" alt="" />
	            </a>
			</td>
		</tr>
	</tbody>

</table>


<table border="0" cellpadding="0" cellspacing="0" class="store-joinin">
	<thead>
		<tr>
			<th colspan="20">税务登记证</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th class="w150">税务登记证号：</th>
			<td>${storeJoinin.taxRegistrationCertificate}</td>
		</tr>
		<tr>
			<th>纳税人识别号：</th>
			<td>${storeJoinin.taxpayerId}</td>
		</tr>
		<tr>
			<th>税务登记证号
				<br> 电子版：
			</th>
			<td>
				<a nctype="nyroModal"  href="${imgServer}${storeJoinin.taxRegistrationCertificateElectronic}">
	            	<img src="${imgServer}${storeJoinin.taxRegistrationCertificateElectronic}" alt="" />
	            </a>
			</td>
		</tr>
	</tbody>
</table>

<form id="form_store_verify" action="${base}/shopStoreJoinin/saveOrUpdate" method="post">
	<input id="verify_type" name="verify_type" type="hidden">
	<input name="memberId" type="hidden" value="${storeJoinin.memberId}">
	<table border="0" cellpadding="0" cellspacing="0" class="store-joinin">
		<thead>
			<tr>
				<th colspan="20">店铺经营信息</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th class="w150">卖家账号：</th>
				<td>${storeJoinin.sellerName}</td>
			</tr>
			<tr>
				<th class="w150">店铺名称：</th>
				<td>${storeJoinin.storeName}</td>
			</tr>
			<tr>
				<th>店铺等级：</th>
				<td>${storeJoinin.sgName}</td>
			</tr>
			<tr>
				<th class="w150">开店时长：</th>
				<td>${storeJoinin.joininYear}年</td>
			</tr>
			<tr>
				<th>店铺分类：</th>
				<td>${storeJoinin.scName}（开店保证金：${storeJoinin.scBail}元）</td>
			</tr>
		</tbody>
	</table>
	<table  border="0" cellpadding="0" cellspacing="0" class="store-joinin" id="checkstate">
        <thead>
	        <tr>
	            <th colspan="20">审核:</th>
	        </tr>
        </thead>
        <tbody>
	        <tr>
	        	<th>审核:</th>
	            <td class="vatop rowform onoff" rowspan="4">
		                <label for="store_state1" class="cb-enable selected" ><span>通过</span></label>
		                <label for="store_state0" class="cb-disable" ><span>失败</span></label>
		                <input id="store_state1" name="joininState" checked="checked"  onclick="$('#nopass2').hide();" value="20" type="radio"/>
		                <input id="store_state0" name="joininState" onclick="$('#nopass2').show();" value="30" type="radio"/>
	            </td>
	        </tr>
	        <tr class="noborder" id="nopass2" style="display: none;">
	            <th>未通过原因:</th>
	            <td class="vatop rowform"  colspan="4"><textarea name="joininMessage" rows="6" class="tarea" id="store_close_info"></textarea></td>
	        </tr>
       </tbody>
   </table>
        <a href="JavaScript:void(0);" class="btn" id="submitBtn" style="margin-left: 390px;"><span>提交</span></a>
</form>
</div>
</@layout.body>