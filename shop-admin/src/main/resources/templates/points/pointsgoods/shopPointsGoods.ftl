<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/ajaxfileupload/ajaxfileupload.js"></script>
<script type="text/javascript" src="${base}/res/js/My97DatePicker/WdatePicker.js" charset="utf-8"></script>
<script type="text/javascript" charset="utf-8" src="${base}/res/js/area.js"></script>
<script src="${base}/res/js/layer/layer.js"></script>
<link rel="stylesheet" href="${base}/res/js/kindeditor/themes/default/default.css" />
<script charset="utf-8" src="${base}/res/js/kindeditor/kindeditor.js"></script>
<script charset="utf-8" src="${base}/res/js/kindeditor/plugins/code/prettify.js"></script>
<script charset="utf-8" src="${base}/res/js/kindeditor/lang/zh_CN.js"></script>
<script type="text/javascript" src="${base}/res/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
    $(function (){
        KindEditor.ready(function(K) {
            var editor1 = K.create("textarea[name='pointsGoodsBody']", {
                uploadJson : APP_BASE+'/kind/upload',
                afterCreate : function() {
                    var self = this;
                },
                afterBlur: function(){this.sync();}
            });
        });
        
        $('#shopPointsGoods_form').validate({
            errorPlacement: function(error, element){
            $(element).next('.field_notice').hide();
            $(element).after(error);
        },
        rules : {
            pointsGoodsName : {
                required	: true,
                minlength 	: 3,
                maxlength	: 50
            },
            pointsGoodsStorePrice : {	
				required   : true,
                number     : true,
                min        : 0.01,
                max		   : 1000000
            },
            pointsnums : {	
				required   : true,
                number     : true,
                min        : 1,
                max		   : 1000000
            },
            pointsGoodsSerial : {	
				/* required   : true,
                min        : 1,
                max		   : 1000000 */
                minlength 	: 3,
                maxlength	: 20
            },
            pointsGoodsStorage : {	
				required   : true,
                min        : 1,
                max		   : 1000000
            },
            exchangeCount : {
            	number : true,
            	digits : true,
            	min : 0,
            	max : 1000
            }
        },
        messages : {
            pointsGoodsName  : {
                required	: '礼品名称不能为空',
                minlength 	: '商品标题名称长度至少3个字符，最长50个汉字',
                maxlength 	: '商品标题名称长度至少3个字符，最长50个汉字'
            },
            pointsGoodsStorePrice : {
				required: '礼品原价不能为空',
                number     : '商品价格只能是数字',
                min		   : '商品价格必须是0.01~1000000之间的数字',
                max		   : '商品价格必须是0.01~1000000之间的数字'
            },
            pointsnums : {	
				required   : '所需积分不为空',
                number     : '只能数字',
                min        : '数字不合法',
                max		   : '数字不合法'
            },
            pointsGoodsSerial : {	
  				/* required   : '礼品编号不为空',
                min        : '数字不合法',
                max		   : '数字不合法' */
                minlength 	: '编号不能小于3位',
                maxlength	: '编号不能大于20位'
            }, pointsGoodsStorage : {	
				required   : '库存不为空',
                min        : '数字不合法',
                max		   : '数字不合法'
            },
            exchangeCount :{
            	number : ' 商品兑换数量只能是正整数',
            	digits : ' 商品兑换数量只能是正整数',
            	min : ' 商品兑换数量只能是正整数',
            	max : ' 数字不合法'
            }
        }
    });
    
});

    function onsubmitBefore(){
   		$("textarea[name='pointsGoodsBody']").val($("textarea[name='pointsGoodsBody']").val());
    }

    
</script>
</@layout.head>
<@layout.body>
<div class="page">
<div class="fixed-bar">
    <div class="item-title">
        <h3>积分商品表管理</h3>
        <ul class="tab-base">
            <li><a href="${base}/shopPointsGoods/list"><span>管理</span></a></li>
            <li><a href="javascript:void(0)" class="current"><span>新增</span></a></li>
        </ul>
    </div>
