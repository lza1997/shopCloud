<div class="layout" style="width: 100%;">
<!-- css -->
<link href="${base}/res/css/base.css" rel="stylesheet" type="text/css">
<link href="${base}/res/css/member.css" rel="stylesheet" type="text/css">
<link href="${base}/res/css/member_store.css" rel="stylesheet" type="text/css">
<link href="${base}/res/css/member_user.css" rel="stylesheet" type="text/css">
<link href="${base}/res/js/kindeditor/themes/default/default.css" rel="stylesheet" />

<script type="text/javascript" src="${base}/res/js/jquery.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery.ajaxContent.pack.js" ></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/common_select.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/ajaxfileupload/ajaxfileupload.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/store_goods.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery.validation.min.js"></script>
<script type="text/javascript" src="${base}/res/js/area.js"></script>
<script type="text/javascript" src="${base}/res/js/layer/layer.js"></script>
<script type="text/javascript" src="${base}/res/js/kindeditor/kindeditor.js"></script>
<script type="text/javascript" src="${base}/res/js/kindeditor/plugins/code/prettify.js"></script>
<script type="text/javascript" src="${base}/res/js/kindeditor/lang/zh_CN.js"></script>
<script type="text/javascript" src="${base}/res/js/My97DatePicker/WdatePicker.js"></script>

<script type="text/javascript" src="${base}/res/js/store_goods.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery.sortable.js" charset="utf-8"></script>
<script type="text/javascript">
    $(function (){
        KindEditor.ready(function(K) {
            var editor1 = K.create("textarea[name='goods_body']", {
                uploadJson : APP_BASE+'/kind/upload',
                afterCreate : function() {
                    var self = this;
                },
                afterBlur: function(){this.sync();}
            });
        });
    });
    
</script>
<style>
.ui-timepicker-div .ui-widget-header { margin-bottom: 8px; }
.ui-timepicker-div dl { text-align: left; }
.ui-timepicker-div dl dt { float: left; clear:left; padding: 0 0 0 5px; }
.ui-timepicker-div dl dd { margin: 0 10px 10px 45%; }
.ui-timepicker-div td { font-size: 90%; }
.ui-tpicker-grid-label { background: none; border: none; margin: 0; padding: 0; }
.ui-timepicker-rtl{ direction: rtl; }
.ui-timepicker-rtl dl { text-align: right; padding: 0 5px 0 0; }
.ui-timepicker-rtl dl dt{ float: right; clear: right; }
.ui-timepicker-rtl dl dd { margin: 0 45% 10px 10px; }
.attr {
	    line-height: 20px;
	    float: left;
	    clear: both;
	    padding-top: 4px;
	    padding-bottom: 4px;
	    height: auto;
}

  .gbin1-list {
	list-style: none;
	padding:0;
	margin:0;
}

