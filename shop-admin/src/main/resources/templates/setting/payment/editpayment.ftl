<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/ajaxfileupload/ajaxfileupload.js"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>支付方式</h3>
            <ul class="tab-base"><li><a class="current"><span>支付方式</span></a></li>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form id="post_form" method="post" name="form1" action="${base}/setting/payment/saveOrUpdate">
        <input type="hidden" name="paymentId" value="${dbpayment.paymentId}" />
        <table class="table tb-type2 nobdb">
            <tbody>
            <tr class="noborder">
                <td class="vatop rowform">${dbpayment.paymentName}</td>
                <td class="vatop tips"></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform">${dbpayment.paymentCode}</td>
                <td class="vatop tips"></td>
            </tr>
            <tr>
                <td colspan="2" class="required">启用: </td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform onoff"><label for="payment_state1" class="cb-enable <#if dbpayment.paymentState == '1'>selected</#if>" ><span>是</span></label>
                    <label for="payment_state2" class="cb-disable <#if dbpayment.paymentState == '0'>selected</#if>" ><span>否</span></label>
                    <input type="radio" <#if dbpayment.paymentState == '1'>checked="checked"</#if> value="1" name="paymentState" id="payment_state1">
                    <input type="radio" <#if dbpayment.paymentState == '0'>checked="checked"</#if> value="0" name="paymentState" id="payment_state2"></td>
                <td class="vatop tips"></td>
            </tr>
             <tr>
                <td colspan="2" class="required">支付图标:</td>
            </tr>
            <tr class="noborder">
                  <td>
                        <div class="logo clf" > 
                              <a href="javascript:void(0);" class="btn-upload btng-s" style="background-color:#eee; color:#000; cursor:pointer;">
                                 <input type="file" class="file" name="files" id="myBlogImage0" onChange="ajaxFileUploads('myBlogImage0','paymentLogoimg','paymentLogo');" />
                              </a>
                                   <img  src=" <#if dbpayment.paymentLogo ??&& dbpayment.paymentLogo!=''>${imgServer}${dbpayment.paymentLogo} <#else>${base}/images/nopic.png</#if>" width="100px" height="100px" id="paymentLogoimg" class="img">
			            </div>
			            <input type="hidden" id="paymentLogo"  name="paymentLogo" value="${dbpayment.paymentLogo}" />
                 </td>
                <td class="vatop tips">支持格式gif,jpg,jpeg,png</td>
            </tr>
            </tbody>
            <tfoot>
            <tr class="tfoot">
                <td colspan="15"><a href="JavaScript:void(0);" class="btn" id="submitBtn"
                                    onclick="document.form1.submit()"><span>提交</span></a> <a
                        href="${base}/setting/payment/list" class="btn"><span>返回</span></a></td>
            </tr>
            </tfoot>
        </table>
    </form>
</div>
<script>
     //上传图片
	function ajaxFileUploads(myBlogImage,imgId,img){
	    $.ajaxFileUpload({
	        //处理文件上传操作的服务器端地址(可以传参数,已亲测可用)
	        url:'${base}/setting/payment/fileUpload',
	        secureuri:false,                       //是否启用安全提交,默认为false
	        fileElementId:myBlogImage,           //文件选择框的id属性
	        dataType:'json',                       //服务器返回的格式,可以是json或xml等
	        fileSize:5120000,
	        allowType:'jpg,jpeg,png,JPG,JPEG,PNG',
	        success:function(data, status){        //服务器响应成功时的处理函数
	            if( true == data.success){     //0表示上传成功(后跟上传后的文件路径),1表示失败(后跟失败描述)
	            	//alert(data.result);
	               $("img[id='"+imgId+"']").attr("src", "${imgServer}"+data.result);
	               $("#"+img).val(data.result);
	            }
	        },
	        error:function(data, status, e){ //服务器响应失败时的处理函数
	        	layer.msg('图片上传失败，请重试！！', 1, 8);
	            //$('#result').html('图片上传失败，请重试！！');
	        }
	    });
	}
</script>
</@layout.body>