</div>
<div class="fixed-empty"></div>
<form id="shopPointsGoods_form" action="${base}/shopPointsGoods/saveOrUpdate" method="post" onsubmit="onsubmitBefore()">
    <input type="hidden" name="id" value="${shopPointsGoods.id}">
    <table class="table tb-type2">
        <tbody>
      		<tr><td colspan="4"  style="background:#f3fbfe"><h5>积分商品表管理</h5></td></tr>
        <tr><td rowspan="9"  align="center" >
        	<div style="height: 330px;text-align:center" align="center" id="photoView01">
        		<#if shopPointsGoods.pointsGoodsImage??&&shopPointsGoods.pointsGoodsImage!=''>
        			<img  src="${imgServer}${shopPointsGoods.pointsGoodsImage}" width="306px" height="330px"/>
        		<#else>
	                <img  src="${base}/res/images/default_goods_image.gif" width="306px" height="330px"/>	
        		</#if>
			</div>
        		 <a href="javascript:void(0);" style="line-height:22px; height:22px; padding:0 11px; background:#3366CC; color:#fff; position:relative; margin-right:20px;">
								本地上传
					<input type="file" onChange="ajaxTypeImageUploads('pointsGoodsImagefile','photo')" style="opacity:0; top:0; left:0; width:100%; height:100%; margin:0; position:absolute;" id="pointsGoodsImagefile" name="myfiles"  class="file" multiple="multiple"/>
					<input  type="hidden" name="pointsGoodsImage"  id="pointsGoodsImage" value="${shopPointsGoods.pointsGoodsImage}"/>
				</a>
        </td>
        </tr>
			<tr>
	            <td colspan="2" class="required" ><label for="pointsGoodsName" class="validation">商品名称:</label></td>
	        </tr>
			<tr class="noborder">
	            <td class="vatop rowform"><input type="text" class="txt" value="${shopPointsGoods.pointsGoodsName}" name="pointsGoodsName" id="pointsGoodsName"></td>
	           	<td class="vatop tips"></td>
	        </tr>
	        <tr>
	            <td colspan="2" class="required" ><label for="pointsGoodsStorePrice" class="validation">礼品原价:</label></td>
	        </tr>
			<tr class="noborder">
	            <td class="vatop rowform"><input type="text" class="txt" value="${shopPointsGoods.pointsGoodsStorePrice}" name="pointsGoodsStorePrice" id="pointsGoodsStorePrice"></td>
	           	<td class="vatop tips"></td>
	        </tr>
	        <tr>
	            <td colspan="2" class="required" ><label for="pointsnums" class="validation">所需积分:</label></td>
	        </tr>
			<tr class="noborder">
	            <td class="vatop rowform"><input type="text" class="txt" value="${shopPointsGoods.pointsnums}" name="pointsnums" id="pointsnums"></td>
	           	<td class="vatop tips"></td>
	        </tr>
	        <tr >
	            <td colspan="2" class="required" ><label for="pointsGoodsStorage" class="validation">库存:</label></td>
	        </tr>
			<tr class="noborder">
	            <td class="vatop rowform"><input type="text" class="txt" value="${shopPointsGoods.pointsGoodsStorage}" name="pointsGoodsStorage" id="pointsGoodsStorage"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr >
	            <td class="required" ><label for="pointsGoodsSerial" class="validation">礼品编号:</label></td>
	            <td  class="required" ><label for="pointsGoodsSubtitle" class="validation">礼品标签:</label></td>
	        </tr>
	        <tr class="noborder">
	            <td class="vatop rowform" ><input type="text" class="txt" value="${shopPointsGoods.pointsGoodsSerial}" name="pointsGoodsSerial" id="pointsGoodsSerial" style="width: 251px;"></td>
	            <td  class="vatop rowform" ><input type="text" class="txt" value="${shopPointsGoods.pointsGoodsSubtitle}" name="pointsGoodsSubtitle" id="pointsGoodsSubtitle"></td>
	        </tr>
	        
        	<tr><td colspan="4"  style="background:#f3fbfe"><h5>兑换要求</h5></td></tr>
			
			<tr>
	            <td colspan="2" class="" ><label for="limitcount" class="validation">限制每会员兑换数量:</label></td>
	        </tr>
			<tr class="noborder" >
	            <td class="vatop rowform"  colspan="2"><input type="radio" id="numbercklimit" value="1" name="limitcount" checked onclick="limitcountfunc(this)"/>限制 <input type="radio" <#if shopPointsGoods.exchangeCount=='' > checked </#if>  value="0"   onclick="limitcountfunc(this)"  name="limitcount" >不限制</td>
	        </tr>
			<tr name="limitcountcontent" <#if shopPointsGoods.exchangeCount=='' > style="display:none" </#if>>
	            <td colspan="2" class="" ><label for="exchangeCount" class="validation">每个会员可以兑换该商品的数量:</label></td>
	        </tr>
			<tr class="noborder" name="limitcountcontent" <#if shopPointsGoods.exchangeCount=='' > style="display:none" </#if>>
	            <td class="vatop rowform"><input type="text" class="txt" value="${shopPointsGoods.exchangeCount}" name="exchangeCount" id="exchangeCount">&nbsp;&nbsp;</td>
	           	<td class="vatop tips"></td>
	        </tr>
	        <tr>
	            <td colspan="2" class="" ><label for="limitdate" class="validation">限制兑换时间:</label></td>
	        </tr>
			<tr class="noborder">
	            <td class="vatop rowform"  colspan="2" id="limitdate">
	            	<input type="radio" id="datecklimit"  value="1" name="limitdate" checked onclick="limitdatefunc(this)" >限制 
	            	<input type="radio"  value="0"  onclick="limitdatefunc(this)"  <#if pointsGoodsStarttimestr==''|| pointsGoodsEndtimestr=='' > checked </#if>    name="limitdate" >不限制
	            </td>
	        </tr>
	        <tr name="limitdatecontent" <#if pointsGoodsStarttimestr==''|| pointsGoodsEndtimestr=='' >style="display:none" </#if>>
	            <td class="" ><label for="pointsGoodsStarttimestr" class="validation">兑换开始时间:</label></td>
                 <td  class="" ><label for="pointsGoodsEndtimestr" class="validation">兑换结束时间:</label></td>
	        </tr>
			<tr class="noborder" name="limitdatecontent"  <#if pointsGoodsStarttimestr==''|| pointsGoodsEndtimestr=='' >style="display:none" </#if>>
	            <td class="vatop rowform">
	           <!-- <input onClick="WdatePicker({dateFmt:'yyyy-MM-dd'});" disabled="disabled"  type="text" class="txt" value="${shopPointsGoods.pointsGoodsStarttime}" name="pointsGoodsStarttime" id="pointsGoodsStarttime">-->
	             <input type="text" class="txt date"  value="${pointsGoodsStarttimestr}" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'pointsGoodsEndtime\')}'});" name="pointsGoodsStarttimestr" id="pointsGoodsStarttime" /> 
	            </td>
	             <td class="vatop rowform">
	           <!-- <input type="text" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'});" disabled="disabled" class="txt" value="${shopPointsGoods.pointsGoodsEndtime}" name="pointsGoodsEndtime" id="pointsGoodsEndtime">-->
    	        <input type="text" class="txt date" value="${pointsGoodsEndtimestr}" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'pointsGoodsStarttime\')}'});" name="pointsGoodsEndtimestr" id="pointsGoodsEndtime" />
	            </td>
	        </tr>
	        <tr>
	            <td colspan="2" class="" ><label for="memberGradeId" class="validation">限制参与兑换的会员级别:</label></td>
	        </tr>
			<tr class="noborder">
	            <td class="vatop rowform">
	            <select  name="memberGradeId" id="memberGradeId">
		            <#list gradeList as memberGrade>
		            	<option value="${memberGrade.gradeId}" <#if memberGrade.gradeId == shopPointsGoods.memberGradeId >selected </#if> >${memberGrade.gradeName}</option>
					</#list>
	            </select>
	            </td>
	           	<td class="vatop tips">当会员兑换积分商品时，需要达到该级别或者以上级别后才能参与兑换</td>
	        </tr>
	        
	        
	         	<tr><td colspan="4"  style="background:#f3fbfe"><h5>状态设置</h5></td></tr>
	        <tr>
	            <td colspan="2" class="required" ><label for="pointsGoodsCommend" class="validation">商品推荐:</label></td>
	        </tr>
			<tr class="noborder">
                 <td class="vatop rowform"  colspan="2"><input type="radio" value="1"  checked name="pointsGoodsCommend" >推荐<input type="radio" <#if shopPointsGoods.pointsGoodsCommend=='0' >checked </#if> value="0" name="pointsGoodsCommend" >不推荐
                 </td>
	        </tr>
	        	<tr><td colspan="4"  style="background:#f3fbfe"><h5> 商品运费承担方式 </h5></td></tr>
	        <tr class="noborder">
                 <td class="vatop rowform"  colspan="2"><input type="radio" value="0"  checked name="pointsGoodsTransfeeCharge" >买家承担<input type="radio" <#if shopPointsGoods.pointsGoodsTransfeeCharge=='1' >checked </#if> value="1" name="pointsGoodsTransfeeCharge" >卖家承担
                 </td>
	        </tr>
	       
	        <tr>
	            <td colspan="2" class="required" ><label for="pointsGoodsShow" class="validation">是否上架</label></td>
	        </tr>
			<tr class="noborder">
	            <td class="vatop rowform">
	            <input type="radio" value="1" checked name="pointsGoodsShow" >上架 <input type="radio"  <#if shopPointsGoods.pointsGoodsShow=='0' >checked </#if> value="0" name="pointsGoodsShow" >不上架
	            </td>
	           	<td class="vatop tips"></td>
	        </tr>   
	    	<tr><td colspan="4"  style="background:#f3fbfe"><h5>礼品详细内容</h5></td></tr>
			<tr class="noborder">
	            <td class="vatop rowform" colspan="3">
	            
	              <textarea id="pointsGoodsBody" name="pointsGoodsBody" style="width:100%;height:400px;visibility:hidden;" >${shopPointsGoods.pointsGoodsBody}</textarea>
	          <!--  <input type="text" class="txt" value="${shopPointsGoods.pointsGoodsBody}" name="pointsGoodsBody" id="pointsGoodsBody">-->
	            </td>
	           	<td class="vatop tips"></td>
	        </tr>
        </tbody>
        <tr>
            <td width="250" style="text-align:right;" class="required"><label class="validation" for="state">审核通过：</label></td>
            <td class="vatop rowform onoff">
                <label for="store_AllowState1" class="cb-enable <#if shopPointsGoods.state == 2>selected</#if>" ><span>通过</span></label>
                <label for="store_AllowState0" class="cb-disable <#if shopPointsGoods.state == 1>selected</#if>" ><span>不通过</span></label>
                <input id="store_AllowState1" name="state" <#if shopPointsGoods.state == 2>checked="checked"</#if>value="2" type="radio"/>
                <input id="store_AllowState0" name="state" <#if shopPointsGoods.state == 1>checked="checked"</#if>value="4" type="radio"/>
            </td>
        </tr>
        <tfoot>
	        <tr>
	            <td colspan="2"><a href="JavaScript:void(0);" class="btn" id="submitBtn" ><span>提交</span></a></td>
	        </tr>
        </tfoot>
    </table>