.gbin1-list li {

	float: left;

	height: 80px;
	text-align: center;
	
	margin: 17px;
	font-family: arial;

	color: #FFF;

	border-radius: 5px;
	padding: 0px;
}
</style>
<script type="text/javascript">
APP_BASE = '${base}';
</script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<style>
.box_arr .table_btn { width: 222px;}
.box_arr .table_btn a { float: left;}
.box_arr .table_btn a.disable_spec { background: url(http://192.168.1.220/templates/default/images/member/btn.gif) repeat 0 -1018px; float: right;}
.dialog_body { border: 0px;}
.add_spec .add_link { color: #919191;}
.add_spec .add_link:hover { color: red;}
.add_spec h2 { padding-left: 10px;}
.f_l { float: left; line-height: 24px;}
.mls_id { width: 0; filter: alpha(opacity=0); opacity: 0;}
.noSelect { color: #B9B9B9 !important;}
</style>

<script type="text/javascript">
var SITE_URL = "${base}";
var DEFAULT_GOODS_IMAGE = "upload/common/default_goods_image.gif_tiny.gif";

/* 插入商品图片 */
function insert_img(name,url){
	var obj = $('#goods_images').find('input[type="hidden"][value=""]:first');
	obj.next('img').attr('src',SITE_URL+"/templates/default/images/loading.gif");
	var error = '';
	var i = 0;
	$('#goods_images').find('input[type="hidden"]').each(function(){
		if($(this).val() == name){
			error = '不能再重复图片';
		}
		if($(this).val() != ''){
			i++;
		}
	});
	if(i == 5){
		error = '不能再添加图片';
	}
	if(error != ''){
		alert(error);
	}else{
	$.getScript("./resource/js/store_goods.js");
	obj.val(name).next('img').attr('src',url);
	}
}
$(function(){
    jQuery.validator.addMethod("pyPrice",
    function(value, element) {
        if ($('#whops_buyer').attr('checked') && $('#isApplyPostage_false').attr('checked')){
        	if ($('#py_price').val()==''){
        		return false;
        	}else{
        		return this.optional(element) || /^-?(?:\d+|\d{1,3}(?:,\d{3})+)(?:\.\d+)?$/.test(value);
        	}
        }else{
        	return true;
        }}
    );
    jQuery.validator.addMethod("kdPrice",
    function(value, element) {
        if ($('#whops_buyer').attr('checked') && $('#isApplyPostage_false').attr('checked')){
        	if ($('#kd_price').val()==''){
        		return false;
        	}else{
        		return this.optional(element) || /^-?(?:\d+|\d{1,3}(?:,\d{3})+)(?:\.\d+)?$/.test(value);
        	}
        }else{
        	return true;
        }}
    );
    jQuery.validator.addMethod("emsPrice",
    function(value, element) {
        if ($('#whops_buyer').attr('checked') && $('#isApplyPostage_false').attr('checked')){
	        	if ($('#es_price').val() != ''){
	        		return this.optional(element) || /^-?(?:\d+|\d{1,3}(?:,\d{3})+)(?:\.\d+)?$/.test(value);
	        	}else{
	        		return true;
	        	}
        }else{
        	return true;
        }}
    );
    jQuery.validator.addMethod("transportId",
    function(value, element) {
        if ($('#whops_buyer').attr('checked') && $('#isApplyPostage_true').attr('checked')){
	        	if ($('#transport_id').val() == '' || $('#transport_id').val() == '0'){
	        		return false;
	        	}else{
	        		return true;
	        	}
        }else{
        	return true;
        }}
    );        
     $('#goods_form').validate({
        errorPlacement: function(error, element){
            $(element).next('.field_notice').hide();
            $(element).after(error);
        },
        rules : {
            goods_name : {
                required	: true,
                minlength 	: 3,
                maxlength	: 50
            },
            goods_store_price : {	
				required   : true,
                number     : true,
                min        : 0.01,
                max		   : 1000000
            },
            goods_market_price : {	
				required   : true,
                number     : true,
                min        : 0.01,
                max		   : 1000000
            },
            price : {	
				required   : true,
                number     : true,
                min        : 0.01,
                max		   : 1000000
            },
            sku : {	
				required   : true,
                number     : true,
                min        : 1,
                max		   : 1000000
            },
//            goods_weight : {
//                required   : true,
//                number     : true
//            },
            goods_storage  : {
				required	: true,
                digits		: true,
                min			: 1,
                max			: 1000000000
            },
            area  : {
				required	: true,
                digits		: true,
                min			: 1,
                max			: 1000000000
            },
            city  : {
				required	: true,
                digits		: true,
                min			: 1,
                max			: 1000000000
            },
            transport_id:{
            	transportId:true
            },
            py_price	:{
            	pyPrice:true
            },
            kd_price	:{
            	kdPrice:true
            },
            es_price	:{
            	emsPrice:true
            }                
        },
        messages : {
            goods_name  : {
                required	: '商品名称不能为空',
                minlength 	: '商品标题名称长度至少3个字符，最长50个汉字',
                maxlength 	: '商品标题名称长度至少3个字符，最长50个汉字'
            },
            goods_store_price : {
				required: '商品价格不能为空',
                number     : '商品价格只能是数字',
                min		   : '商品价格必须是0.01~1000000之间的数字',
                max		   : '商品价格必须是0.01~1000000之间的数字'
            },
            goods_market_price : {
				required: '市场价不能为空',
                number     : '市场价只能是数字',
                min		   : '市场价必须是0.01~1000000之间的数字',
                max		   : '市场价必须是0.01~1000000之间的数字'
            },
            price : {	
				required   : '价格不为空',
                number     : '只能数字',
                min        : '数字不合法',
                max		   : '数字不合法'
            },
            sku : {	
				required   : '库存不为空',
                number     : '只能数字',
                min        : '数字不合法',
                max		   : '数字不合法'
            },
//            goods_weight:{
//                required : '商品重量不能为空',
//                number : ''
//            },
            goods_storage : {
				required: '商品库存不能为空',
                digits  : '库存只能填写数字',
                min		: '商铺库存数量必须为1~1000000000之间的整数',
                max		: '商铺库存数量必须为1~1000000000之间的整数'
            },
            area : {
				required: '请填写省份',
                digits  : '请填写省份',
                min		: '请填写省份',
                max		: '请填写省份'
            },
            city : {
				required: '请填写市',
                digits  : '请填写市',
                min		: '请填写市',
                max		: '请填写市'
            },
            py_price	:{
            	pyPrice:'缺少平邮价格'
            },
            kd_price	:{
            	kdPrice:'缺少快递价格'
            },
            es_price	:{
            	emsPrice:'EMS价格格式错误'
            },
            transport_id:{
            	transportId:'请选择要使用的运费模板'
            }                  
        }
    });
});
</script>
<div class="wp" style="width: 98%;">
  <div class="item-publish">
    <form method="post" id="goods_form" action="#">
      <input type="hidden" name="form_submit" value="ok" />
      <input type="hidden" name="goods_id" value="85" />
      <input type="hidden" name="spec_id" value="230" />
      <input type="hidden" name="type_id" value="${typeId}" />
      <div class="goods-attribute" style="width: 98%;">
        <dl class="tit">
          <h3>商品基本信息</h3>
        </dl>
        <dl>
          <dt>商品分类：</dt>
          <dd id="gcategory">
                        <span class="f_l">${catename}</span> <a class="edit_gcategory ncu-btn1 ml10" href="${base}/platform/sellIndex"><span>编辑</span></a>
                        <input type="text" id="cate_id" name="cate_id" value="${gcId}" class="mls_id text" />
            <input type="hidden" name="cate_name" id="cate_name" value="${catename}" class="mls_names text"/>
          </dd>
        </dl>
        <dl>
          <dt>商品类型：</dt>
          <dd>
            <p>
              <label style="padding-right:8px;">
                <input name="goods_form" value="1" checked="checked" type="radio" />
                全新</label>
              <label>
                <input name="goods_form" value="2"  type="radio" />
                二手</label>
            </p>
          </dd>
        </dl>
        <dl>
          <dt class="required"><span class="red">*</span>商品名称：</dt>
          <dd>
            <p>
              <input name="goods_name" type="text" class="text w400" title="" value="" />
            <p>
            <p class="hint">商品标题名称长度至少3个字符，最长50个汉字</p>
          </dd>
        </dl>
		<dl>
          <dt nc_type="no_spec">商品副标题：</dt>
          <dd nc_type="no_spec">
            <p>
              <input name="goods_subtitle" value="" type="text"  class="text w500"  />
            </p>
            <p class="hint">商品副标题做商品特殊说明，位于详情页商品名称下面</p>
          </dd>
        </dl>
        <dl>
          <dt nc_type="no_spec"><span class="red">*</span>商品价格：</dt>
          <dd nc_type="no_spec">
            <p>
              <input name="goods_store_price" value="" type="text"  class="text" />
              <input name="goods_store_price_interval" value="" type="hidden"  />
              <!-- 价格区间 --> 
            </p>
            <p class="hint">商品价格必须是0.01~1000000之间的数字</br>若启用了库存配置，请在下方商品库存区域进行管理</br>商品规格库存表中如有价格差异，店铺价格显示为价格区间形式</p>
          </dd>
        </dl>
        <dl>
          <dt nc_type="no_spec"><span class="red">*</span>市场价：</dt>
          <dd nc_type="no_spec">
            <p>
              <input name="goods_market_price" value="" type="text" class="text" />
              <input name="goods_market_price_interval" value="" type="hidden"  />
              <!-- 价格区间 --> 
            </p>
            <p class="hint">商品价格必须是0.01~1000000之间的数字</br>若启用了库存配置，请在下方商品库存区域进行管理</br>商品规格库存表中如有价格差异，店铺价格显示为价格区间形式</p>
          </dd>
        </dl>
        <dl>
          <dt nc_type="no_spec">成本价：</dt>
          <dd nc_type="no_spec">
            <p>
              <input name="goods_cost_price" value="" type="text" class="text" />
              <input name="goods_cost_price_interval" value="" type="hidden"  />
              <!-- 价格区间 --> 
            </p>
            <p class="hint">商品价格必须是0.01~1000000之间的数字</br>若启用了库存配置，请在下方商品库存区域进行管理</br>商品规格库存表中如有价格差异，店铺价格显示为价格区间形式</p>
          </dd>
        </dl>
        <#if specs??>
	        <#list specs as sps>
		        <dl nc_type="spec_group_dl_${sps_index}" spId="${sps.spId}" spName="${sps.spName}"  nctype="spec_group_dl" class="spec-bg" spec_img="t" spFormat="${sps.spFormat}">
		          <dt>
		            <input type="hidden" name="sp_name[${sps_index}]" value="${sps.spName}" />
		            ${sps.spName}：
		          </dt>
		          <dd nctype="sp_group_val">
			          <ul class="spec">
				          <#if sps.specValueList??>
					          <#list sps.specValueList as svl>
					          	<li>
							        <span nctype="input_checkbox" class="checkbox">
							        	<input type="checkbox" groupId="group_${sps_index}" name="specCheckBox" value="${svl.spValueId}" spValueName="${svl.spValueName}" class="sp_val" spFormat="${sps.spFormat}" >
							        </span>
							        <#if sps.spFormat==1>
							        	<span class="img"><img src="${imageServer}/${svl.spValueImage}" style="height: 17px;width: 17px;"></span>
							        </#if>
							        <span nctype="pv_name" class="pvname">${svl.spValueName}</span>
					          	</li>
					          </#list>
				          </#if>
			          </ul>
		              <div class="clear"></div>
		            <#if sps.spFormat==1&&sps.spName=="颜色">
		            <table border="0" cellpadding="0" cellspacing="0"  groupValue="group_${sps_index}" class="spec_table" style="display:none;" nctype="img_table">
			            <thead>
				            <tr>
					            <th>${sps.spName}</th>
					            <th class="w250">图片（无图片可不填）</th>
					            <th>已有图片</th>
				            </tr>
			            </thead>
		            	<tbody>
		            	<#if sps.specValueList??>
					          <#list sps.specValueList as svl>
			                <tr style="display:none;" nctype="file_tr" value="${svl.spValueId}">
				                <td>
				                	<span class="img">
				                		<img src="${imageServer}/${svl.spValueImage}" style="height: 17px;width: 17px;">
				                	</span>
				                	<span class="pvname" nctype="pv_name">${svl.spValueName}</span>
				                	<input type="hidden" value=""/>
				                </td>
					            <td class="w300">
					                <span class="pvname">
					                	<input type="file" name="files" id="mySpecImage_${sps_index}_${svl_index}" multiple="multiple" onChange="ajaxFileUploads('mySpecImage_${sps_index}_${svl_index}',this,'customSpecImage_${sps_index}_${svl_index}','spec');" />
					                </span>
					                <span>
					                	<img class="spec-img" style="border:0;height: 17px;width: 17px;" src="" imageSrc="" imageName="" spValueName="${svl.spValueName}" spValueId="${svl.spValueId}" name="customSpecImage" imageState="0" nctype="customSpecImage_${sps_index}_${svl_index}"/>
					                </span>
				                </td>
				                <td>当前无图片</td>
			                </tr>
			                </#list>
				          </#if>
			                <tr>
				                <td colspan="15">
				                	<p class="hint" style="padding-left:10px;">支持jpg、jpeg、gif、png格式图片。<br />建议上传尺寸360x360、大小1.00M内的图片。<br />商品详细页选中颜色图片后，颜色图片将会在商品展示图区域展示。</p>
				                </td>
			                </tr>
		                </tbody>
		            </table>
		            </#if>
		          </dd>
		        </dl>
	        </#list>
        </#if>
        <dl nc_type="spec_dl" class="spec-bg" style="display:none">
	        <dt>库存配置：</dt>
	        <dd class="spec-dd">
		        <table border="0" cellpadding="0" cellspacing="0" class="spec_table">
			        <thead>
			        	<#if specs??>
		        			<#list specs as sps>
						        <th>${sps.spName}</th>
						    </#list>
        				</#if>
						<th><span class="red">*</span>价格</th>
						<th><span class="red">*</span>库存</th>
				        <th>商品货号</th>
				        <th>是否开启</th>
			        </thead>
		        	<tbody nc_type="spec_table">
		        	</tbody>
		       </table>
	        </dd>
	   </dl>
       <dl>
          <dt nc_type="no_spec"><span class="red">*</span>商品库存：</dt>
          <dd  nc_type="no_spec">
            <p>
              <input name="goods_storage" value="0" type="text"  class="text" />
            </p>
            <p class="hint">商铺库存数量必须为1~1000000000之间的整数</br>若启用了库存配置，则系统自动计算商品的总数，此处无需卖家填写</p>
          </dd>
       </dl>
        <dl>
          <dt nc_type="no_spec">商品货号：</dt>
          <dd nc_type="no_spec">
            <p>
              <input name="goods_serial" value="" type="text"  class="text"  />
            </p>
            <p class="hint">商品货号是指卖家个人管理商品的编号，买家不可见</br>最多可输入20个字符，支持输入中文、字母、数字、_、/、-和小数点</p>
          </dd>
        </dl>
        <!-- 图片上传 -->
        <dl>
        	<dt>商品图片：</dt>
        	<dd>
        		<div class="pic_list">
        			<input type="hidden" id="goods_images_isupload" value="true"/>
        			<ul id="menu" class="menu">
		                <li class="active" id="li_1">
			                <a href="javascript:void(0);" style="line-height:22px; height:22px; padding:0 11px; background:#3366CC; color:#fff; position:relative; margin-right:20px;">
								本地上传
								<input type="file" onChange="ajaxTypeImageUploads('myBlogImage1','photo')" style="opacity:0; top:0; left:0; width:100%; height:100%; margin:0; position:absolute;" id="myBlogImage1" name="myfiles" class="file" multiple="multiple"/>
							</a>
		                </li>
	                </ul>
	                <div class="content">
		                <div id="demo"></div>
	                	<div class="standard">
	                		<div>
	                			<ul style="height: 130px;overflow:auto;overflow-x: hidden;" id="photoView01" class="gbin1-list">
	                				
	                			
	                			</ul>
	                		</div>
	                	</div>
	                </div>
        		</div>
        	</dd>
        </dl>
        <!--        <dl>
          <dt class="required"><em class="pngFix"></em>：</dt>
          <dd>
            <p>
              <input type="text" name="goods_weight" value="0" />
            </p>
            <p class="hint">单位：千克(Kg)</p>
          </dd>
        </dl>-->
        
        <dl class="tit">
          <h3>商品详情描述</h3>
        </dl>
        <dl>
          <dt>商品属性：</dt>
          <dd>
	          <div class="attr">
	          	  <#if goodsAttributes??>
		          	  <#list goodsAttributes as gas>
				          ${gas.attrName}
				          <select name="attrSelect" attrId="${gas.attrId}" attrName="${gas.attrName}" nc_type="attr_select" name="attrSelect">
					          <option value='' nc_type='' selected="selected" >请选择</option>
					          <#if gas.avList??>
						          <#list gas.avList as gav>
						          	<option attrValueId="${gav.attrValueId}" value="${gav.attrValueName}">${gav.attrValueName}</option>
						          </#list>
					          </#if>
				          </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				          <#if gas_index==3></br></#if>
				      </#list>
		          </#if>
	          </div>
	          <div class="clear"></div>
          </dd>
        </dl>
     	<dl>
          <dt>商品品牌：</dt>
          <dd>
	          <select name="brand_id" id="brand">
		          <option value="" selected="selected">-请选择-</option>
		          <#if brands??>
		          	<#list brands as bds>
		          		<option value="${bds.brandId}">${bds.brandName}</option>
		          	</#list>
		          </#if>
	          </select>
          </dd>
        </dl>
        <dl>
          <dt>商品描述：</dt>
          <dd>
            <p>
              <textarea id="goods_body" name="goods_body" style="width:100%;height:400px;visibility:hidden;"></textarea>
	            </p>
            <!-- <p class="info-album"><a class="des_demo" href="#?act=store_album&op=pic_list&item=des">插入相册图片</a></p> -->
            <p id="des_demo" style="display:none;"></p>
          </dd>
        </dl>
        <!--transport info begin-->
        <dl class="tit">
          <h3>商品物流信息</h3>
        </dl>
        <dl>
			<dt nc_type="no_spec">
				<span class="red">*</span>所在地：
			</dt>
          	<dd>
			    <span id="spanarea">
				<select name="area" class="select" id="area" check="needCheck"> 
					<option value="">请选择</option>
					<#if areas??> 
						<#list areas as str>
							<option value="${str.areaId}">${str.areaName}</option>
						</#list> 
					</#if>
				</select> 
				</span>&nbsp;&nbsp;	
				<span id="spancity"></span>
				<span class="form-tips" style="color: red" name="check" id="checkedarea"></span> 
				<input id="memberProvinceid" type="hidden" name="memberProvinceid" value="">
				<input id="city_id" type="hidden" name="city_id" value="">
				<input id="area_id" class="area_ids" type="hidden" name="area_id" value="">
				<input id="area_info" class="area_names" type="hidden" name="area_info" value="">
			</dd>
        </dl>
        <dl>
          <dt>运费：</dt>
          <dd>
            <p style="float:left;  clear:both; margin-top:8px;">
              <input type="radio" value="1" checked="checked"  name="goods_transfee_charge" id="whops_seller">
              <label for="whops_seller">卖家承担运费</label>
            </p>
            <p style="float:left;  clear:both; margin-top:8px;">
              <input type="radio" value="0"  name="goods_transfee_charge" id="whops_buyer">
              <label for="whops_buyer">买家承担运费</label>
            </p>
            <div class="transport_tpl" id="whops_buyer_box" style="display: none">
              <ul style="line-height:30px">
                <li>
                  <input id="isApplyPostage_true" name="isApplyPostage" class="radio" type="radio" value="1">
                  <label for="isApplyPostage_true">使用运费模板</label>
                  <div id="Postage" style="display:none">
                    <div class="freight-template">
                      <#if transport??>
                    		${transport.title}
                   	  </#if>
                      <input onclick="window.open('${base}/platform/transport/index')" type="button" value="查看我的运费模板" class="select-templ" id="postageButton">
                    </div>
                  </div>
                </li>
              </ul>
            </div>
          </dd>
        </dl>
        <!--transport info end-->
        <dl class="tit">
          <h3>其他信息</h3>
        </dl>
        <dl>
          <dt>商品发布：</dt>
          <dd>
            <p class="mt5">
              <label>
                <input name="goods_show" value="1" type="radio" checked="checked" />
                立即发布</label>
            </p>
            <p class="mt5">
              <label>
                <input name="goods_show" value="0" type="radio" />
                发布时间 
              </label>
              <input onClick="WdatePicker({minDate:'%y-%M-{%d+1} %H:%m:%s',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true});" disabled="disabled" class="txt" type="text" value="" id="time_to" name="endTime" style="width: 250px;height: 18px;"/>
            </p>
            <p class="mt5">
              <label>
                <input name="goods_show" value="2" type="radio" 
                <#if goods.goodsShow==2>checked="checked"</#if>/>
                放入仓库</label>
            </p>
          </dd>
        </dl>
        <dl>
          <dt>商品推荐：</dt>
          <dd>
            <p>
              <label style="padding-right:8px;">
                <input name="goods_commend" value="1"  type="radio" />
                是</label>
              <label>
                <input name="goods_commend" value="0" checked="checked"  type="radio"/>
                否</label>
            </p>
            <p class="hint">被推荐的商品会显示在店铺首页</p>
          </dd>
        </dl>
        <dl>
          <dt>SEO关键字</br>(keywords)：</dt>
          <dd >
            <p>
              <input name="seo_keywords" type="text" class="w400 text" value="" />
            </p>
            <p class="hint">SEO关键字 (keywords) 出现在商品详细页面头部的 Meta 标签中，</br>用于记录本页面商品的关键字，多个关键字间请用半角逗号 "," 隔开</p>
          </dd>
        </dl>
        <dl>
          <dt>SEO描述</br>(description)：</dt>
          <dd>
            <p>
              <textarea class="w400" name="seo_description" rows="3" id="remark_input" ></textarea>
            </p>
            <p class="hint">SEO描述 (description) 出现在商品详细页面头部的 Meta 标签中，</br>用于记录本页面商品内容的概要与描述，建议120字以内</p>
          </dd>
        </dl>
        <div class="clear">
          <p>&nbsp;</p>
          <p>&nbsp;</p>
        </div>
        <div class="ncu-form-style tc mb30">
          <input type="button" class="submit" value="提交" id="sub"/>
        </div>
      </div>
    </form>
  </div>
</div>
<script type="text/javascript">
	//点击运费有谁负责的适合
	$("[name=goods_transfee_charge]").live("change", function(){
		if($(this).val() == "1"){
			$("#whops_buyer_box").css("display","none");
		}else{
			$("#whops_buyer_box").css("display","");
		}
	});
	
	//上架下架,以及定时上架
	$("[name=goods_show]").live("click", function(){
		if($(this).val() == "0"){
			$("#time_to").attr("disabled",null);
		}else{
			$("#time_to").attr("disabled","disabled");
		}
		$("#time_to").attr("value","");
	});
</script>

<script type="text/javascript">
//上传规格图片
function ajaxTypeImageUploads(myBlogImage,views){
	     $.ajaxFileUpload({
	        //处理文件上传操作的服务器端地址(可以传参数,已亲测可用)
	        url:"${base}/upload/imageFileUpload",
	        secureuri:false,                       //是否启用安全提交,默认为false
	        fileElementId:myBlogImage,           //文件选择框的id属性
	        dataType:'json',
	        fileSize:5120000,
	        allowType:'jpg,jpeg,png,JPG,JPEG,PNG',                     //服务器返回的格式,可以是json或xml等
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
            			$("#photoView01").append("<li style='height:120px;display:inline'><img class='img' style='width:100px;height:100px' src='"+photoServcerSrc+"'/><a href='javascript:void(0)' imageSrc='"+photoSrc01+"' name='deletePhoto'> 删除</a></li>");
	            	}
	            }
	            $('.gbin1-list').sortable();
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

<script type="text/javascript">
//点击提交的时候
$(function(){
	$("#sub").click(function(){
		if($('#goods_form').valid()){
			//商品名称
			var goodsName = $("[name=goods_name]").val();
			
			//商品副标题
			var goodsSubtitle = $("[name=goods_subtitle]").val();
			
			//分类id
			var gcId = $("#cate_id").val();
			
			//分类名称
			var gcName = $("#cate_name").val();
			
			//品牌id
			var brandId = $("#brand").val();
			//品牌名
			if(brandId != ''){
				brandName = $("#brand").find(":selected").html();
			}
			//类型id
			var typeId = $("[name=type_id]").val();
			
			//规格名称
			var specName = "";
			//规格的数量
			var specCount = $("[nctype=spec_group_dl]").length;
			if($("[name=skuDo]").length > 0){
				if(specCount != 0 && specCount != ""){
					specName += "{";
					var specNameOne = "";
					$("[nctype=spec_group_dl]").each(function(){
						specId = $(this).attr("spId");
						specNameOne = $(this).attr("spName");
						specName += "\"" + specId + "\":\"" + specNameOne + "\",";
					});
					if(specName != ""){
						specName = specName.substring(0, specName.length-1);
						specName += "}"
					}
				}
			}
			
			//商品默认封面图片
			var goodsImage = "";
			goodsImage = $("[name=deletePhoto]").attr("imageSrc");
			
			//商品多图
			var goodsImageMore = "";
			$("[name=deletePhoto]").each(function(){
				goodsImageMore += $(this).attr("imageSrc") + ",";
			});
			
			//商品店铺价格
			var goodsStorePrice = "";
			goodsStorePrice = $("[name=goods_store_price]").val();
			
			//商品货号
			var goodsSerial = "";
			goodsSerial = $("[name=goods_serial]").val();
			
			//商品上架1上架0下架
			var goodsShow = "";
			var prepareUp = "";
			goodsShow = $("[name=goods_show]:checked").attr("value");
			
			if(goodsShow == "0"){
				goodsShow = "1";
				var timeTo = $("#time_to").val();
				if(timeTo != ''){
					prepareUp = timeTo;
				}
			}
			
			//商品推荐
			var goodsCommend = "";
			goodsCommend = $("[name=goods_commend]:checked").attr("value");
			
			//商品关键字
			var goodsKeywords = "";
			goodsKeywords = $("[name=seo_keywords]").val();
			
			//商品描述
			var goodsDescription = "";
			goodsDescription = $("[name=seo_description]").val();
			
			//商品详细内容
			var goodsBody = "";
			goodsBody = $("#goods_body").val();
			
			//商品属性 
			var goodsAttr = "";
			var attrTag = true;
			$("[name=attrSelect]").each(function(){
				if($(this).val()==''){
					attrTag = false;
				}
			});
			if($("[name=attrSelect]").length == 0){
				attrTag = false;
			}
			if(attrTag){
				var goodsAttrCount = $("[nc_type=attr_select]").length;
				if(goodsAttrCount > 0){
					goodsAttr += "{";
				}
				$("[nc_type=attr_select]").each(function(){
					var attrId = $(this).attr("attrId");
					var attrName = $(this).attr("attrName");
					var $choice = $(this).find(":selected");
					var attrValueName = $choice.attr("value");
					var attrValueId = $choice.attr("attrValueId");
					goodsAttr += "\"" + attrId + "\":\"{\\\"name\\\":\\\""+ attrName +"\\\",\\\"" + attrValueId + "\\\":\\\"" + attrValueName + "\\\"}\","
				});
				if(goodsAttrCount > 0){
					goodsAttr = goodsAttr.substring(0, goodsAttr.length-1);
					goodsAttr += "}";
				}
			}
			
			//商品规格
			var goodsSpec = "";
			//规格开关
			var specOpen = "";
			//首先判断规格的数量
			if($("[name=skuDo]").length > 0){
				//设置规格开关开启
				specOpen = "1";
				goodsSpec += "{";
				var specTag = 0;
				//循环获得所选择的规格值
				$("[nctype=spec_group_dl]").each(function(){
					//得到规格id,和所选择规格值的数量
					var goodsSpecId = $(this).attr("spId");
					var goodsSpecValueCount = $(this).find(":checked").length;
					//拼接字符串
					goodsSpec += "\"" + goodsSpecId + "\":\"{";
					//判断是否有选择规格
					if(goodsSpecValueCount > 0 && goodsSpecValueCount != ""){
						
						//循环获得每一个规格值的属性
						$(this).find(":checked").each(function(){
							//规格值id
							var goodsSpecValueId = $(this).attr("value");
							//规格值名称
							var goodsSpecValueName = $(this).attr("spValueName");
							//拼接字符串
							goodsSpec += "\\\"" + goodsSpecValueId + "\\\":\\\"" + goodsSpecValueName + "\\\",";
							specTag++;
						});
						//结束当前这个规格,进入下一个规格
						goodsSpec = goodsSpec.substring(0, goodsSpec.length-1);
						goodsSpec += "}\",";
					}
				});
				if(specTag > 0){
					//整个规格值结束
					goodsSpec = goodsSpec.substring(0, goodsSpec.length-1);
					goodsSpec += "}";
				}

				
			}else{
				//设置规格开关关闭
				specOpen = "0";
			}
			
			//颜色自定义图片
			var goodsColImg = "";
			if($("[name=skuDo]").length > 0){
				goodsColImg = "{";
				var imageSrcCount = 0;
				$("[name=customSpecImage]").each(function(){
					if("" != $(this).attr("imageSrc") && $(this).attr("imageState") == "1"){
						goodsColImg += "\"" + $(this).attr("spValueId") + "\":\"" + $(this).attr("imageSrc") + "\",";
						imageSrcCount += 1;
					}
				});
				if(imageSrcCount > 0){
					goodsColImg = goodsColImg.substring(0, goodsColImg.length-1);
					goodsColImg += "}";
				}else{
					goodsColImg = "";
				}
			}
			
			//商品类型,1为全新、2为二手
			var goodsForm = "";
			goodsForm = $("[name=goods_form]:checked").attr("value");
			
			//商品所在地(市)
			var cityId = "";
			cityId = $("#city").val();
			
			//商品所在地(市)名称
			var cityName = "";
			cityName = $("#city").find("option:selected").html();
			
			//商品所在地(省)
			var provinceId = "";
			provinceId = $("#area").val();
			
			//商品所在地(省)名称
			var provinceName = "";
			provinceName = $("#area").find("option:selected").html();
			
			//商品运费承担方式 默认 0为买家承担 1为卖家承担
			var goodsTransfeeCharge = "";
			goodsTransfeeCharge = $("[name=goods_transfee_charge]:checked").val();
			var transportId = "0";
			//如果是买家承担运费
			if(goodsTransfeeCharge == "0"){
				if($("[name=isApplyPostage]:checked").val() == "1"){
					//运费模板ID，不使用运费模板值为0
					transportId = $("#transportSelected").val();
				}/* else{
					//平邮
					var pyPrice = "";
					pyPrice = $("[name=py_price]").val();
					
					//快递
					var kdPrice = "";
					kdPrice = $("[name=kd_price]").val();
					
					//ems
					var esPrice = "";
					esPrice = $("[name=es_price]").val();
				} */

			}
			
			//店铺自定义分类id
			/* var StoreClassId = "";
			StoreClassId = $("[name=storeGoodsClass]").val(); */
			
			//设置商品的价格区间
			var goodsStorePriceInterval = "";
			//判断是否有选择规格,如果没有规格则没有价格区间
			if($("[name=skuDo]").length > 0){
				//获得所有的价格
				var $allPrice = $("[name=price]")
				//如果只有一个的价格,则价格区间为:x-x
				if($("[name=skuDo]").length == 1){
					goodsStorePriceInterval = $allPrice.val() + "-" + $allPrice.val();
				}else{
					var arrPriceLength = $("[name=skuDo]").length;
					//循环放入数组
					var arrPrice = new Array(arrPriceLength);
					$allPrice.each(function(j,val){
						arrPrice[j] = parseFloat($(this).val());
					});
					var maxPrice = Math.max.apply(null,arrPrice);
					var minPrice = Math.min.apply(null,arrPrice);
					goodsStorePriceInterval = minPrice + "-" + maxPrice;
				}
			}
			
			
			//定义goodsSpec的实体类json数据
			//首先获得规格名称
			//规格名称
			if($("[name=skuDo]").length > 0){
				var specGoodsName = "";
				//规格的数量
				var specCount = $("[nctype=spec_group_dl]").length;
				if(specCount != 0 && specCount != ""){
					specGoodsName += "{";
					var specNameOne = "";
					$("[nctype=spec_group_dl]").each(function(){
						specId = $(this).attr("spId");
						specNameOne = $(this).attr("spName");
						specGoodsName += "\\\"" + specId + "\\\":\\\"" + specNameOne + "\\\",";
					});
					if(specCount > 0){
						specGoodsName = specGoodsName.substring(0, specGoodsName.length-1);
						specGoodsName += "}"
					}
				}
				var goodsSpecJson = "[";
				$("[name=skuDo]").each(function(){
					var specGoodsSpec = "";
					var spIds = $(this).attr("spId").split(",");
					var spNames = $(this).attr("spName").split(",");
					var specValueNames = $(this).attr("specValueName").split(",");
					var specValueIds = $(this).attr("specValueId").split(",");
					var goodsSpecJsonCount = spIds.length;
					//当前规格下的商品价格
					var specGoodsPrice = $(this).find("[name=price]").val();
					//当前规格下的规格商品编号
					var specGoodsSerial = $(this).find("[name=huohao]").val();
					//当前规格下的商品sku
					var specGoodsStorage = $(this).find("[name=sku]").val();
					//是否开启规格
					var specIsOpen = $(this).find("[name=isopen]").attr("checked");
					if(specIsOpen){
						specIsOpen = 1;
					}else{
						specIsOpen = 0;
					}
					//当前规格下的商品规格序列化
					specGoodsSpec += "{";
					for(var i = 0; i < spIds.length; i++){
						var specValueName = specValueNames[i];
						var specValueId = specValueIds[i];
						specGoodsSpec += "\\\"" + specValueId + "\\\":\\\"" + specValueName + "\\\","
					}
					specGoodsSpec = specGoodsSpec.substring(0, specGoodsSpec.length-1);
					specGoodsSpec += "}";
					goodsSpecJson += "{\"specName\":\""+ specGoodsName +"\",\"specGoodsPrice\":\""+ specGoodsPrice +"\",\"specGoodsSerial\":\""+ specGoodsSerial +"\",\"specGoodsStorage\":\""+ specGoodsStorage +"\",\"specGoodsSpec\":\""+ specGoodsSpec +"\",\"specIsOpen\":\""+specIsOpen+"\"},";
				});
				//去掉最后的逗号
				goodsSpecJson = goodsSpecJson.substring(0,goodsSpecJson.length-1);
				goodsSpecJson += "]";
			}
			var goods_market_price = $("[name=goods_market_price]").val();
			var goods_cost_price = $("[name=goods_cost_price]").val();
			var args = {
					"goodsName":goodsName,
					"goodsSubtitle":goodsSubtitle,//商品副标题
					"gcId":gcId,
					"gcName":gcName,
					"brandId":brandId,
					"brandName": brandName,
					"typeId":typeId,
					"specOpen":specOpen,//规格开关
					"specName": specName,//规格名称
					"goodsImage": goodsImage,//商品默认封面图片
					"goodsImageMore": goodsImageMore,//商品多图
					"goodsStorePrice": goodsStorePrice,//商品店铺价格
					"goodsStorePriceInterval": goodsStorePriceInterval,//区间价格
					"goodsSerial": goodsSerial,//商品货号
					"goodsShow": goodsShow,//商品上架1上架0下架
					"prepareUp": prepareUp,//上架时间
					"goodsCommend": goodsCommend,//商品推荐
					"goodsKeywords": goodsKeywords,//商品关键字
					"goodsDescription": goodsDescription,//商品描述 
					"goodsBody": goodsBody,//商品详细内容
					"goodsAttr": goodsAttr,// 商品属性 
					"goodsSpec": goodsSpec,//商品规格
					"goodsColImg": goodsColImg,//颜色自定义图片
					"goodsForm": goodsForm,//商品类型,1为全新、2为二手
					"transportId": 0,//运费模板ID，不使用运费模板值为0
					/* "pyPrice": pyPrice,
					"kdPrice": kdPrice,
					"esPrice": esPrice, */
					"cityId": cityId,//商品所在地(市)
					"cityName": cityName,
					"provinceId": provinceId,//商品所在地(省)
					"provinceName": provinceName,
					"goodsTransfeeCharge": goodsTransfeeCharge,//商品运费承担方式 默认 0为买家承担 1为卖家承担
					//"StoreClassId": StoreClassId,//店铺自定义分类id
					"goodsSpecJson": goodsSpecJson,//goodsSpec的实体类json串
					"goodsTotalStorage": $("[name=goods_storage]").val(),//总库存
					"goodsMarketPrice":goods_market_price, // 市场价
					"goodCostPrice":goods_cost_price // 成本价
			};
			var url = "${base}/platform/savePro";
	        //加载进度条
	        layer.load(2, {
	               shade: [0.2,'#999999'] //0.1透明度的白色背景
	        });
			$.post(url, args, function(data){
				//保存成功
				if(data.result == "1"){
					layer.msg(data.message , {icon:1});
					setTimeout("ok("+goodsShow+")",1500); 
				}else{
					//失败
					layer.msg(data.message , {icon:2});
					layer.closeAll('loading');
				}
			}, "json");
		}else{
			//返回信息错误的地方
			$("html,body").animate({scrollTop:$(".error:visible").offset().top},1000);
		}
	});
});
function ok(goodsShow){
	window.location.href='${base}/platform/sellList';
}
</script>
<script type="text/javascript">
//买家承担运费&运费模板
$("[name=isApplyPostage]").live("click",function(){
	if($(this).attr("value") == "1"){
		$("[nc_type=transport]").attr("value","");
		$("[nc_type=transport]").attr("disabled","disabled");
		$("#Postage").css("display","");
	}else{
		$("#Postage").css("display","none");
		$("[nc_type=transport]").attr("disabled",null);
	}
});
</script>

<script type="text/javascript">
	//当选中 规格后需要上传图片的时候
	$("[name=specCheckBox]").live("click",function(){
		//specValueChangeEdit(this);
		var tag = true;
		if($(this).attr("checked") != "checked"){
			tag = false;
		}
		var groupId = $(this).attr("groupId");
		var i = 0;
		$("[name=specCheckBox]").each(function(){
			if(groupId == $(this).attr("groupId")){
				if($(this).attr("checked") == "checked"){
					i++;
				}
			}
		});
		if($(this).attr("spFormat")=="1"){
			var specValueId = $(this).attr("value");
			$("[nctype=img_table]").each(function(){
				var groupValue = $(this).attr("groupValue");
				if(groupValue == groupId){
					if(i == 0){
						$(this).find("[nctype=file_tr]").each(function(){
							$(this).css("display","none");
							$(this).find("[name=customSpecImage]").attr("imageState","0");
						});
						$(this).css("display","none");
					}else{
						$(this).css("display","");
						$(this).find("[nctype=file_tr]").each(function(){
							if($(this).attr("value") == specValueId){
								if(tag){
									$(this).css("display","");
									$(this).find("[name=customSpecImage]").attr("imageState","1");
								}else{
									$(this).css("display","none");
									$(this).find("[name=customSpecImage]").attr("imageState","0");
								}
							}
						});
					}
				}
			});
		}
	});
	
	//当选中后,或者不选时,规格值名可编辑,和不可编辑
	function specValueChangeEdit(obj){
		//得到标签对象
		var $txt = $(obj).parent().parent().children().last();
		//当选中的时候
		if($(obj).attr("checked") == "checked"){
			//取得原来的名字
			var oldSpecValueName = $txt.html();
			//设置里面是一个input text标签
			$txt.html("<input type='text' name='specValueEdit' maxlength='20' value="+ oldSpecValueName + ">");
		}else{
			//当不选中的时候
			var oldSpecValueName = $txt.children().val();
			$txt.html(oldSpecValueName);
		}
	}
/* 	$("[name=specValueEdit]").live("change",function(){
		$(this).parent().parent().children().first().children().attr("spValueName",$(this).val());
	}); */
	
</script>

<script type="text/javascript">
	/*
		这一段js是用来控制规格,以及规格的图片上传,以及选中规格后库存的控制
	*/
	//当规格都至少选中一个的时候,增加一个节点,用来让用户控制商品的库存,以及货号
	$("[nctype=spec_group_dl]").live("change",function(){
		var skuTrArr = new Array($("[name=skuDo]").length);
		$("[name=skuDo]").each(function(y,x){
			var oldSpec = {
				id:$(this).attr("specValueId"),
				price:$(this).find("[name=price]").val(),
				sku:$(this).find("[name=sku]").val(),
				huohao:$(this).find("[name=huohao]").val(),
				isopen:$(this).find("[name=isopen]").attr("checked")
			};
			skuTrArr[y] = oldSpec;
		});
		$("[nc_type=spec_table]").empty();
		var tag = true;
		//准备数组,放入
		var SpecArray = new Array($("[nctype=spec_group_dl]").length);
		//循环每个规格,是否每个规格至少选中一个元素
		$("[nctype=spec_group_dl]").each(function(i,val){
			//规格id
			var spId = $(this).attr("spId");
			//规格名称
			var spName = $(this).attr("spName");
			if($(this).find(":checked").length == 0){
				tag = false;
				$("[nc_type=spec_dl]").css("display","none");
				$("[name=goods_storage]").attr("value","0");
				$("[name=goods_storage]").attr("disabled",false);
				$("[name=goods_store_price]").attr("disabled",false);
				return;
			}else{
				//准备数组,放入
				var SpecValueArray = new Array($(this).find(":checked").length);
				//循环,判断获取每个规格中选中的值
				$(this).find(":checked").each(function(j,specVal){
					//创建规格对象
					var spec = {
								spId:spId, 
								spName:spName, 
								specValueId:$(this).val(), 
								specValueName:$(this).attr("spValueName")
					};
					//将规格值放入数组中
					SpecValueArray[j] = spec;
				});
				//将规格值数组放入规格数组中
				SpecArray[i] = SpecValueArray;
			}
			
		});
		if(tag){
			$("[nc_type=spec_dl]").css("display","");
			//获得控制库存的数组
			var arr = getSkuTr(SpecArray);
			for(var s = 0; s < arr.length; s++){
				var args = arr[s].specValueName;
				var valueNames = args.split(",");
				var str = "";
				for(var l = 0; l < valueNames.length; l++){
					str += '<td>'+valueNames[l]+'</td>';
				}
				//判断是否已经存在tr
					var vaId = arr[s].specValueId;
					var flg = true;
					for(var e = 0; e < skuTrArr.length; e++){
						if(skuTrArr[e].id == vaId){
							flg = false;
							var isOpen = skuTrArr[e].isopen;
							var openTr = "";
							if(isOpen){
								openTr = '<td><input class="text" name="isopen" type="checkbox" checked="checked"/>开启规格</td>';
			    			}else{
			    				openTr = '<td><input class="text" name="isopen" type="checkbox"/>开启规格</td>';
			    			}
							var tr = '<tr name="skuDo" spId='+arr[s].spId+' spName='+arr[s].spName+' specValueName='+arr[s].specValueName+' specValueId='+arr[s].specValueId+' value='+arr[s].specValueId+'>'+
							str+
			    			'<td><input class="text" name="price" type="text" value="'+skuTrArr[e].price+'"/></td>'+
			    			'<td><input class="text" name="sku" type="text" value="'+skuTrArr[e].sku+'"/></td>'+
			    			'<td><input class="text" name="huohao" type="text" value="'+skuTrArr[e].huohao+'"/></td>'+
			    			openTr + 
		    				'</tr>';
						}
					}
					if(flg){
						var tr = '<tr name="skuDo" spId='+arr[s].spId+' spName='+arr[s].spName+' specValueName='+arr[s].specValueName+' specValueId="'+arr[s].specValueId+'" value="'+arr[s].specValueId+'">'+
						str+
		    			'<td><input class="text" name="price" type="text"/></td>'+
		    			'<td><input class="text" name="sku" type="text" value="0"/></td>'+
		    			'<td><input class="text" name="huohao" type="text"/></td>'+
		    			'<td><input class="text" name="isopen" type="checkbox"/>开启规格</td>'+
	    				'</tr>';
					}
					
			    	$("[nc_type=spec_table]").append(tr);
				}
			//判断库存
			if($("[nc_type=spec_table]").length > 0){
				//商品库存不能手动修改
				$("[name=goods_storage]").attr("disabled",true);
				//商品价格不能手动修改
				$("[name=goods_store_price]").attr("disabled",true);
			}else{
				$("[name=goods_storage]").attr("disabled",false);
				$("[name=goods_store_price]").attr("disabled",false);
			}
		}
	});
	function getSkuTr(arr){
		var a = 1;
		for(var r = 0; r < arr.length; r++){
			a *= arr[r].length;
		}
		var newArray = new Array(a);
		newArray = arr[0];
		for(var m=1;m<arr.length;m++){ 
			var arr2 =arr[m]; 
			newArray = dosku(newArray,arr2)
		}
		return newArray;
	}
	
	function dosku(arr,arr2){
		var a = arr.length;
		var b = arr2.length;
		var newArr = new Array(a*b);
		var q = 0;
		for(var i=0;i<arr.length;i++){
			for(var j=0;j<arr2.length;j++){ 
				var spec = {spId:arr[i].spId + ',' + arr2[j].spId, 
							spName:arr[i].spName + ',' + arr2[j].spName, 
							specValueId:arr[i].specValueId + ',' + arr2[j].specValueId, 
							specValueName:arr[i].specValueName + ',' + arr2[j].specValueName
			               };
				newArr[q] = spec;
				q++;
			}
		} 
		return newArr;
	}
	
	//库存配置变化
	$("[nc_type=spec_table]").live("change",function(){
		totalSku();
		caculatePrice();
	});
	$("[name=specCheckBox]").live("click",function(){
		totalSku();
		caculatePrice();
	});
	
	//库存的计算方法
	function totalSku(){
		var totalSku = 0;
		//获得总库存
		$("[name=sku]").each(function(){
			var sku = $(this).val();
			totalSku += parseInt(sku);
		})
		//将总库存放入商品库存
		$("[name=goods_storage]").attr("value",totalSku);
	}
	
	//价格的计算方法
	function caculatePrice(){
		var minPrice = parseFloat("0");
		$("[name=price]").each(function(x,y){
			var price = parseFloat($(this).val());
			if(x == 0){
				minPrice = price;
			}else{
				if(minPrice > price){
					minPrice = price;
				}
			}
		});
		$("[name=goods_store_price]").attr("value",minPrice);
	}
	
	$("[name=goodsInfo]").live("change",function(){
		$(this).next().attr("value",$(this).val);
	});
</script>

<script>
function checkselected(currentvalue){
	var result = true;
	jQuery.each($(".sgcategory"),function(){
		if(currentvalue!=0 && currentvalue == $(this).val()){
			result = false;
		}
	});
	return result;
}
</script> 
<script type="text/javascript">

	$(".gbin1-list").sortable();

</script>
</div>
