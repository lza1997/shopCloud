<link href="${base}/res/css/base.css" rel="stylesheet" type="text/css">
<link href="${base}/res/css/member.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${base}/res/js/jquery.js"></script>
<script src="${base}/res/js/area.js" charset="utf-8"></script>
<script type="text/javascript">
	var APP_BASE = '${base}';
</script>
<div id="fwin_my_address_add" class="dialog_wrapper ui-draggable" style="z-index: 1100; position: absolute; width: 550px; top: 38px;">
    <div class="dialog_body" style="position: relative;">
        <div class="dialog_content" style="margin: 0px; padding: 0px;">
            <div class="eject_con">
                <div class="adds">
                    <form method="post" action="" id="daddress_form" target="_parent">
                        <input type="hidden" name="storeId" value="${storeId}" />
                        <input type="hidden" name="addressId" value="${daddress.addressId}" />
                        <dl>
                            <dt class="required"><em class="pngFix"></em>联系人：</dt>
                            <dd>
                                <p>
                                    <input type="text" class="text" id="sellerName" name="sellerName" value="${daddress.sellerName}">
                                </p>

                                <p class="hint">请填写您的真实姓名</p>
                            </dd>
                        </dl>
                        <dl>
                            <dt class="required"><em class="pngFix"></em>所在地区：</dt>
                            <dd>
                                <div id="region">
                                	<input id="city_id" type="hidden" name="cityId" value="">
									<input id="area_id" class="area_ids" type="hidden" name="areaId" value="">
									<input id="area_info" class="area_names" type="hidden" name="areaInfo" value="">
                                    <span id="spanarea">
							        	<select name="provinceId" class="select" id="area">
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
                                </div>
                            </dd>
                        </dl>
                        <dl>
                            <dt class="required"><em class="pngFix"></em>街道地址：</dt>
                            <dd>
                                <p>
                                    <input class="text w300" type="text" name="address" id="address" value="${daddress.address}">
                                </p>

                                <p class="hint">不必重复填写地区</p>
                            </dd>
                        </dl>
                        <dl>
                            <dt>邮编：</dt>
                            <dd>
                                <input type="text" class="text valid" name="zipCode" id="zipCode" maxlength="6" value="${daddress.zipCode}">
                            </dd>
                        </dl>
                        <dl>
                            <dt class="required"><em class="pngFix"></em>电话号码：</dt>
                            <dd>
                                <p>
                                    <input type="text" class="text" name="telPhone" id="telPhone" value="${daddress.telPhone}">
                                </p>

                                <p class="hint">区号 - 电话号码 - 分机</p>
                            </dd>
                        </dl>
                        <dl>
                            <dt class="required"><em class="pngFix"></em>手机号码：</dt>
                            <dd>
                                <input type="text" class="text" name="mobPhone" id="mobPhone" value="${daddress.mobPhone}">
                            </dd>
                        </dl>
                        <dl>
                            <dt class="required"><em class="pngFix"></em>公司：</dt>
                            <dd>
                                <input type="text" class="text" name="company" id="company" value="${daddress.company}">
                            </dd>
                        </dl>
                        <dl>
                            <dt class="required"><em class="pngFix"></em>备注：</dt>
                            <dd>
                                <input type="text" class="text" name="content" id="content" value="${daddress.content}">
                            </dd>
                        </dl>
                        <dl>
                        	<dt></dt>
                        	<dd><span id="errmsg" style="color: red"></span></dd>
                        </dl>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
	$(function(){
		init_area('${daddress.provinceId}','${daddress.cityId}','${daddress.areaId}');
		$('#sellerName').blur(function(){
			if($(this).val()== ''){
				$('#errmsg').html('联系人不能为空');
			}else{
				$('#errmsg').html('');
			}
		});
		$('#mobPhone').blur(function(){
			if($(this).val()==''){
            	$('#errmsg').html('手机号填写不正确');
           	}else{
               	var mobileexp = /^1\d{10}$/;
               	if(!mobileexp.test($(this).val())){
               		$('#errmsg').html('手机号填写不正确');
               	}else{
               		$('#errmsg').html('');
               	} 
            }
		});
		$('#area').blur(function(){
			if($(this).val()== ''){
				$('#errmsg').html('请选择省份');
			}else{
				$('#errmsg').html('');
			}
		});
		$('#city').blur(function(){
			if($(this).val()== ''){
				$('#errmsg').html('请选择城市');
			}else{
				$('#errmsg').html('');
			}
		});
		$('#qu').blur(function(){
			if($(this).val()== ''){
				$('#errmsg').html('请选择区');
			}else{
				$('#errmsg').html('');
			}
		});
		$('#address').blur(function(){
			if($(this).val()== ''){
				$('#errmsg').html('请填写详细地址');
			}else{
				$('#errmsg').html('');
			}
		});
		$('#zipCode').blur(function(){
			if($(this).val()== ''){
				$('#errmsg').html('请正确填写邮编');
			}else{
				$('#errmsg').html('');
			}
		});
		$('#company').blur(function(){
			if($(this).val()== ''){
				$('#errmsg').html('请填写公司名称');
			}else{
				$('#errmsg').html('');
			}
		});
		$('#content').blur(function(){
			if($(this).val()== ''){
				$('#errmsg').html('请填写备注');
			}else{
				$('#errmsg').html('');
			}
		});
		
	});
</script>