</form>
</div>
<script>
	function limitcountfunc(obj){
		if($(obj).val()=="1"){
			$("tr[name=limitcountcontent]").css("display","block");
		}else{
			$("tr[name=limitcountcontent]").css("display","none");
			$("#exchangeCount").val("");
		}
		
	}
	
	function limitdatefunc(obj){
	
		if($(obj).val()=="1"){
			$("tr[name=limitdatecontent]").css("display","block");
		}else{
			$("tr[name=limitdatecontent]").css("display","none");
				$("#pointsGoodsEndtime").val("");
				$("#pointsGoodsStarttime").val("");
		}
	
	}

    //按钮先执行验证再提交表单
    $(function(){
        $("#submitBtn").click(function(){
            $("#shopPointsGoods_form").submit();
        });
    });
    
    //上传规格图片
function ajaxTypeImageUploads(pointsGoodsImage,views){		
	     $.ajaxFileUpload({
	        //处理文件上传操作的服务器端地址(可以传参数,已亲测可用)
	        url:"${base}/upload/imageFileUpload",
	        secureuri:false,                       //是否启用安全提交,默认为false
	        fileElementId:pointsGoodsImage,           //文件选择框的id属性
	        dataType:'json',                       //服务器返回的格式,可以是json或xml等
	        success:function(data, status){        //服务器响应成功时的处理函数
	            if(data.success){
	            	var count = parseInt(data.listimgSize);
	            	var strs01 = data.photoNewName.split(",");
	            	var strs02 = data.photoSrc.split(",");
	            	var imgBasePath = '${imgServer}'
	            	var imgPath = data.imgPath;
	            	var imageUrl = "";
	            	if(views != "photo"){
	            		var strs03 = data.oldName.split(",");
	            	}
	            	for(var i = 0; i < count; i++){	         
	            		var photoSrc01 = imgPath + "/" + strs01[i];
	            		var photoServcerSrc = imgBasePath + imgPath + "/" + strs01[i];
            			$("#photoView01").children("img").remove();
            			$("#photoView01").append("<img class='img' src='"+photoServcerSrc+"' width='306px' height='330px'/>");
            			$("#pointsGoodsImage").val(photoSrc01);
	            	}
	            }
	        },
	        error:function(data, status, e){ //服务器响应失败时的处理函数
	            $('#result').html('图片上传失败，请重试！！');
	        }
	    })
	    };
	    
