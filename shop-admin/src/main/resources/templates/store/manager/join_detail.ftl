<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/jquery.edit.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery.nyroModal/custom.min.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/jquery.poshytip.min.js" charset="utf-8"></script>
<link href="${base}/res/js/jquery.nyroModal/styles/nyroModal.css" rel="stylesheet" type="text/css" id="cssfile2" />
<script type="text/javascript">
   /*  $(document).ready(function(){
        $('a[nctype="nyroModal"]').nyroModal();

        $('#btn_fail').on('click', function() {
            if($('#joinin_message').val() == '') {
                $('#validation_message').text('请输入审核意见');
                $('#validation_message').show();
                return false;
            } else {
                $('#validation_message').hide();
            }
            if(confirm('确认拒绝申请？')) {
                $('#verify_type').val('fail');
                $('#form_store_verify').submit();
            }
        });
        var commisRate = '';
        $('#btn_pass').on('click', function() {
            var valid = true;
            $('[nctype="commis_rate"]').each(function(commis_rate) {
                rate = $(this).val();
                if(rate == '') {
                    valid = false;
                    return false;
                }
                var rate = Number($(this).val());
                if(isNaN(rate) || rate< 0 || rate >= 100) {
                    valid = false;
                    return false;
                }else{
                    commisRate += rate + ",";
                }
            });
            if(valid) {
                $('#validation_message').hide();
                if(confirm('确认通过申请？')) {
                    $('#verify_type').val('pass');
                    $("#commisRate").val(commisRate.substring(0,commisRate.length-1));
                    $('#form_store_verify').submit();
                }
            } else {
                $('#validation_message').text('请正确填写分佣比例');
                $('#validation_message').show();
            }
        });
    }); */
    $(function(){
	    $("#submitBtn").click(function(){
	            $("#form_store_verify").submit();
	    });
	    var storeState=$("#storeState").val();
	    if(storeState!=null&&storeState!=2){
	       $("#checkstate").hide();
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
    <tr>
        <th>公司名称：</th>
        <td>
           ${storeJoinin.storeName}
           <input type="hidden"  id="storeState" value="${storeJoinin.storeState}" />
        </td>
        <th>账号：</th>
        <td colspan="20">${storeJoinin.memberName}</td>
    </tr>
    <tr>
        <th>公司所在地：</th>
        <td>${storeJoinin.areaInfo}</td>
        <th>公司详细地址：</th>
        <td colspan="20">${storeJoinin.storeAddress}</td>
    </tr>
    <tr>
        <th>联系电话：</th>
        <td>${storeJoinin.storeTel}</td>
        <th>邮政编码：</th>
        <td>${storeJoinin.storeZip}</td>
        <#--
        <th>注册资金：</th>
        <td>${storeJoinin.companyRegisteredCapital}&nbsp;万元 </td>
        -->
    </tr>
    <#--
    <tr>
        <th>联系人姓名：</th>
        <td>${storeJoinin.contactsName}</td>
        <th>联系人电话：</th>
        <td>${storeJoinin.contactsPhone}</td>
        <th>电子邮箱：</th>
        <td>${storeJoinin.contactsEmail}</td>
    </tr>
    -->
    </tbody>
</table>
<table border="0" cellpadding="0" cellspacing="0" class="store-joinin">
    <thead>
    <tr>
        <th colspan="20">营业执照信息（副本）</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <th>营业执照号<br />
            电子版：</th>
        <td colspan="20">
            <a nctype="nyroModal"  href="${imgServer}${storeJoinin.storeImage1}">
            <img src="${imgServer}${storeJoinin.storeImage1}" alt="" /> </a>
        </td>
    </tr>
    </tbody>
</table>



<form id="form_store_verify" action="${base}/store/manager/verify" method="post">
   <#-- <input id="verify_type" name="verifyType" type="hidden" value="3"/>-->
    <input name="memberId" type="hidden" value="${storeJoinin.memberId}" />
    <input name="storeId" id="storeId" type="hidden" value="${storeJoinin.storeId}"/>
    <input name="storeClassCommisRates" type="hidden" id="commisRate" />
    <table border="0" cellpadding="0" cellspacing="0" class="store-joinin">
        <thead>
        <tr>
            <th colspan="20">店铺经营信息</th>
        </tr>
        </thead>
        <tbody>
       <#--  <tr>
            <th class="w150">卖家帐号：</th>
            <td>${storeJoinin.sellerName}</td>
        </tr> -->
        <tr>
            <th class="w150">店铺名称：</th>
            <td>${storeJoinin.storeName}</td>
        </tr>
        <tr>
            <th>店铺等级：</th>
            <td>${storeJoinin.gradename}</td>
        </tr>
        <tr>
            <th>主营商品：</th>
            <td>${storeJoinin.storeZy}</td>
        </tr>
        <tr>
            <th>店铺分类：</th>
            <td>${storeJoinin.storeclassname}</td>
        </tr>
        <tr>
            <th>身份证号：</th>
            <td>${storeJoinin.storeOwnerCard}</td>
        </tr>
         <tr>
	        <th>身份证电子版：</th>
	        <td colspan="20">
	            <a nctype="nyroModal"  href="${imgServer}${storeJoinin.storeImage}">
	            <img src="${imgServer}${storeJoinin.storeImage}" alt="" /> </a>
	        </td>
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
		                <input id="store_state1" name="storeState" checked="checked"  onclick="$('#nopass2').hide();" value="1" type="radio"/>
		                <input id="store_state0" name="storeState" onclick="$('#nopass2').show();" value="0" type="radio"/>
	            </td>
	        </tr>
	        <tr class="noborder" id="nopass2" style="display: none;">
	            <th>未通过原因:</th>
	            <td class="vatop rowform"  colspan="4"><textarea name="storeCloseInfo" rows="6" class="tarea" id="store_close_info"></textarea></td>
	        </tr>
       </tbody>
   </table>
        <a href="JavaScript:void(0);" class="btn" id="submitBtn" style="margin-left: 390px;"><span>提交</span></a>
</form>
</div>
</@layout.body>