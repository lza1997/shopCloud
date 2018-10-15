<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css">
<link href="${base}/res/css/member.css" rel="stylesheet" type="text/css">
<link href="${base}/res/css/base.css" rel="stylesheet" type="text/css">
<link href="${base}/res/css/member_user.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${base}/res/js/jquery.js"></script>
<script type="text/javascript" src="${base}/res/js/layer/layer.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery.validation.min.js"></script>
<script type="text/javascript" src="${base}/res/js/common_lm.js"></script>
<script type="text/javascript" src="${base}/res/js/ajaxfileupload/ajaxfileupload.js"></script>
<script type="text/javascript" src="${base}/res/js/My97DatePicker/WdatePicker.js" charset="utf-8"></script>
<style>
	input.hasDatepicker {
	    width: 125px !important;
	}
	
	input.text {
		font-family: Tahoma;
	  	width: 150px;
	  	height: 20px;
	  	line-height: 20px;
	  	background-color: #FFF;
	  	padding: 3px!important;
	  	border: solid 1px;
	  	border-color: #BBB;
	}
	
</style>
<div class="eject_con" style="width:500px;">
	<div id="warning"></div>
	<form method="post" action="#" id="coupon_form">
		<input name="couponId" value="${coupon.couponId}" type="hidden">
		<dl>
			<dt class="required">
				<em class="pngFix"></em>优惠券名称：
			</dt>
			<dd>
				<input class="w300 text" name="couponTitle" value="${coupon.couponTitle}" type="text">
			</dd>
		</dl>
		<dl>
			<dt class="required">
				<em class="pngFix"></em>限制金额(元)：
			</dt>
			<dd>
				<input class="text w300 mr5" name="couponLimit" value="${coupon.couponLimit}" type="text" >
			</dd>
		</dl>
		<dl>
			<dt class="required">
				<em class="pngFix"></em>优惠金额(元)：
			</dt>
			<dd>
				<input class="text w300 mr5" name="couponPrice" value="${coupon.couponPrice}" type="text">
			</dd>
		</dl>
		<dl>
			<dt class="required">
				<em class="pngFix"></em>优惠券数量：
			</dt>
			<dd>
				<input class="text w300 mr5" name="couponstorage" value="${coupon.couponstorage}" type="text">
			</dd>
		</dl>
		<dl>
			<dt class="required">
				<em class="pngFix"></em>优惠券分类：
			</dt>
			<dd>
				<select name="couponClassId">
					<#list classlist as class>
						<option value="${class.classId}">${class.className}</option>
					</#list>
				</select>
			</dd>
		</dl>
		<dl>
			<dt class="required">
				<em class="pngFix"></em>商品分类：
			</dt>
			<dd>
				<select name="couponGoodsClassId">
					<#list goodsClassList as goodsClass>
						<option value="${goodsClass.gcId}">${goodsClass.gcName}</option>
					</#list>
				</select>
			</dd>
		</dl>
		<dl>
	        <dt class="required"><em class="pngFix"></em>优惠券图片：</dt>
	        <dd>
	        	<#if coupon.couponPic ?? && coupon.couponPic !=''>
	            	<input type="hidden" id="couponPic" name="couponPic" value="${imgServer}${coupon.couponPic}" />
	            <#else>
	            	<input type="hidden" id="couponPic" name="couponPic" value="" />
	            </#if>
	            <p>
		            <span class="sign">
		            	 <#if coupon.couponPic ?? && coupon.couponPic !=''>
			             	<img src="${imgServer}${coupon.couponPic}"   id="storeCoupon" nc_type="logo1" width="88" height="44"/>
			             <#else>
			                <img src="${base}/images/member/default.gif" id="storeCoupon" nc_type="logo1" width="88" height="44"/>
			             </#if>
		           		 
		            </span>
	            </p>
	            <p><input type="file" hidefocus="true" nc_type="logo" name="files" id="coupon_pic" onChange="ajaxFileUploads('coupon_pic','storeCoupon','couponPic');"></p>
	            <span class="errorMsg" id="vat_brandPic"></span>
	        </dd>
      	</dl>
		<dl>
			<dt class="required">
				<em class="pngFix"></em>开始日期：
			</dt>
			<p>
				<input class="text hasDatepicker" name="couponStartDate" 
					   onFocus="WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd',minDate:'%y-%M-%d',maxDate:'#F{$dp.$D(\'couponEndDate\')}',alwaysUseStartDate:true})"
					   id="couponStartDate" readonly="readonly" type="text" value="${coupon.startTimeStr}"> 
			</p>
			

		</dl>
		<dl>
			<dt class="required">
				<em class="pngFix"></em>截止日期：
			</dt>
			<p>
				<input class="text hasDatepicker" name="couponEndDate" onFocus="WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'couponStartDate\')}',alwaysUseStartDate:true})"
					id="couponEndDate" readonly="readonly" type="text" value="${coupon.endTimeStr}">
			</p>
		</dl>
		
		<dl>
			<dt>使用条件：</dt>
			<dd>
				<textarea class="w300" name="couponDesc" rows="3">${coupon.couponDesc}</textarea>
			</dd>
		</dl>
		<dl class="bottom">
			<dt>&nbsp;</dt>
			<dd>
				<p>
					<input class="submit" id="addcoupon" value="提交" type="button">
				</p>
			</dd>
		</dl>
	</form>