//删除上传的图片
$("[name=deletePhoto]").live("click", function(){
	$(this).parent().remove();
});

//上传规格图片
function ajaxFileUploads(imageid,ob,imgDiv,type) {
	var $obj = $(ob);
    $.ajaxFileUpload({
        url: '${base}/upload/goodsImage',
        data: '',
        secureuri: false,
        fileElementId: imageid,
        dataType: 'json',
        success: function (data, status) {
        	if (data.success) {
	        	if(type == "spec"){
	        		$("[name=customSpecImage]").each(function(){
	            		if($(this).attr("nctype") == imgDiv){
	            			$(this).attr("src",data.imageServer+"/"+data.result);
	            			$(this).attr("imageSrc",data.result);
	            			$(this).attr("imageName",data.filename);
	            		}
	            	});
	        	}
	        	if(type == "goods"){
	        		$("[name=goodsImage]").each(function(){
	            		if($(this).attr("nctype") == imgDiv){
	            			$(this).attr("src",data.imageServer+"/"+data.result);
	            			$(this).attr("imageSrc",data.result);
	            			$(this).attr("imageName",data.filename);
	            		}
	            	});
	        	}
        	}
        },
        error: function (data, status, e) { //服务器响应失败时的处理函数
            if (type == 0) {
                $('#result_logo').html('图片上传失败，请重试！！');
            } else {
                $('#result_banner').html('图片上传失败，请重试！！');
            }
        }
    });
}
</script>
</@layout.body>