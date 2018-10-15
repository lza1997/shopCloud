<link href="${base}/res/css/base.css" rel="stylesheet" type="text/css">
<link href="${base}/res/css/member.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${base}/res/js/jquery.js"></script>
<div id="fwin_my_address_add" class="dialog_wrapper ui-draggable" style="z-index: 1100; position: absolute; width: 550px; top: 38px;">
    <div class="dialog_body" style="position: relative;">
        <div class="dialog_content" style="margin: 0px; padding: 0px;">
        	<div class="eject_con">
			  <div class="adds" style=" min-height:240px;">
			    <table class="ncu-table-style">
			      <thead>
			        <tr>
			          <th class="w80">联系人</th>
			          <th>发货地址</th>
			          <th class="w60">邮编</th>
			          <th class="w100">座机</th>
			          <th class="w100">手机</th>
			          <th class="w80">操作</th>
			        </tr>
			      </thead>
			      	<tbody>
			      		<#if daddressList??>
			      			<#list daddressList as daddress>
					        	<tr class="bd-line">
					        	  <input name="addressId" value="${daddress.addressId}" type="hidden" />
					        	  <input name="sellerName" value="${daddress.sellerName}" type="hidden" />
					        	  <input name="areaInfo" value="${daddress.areaInfo}" type="hidden" />
					        	  <input name="address" value="${daddress.address}" type="hidden" />
					        	  <input name="zipCode" value="${daddress.zipCode}" type="hidden" />
					        	  <input name="telPhone" value="${daddress.telPhone}" type="hidden" />
					        	  <input name="mobPhone" value="${daddress.mobPhone}" type="hidden" />
						          <td class="tc">${daddress.sellerName}</td>
						          <td>${daddress.areaInfo}&nbsp;${daddress.address}</td>
						          <td class="tc">${daddress.zipCode}</td>
						          <td class="tc">${daddress.telPhone}</td>
						          <td class="tc">${daddress.mobPhone}</td>
						          <td class="tc"><a href="javascript:void(0);" class="ncu-btn2" onclick="addDaddress(this)">选择</a></td>
					        	</tr>
			      			</#list>
			      		</#if>
			      	</tbody>
			     </table>
			  </div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	function addDaddress(obj){
		var tr = $(obj).parent().parent();
		var addressId = $(tr).find("input[name='addressId']").val(); //发货地址id
		var sellerName = $(tr).find("input[name='sellerName']").val(); //联系人
		var areaInfo = $(tr).find("input[name='areaInfo']").val(); //收货地区
		var address = $(tr).find("input[name='address']").val(); //街道地址
		var zipCode = $(tr).find("input[name='zipCode']").val(); //邮编
		var telPhone = $(tr).find("input[name='telPhone']").val(); //座机
		var mobPhone = $(tr).find("input[name='mobPhone']").val(); //手机
		
		var daddress = areaInfo+" "+address+" "+sellerName+" "+telPhone+" "+mobPhone;
		parent.$('#daddresDiv').text(daddress); 
		parent.$('#daddressId').val(addressId); 
		parent.layer.closeAll();
	} 
</script>