</div>
<script>
$(function(){
	formValidate();
});

var formValidate = function(){
	$('#coupon_form').validate({
	    errorPlacement: function(error, element){
	        $(element).next('.field_notice').hide();
	        $(element).after(error);
	    },
	    rules : {
	    	couponTitle : {
	            required	: true,
	            minlength 	: 3,
	            maxlength	: 50
	        },
	        couponLimit : {	
				required   : true,
	            number     : true,
	            min        : 0,
	            digits     :true                
	        },
	        couponPrice : {
	            required   : true,
	            number     : true,
	            min        : 0,
	            digits     :true         
	        },
	        couponPic : {
	            required	: true
	        },
	        couponStartDate : {
	            required	: true
	        },
	        couponEndDate : {
	            required	: true
	        },
	        couponstorage : {
	            required	: true,
	            number      : true,
	            min         : 0,
	            digits     :true         
	        }
	        
	    },
	    messages : {
	    	couponTitle  : {
	            required	: '名称不能为空',
	            minlength 	: '名称长度至少3个字符，最长50个汉字',
	            maxlength 	: '名称长度至少3个字符，最长50个汉字'
	        },
	        couponLimit : {
				required	: '限制金额不能为空',
	            number  	: '限制金额只能是数字',
	            min			: '限制金额最小值为0',
	            digits      : '请输入整数'  
	        },
	        couponPrice  : {
	        	required	: '优惠金额不能为空',
	            number  	: '优惠金额只能是数字',
	            min			: '优惠金额最小值为0',
	            digits      : '请输入整数'  
	        },
	        couponPic  : {
	            required	: '优惠券图片不能为空'
	        }, 
	        couponStartDate  : {
	            required	: '优惠券开始时间不能为空'
	        },
	        couponEndDate  : {
	            required	: '优惠券截止时间不能为空'
	         
	        },
	        couponstorage  : {
	        	required	: '优惠券数量不能为空',
	            number  	: '优惠券数量只能是数字',
	            min			: '优惠券数量最小值为0',
	            digits      : '请输入整数'  
	        }
	    }
	});
}

$('#addcoupon').on('click', function(){
	if($('#coupon_form').valid()){
		var data = $("#coupon_form").serialize();
		$.ajax({
             type: "post",
             url: "${base}/platform/coupon/saveOrUpdate",
             data: data,
             dataType: "json",
			 async:false,
			 success:function(data) {
				if(data.success){
				 	parent.layer.alert(data.msg,{icon:1},function(){
				 		parent.location.reload();
					});
				}else{
					parent.layer.alert(data.msg,{icon:2},function(){
						parent.location.reload();
					});
				}
			}
         }); 
	}
});	

//上传图片
function ajaxFileUploads(myBlogImage,imgId,img){
    $.ajaxFileUpload({
        //处理文件上传操作的服务器端地址(可以传参数,已亲测可用)
        url: '${base}/platform/coupon/fileUpload',
        secureuri:false,                      //是否启用安全提交,默认为false
        fileElementId:myBlogImage,           //文件选择框的id属性
        dataType:'json',                       //服务器返回的格式,可以是json或xml等
        fileSize:5120000,
		allowType:'jpg,jpeg,png,JPG,JPEG,PNG',
        success:function(data, status){        //服务器响应成功时的处理函数
            if( true == data.success){     //0表示上传成功(后跟上传后的文件路径),1表示失败(后跟失败描述)
               $("img[id='"+imgId+"']").attr("src", "${imgServer}"+data.result);
               $("#"+img).val(data.result);
            }
        },
        error:function(data, status, e){ //服务器响应失败时的处理函数
        	 layer.msg('图片上传失败，请重试！！', {icon:2}); 
        }
    });
}

	
</script>