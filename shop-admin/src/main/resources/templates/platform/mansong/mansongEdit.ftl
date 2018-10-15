<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/My97DatePicker/WdatePicker.js" charset="utf-8"></script>
<link href="${base}/res/css/font/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>
</@layout.head>
<@layout.body>
<style>
/*-----------------表单项属性-------------------------- */
input[type="text"], input[type="password"], input.text, input.password { font: 12px/20px Arial; color: #777; background-color: #FFF; vertical-align: top; display: inline-block;width: 40px; height:16px; padding: 4px; border: solid 1px #CCC; outline: 0 none;}
input[type="text"]:focus, input[type="password"]:focus, input.text:focus, input.password:focus, textarea:focus { color: #333; border-color: #75B9F0; box-shadow: 0 0 0 2px rgba(82, 168, 236, 0.15); outline: 0 none;}
input[type="text"].error, input[type="password"].error, textarea.error { border-color: #ED6C4F; box-shadow: 0 0 0 2px rgba(232, 71, 35, 0.15); outline: 0 none;}
textarea, .textarea { font: 12px/20px Arial; color: #777; background-color: #FFF; vertical-align: top; display: inline-block; height: 60px; padding: 4px; border: solid 1px #CCC; outline: 0 none;}
select { color: #777; background-color: #FFF; height: 30px; vertical-align: middle; *display: inline; padding: 4px; border: solid 1px #CCC; *zoom:1;}
select option { line-height: 20px; display: block; height: 20px; padding: 4px;}
input[type="file"] { line-height:20px; background-color:#FBFBFB; height: 20px; border: solid 1px #D8D8D8; cursor: default;}
.add-on { line-height: 28px; background-color: #E6E6E6; vertical-align: top; display: inline-block; text-align: center; width: 28px; height: 24px; border: solid #CCC; border-width: 1px 1px 1px 0}
.add-on { *display: inline/*IE6,7*/; zoom:1;}
.add-on i { font-size: 14px; color: #666; text-shadow: 1px 1px 0 #FFFFFF; *margin-top: 8px/*IE7*/;}
/*------表单验证错误提示文字---------*/
label.error { font-size: 12px; color: #E84723; margin-left: 8px;}
label.error i { margin-right: 4px;}

a.sc-btn-mini { font: normal 12px/20px arial; color: #777; background-color: #F5F5F5; text-align: center; vertical-align: middle; display: inline-block; height: 20px; padding: 0 10px; margin-right: 2px; border-style: solid; border-width: 1px; border-color: #DCDCDC #DCDCDC #B3B3B3 #DCDCDC; cursor: pointer;}
a:hover.sc-btn-mini { text-decoration: none; color: #333; background-color: #E6E6E6;border-color: #CFCFCF #CFCFCF #B3B3B3 #CFCFCF;}
a.sc-btn { font: normal 12px/20px "microsoft yahei"; text-decoration: none; color: #777; background-color: #F5F5F5; text-align: center; vertical-align: middle; display: inline-block; height: 20px; padding: 4px 10px; border: solid 1px; border-color: #DCDCDC #DCDCDC #B3B3B3 #DCDCDC; cursor: pointer;}
a:hover.sc-btn { text-decoration: none; color: #333; background-color: #E6E6E6; border-color: #CFCFCF #CFCFCF #B3B3B3 #CFCFCF;}
a.sc-btn-mini i, a.sc-btn i { font-size: 14px; vertical-align: middle; margin-right: 4px;}
a.sc-btn-blue, a.sc-btn-acidblue, a.sc-btn-green, a.sc-btn-orange, a.sc-btn-red, a.sc-btn-black,
a:hover.sc-btn-blue, a:hover.sc-btn-acidblue, a:hover.sc-btn-green, a:hover.sc-btn-orange, a:hover.sc-btn-red, a:hover.sc-btn-black, .cs-table-handle a.btn-orange-current { color: #FFF; text-shadow: 0 -1px 0 rgba(0,0,0,0.10);}
a.sc-btn-blue,
.cs-table-handle a:hover.btn-blue  { background-color: #006DCC; border-color: #0062B7 #0062B7 #005299 #0062B7;}
a.sc-btn-acidblue,
.cs-table-handle a:hover.btn-acidblue { background-color: #49AFCD; border-color: #429DB8 #429DB8 #37839A #429DB8;}
a.sc-btn-green,
.cs-table-handle a:hover.btn-green { background-color: #5BB75B; border-color: #52A452 #52A452 #448944 #52A452;}
a.sc-btn-orange,
.cs-table-handle a:hover.btn-orange,
.cs-table-handle a.btn-orange-current { background-color: #FAA732; margin: 0; border-style: solid; border-width: 1px; border-color: #E1962D #E1962D #BB7D25 #E1962D !important;}
a.sc-btn-red,
.cs-table-handle a:hover.btn-red { background-color: #DA4F49; border-color: #C44742 #C44742 #A33B37 #C44742;}
a.sc-btn-black,
.cs-table-handle a:hover.btn-black { background-color: #363636; border-color: #313131 #313131 #282828 #313131;}
a:hover.sc-btn-blue{ background-color: #0044CC; border-color: #003DB7 #003DB7 #003399 #003DB7;}
a:hover.sc-btn-acidblue { background-color: #2F96B4; border-color: #2A87A2 #2A87A2 #237087 #2A87A2;}
a:hover.sc-btn-green { background-color: #51A351; border-color: #499249 #499249 #3D7A3D #499249;}
a:hover.sc-btn-orange { background-color: #F89406; border-color: #DF8505 #DF8505 #BA6F04 #DF8505;}
a:hover.sc-btn-red { background-color: #BD362F; border-color: #AA312A #AA312A #8E2823 #AA312A;}
a:hover.sc-btn-black { background-color: #222222; border-color: #1F1F1F #1F1F1F #191919 #1F1F1F;}

/*---------满送活动规则---------*/
.sc-mansong-error span { font-size: 12px; color: #F00; margin-bottom: 5px;}
.sc-mansong-error i { margin-right: 4px;}
.selected-mansong-goods { background-color: #FFF; width: 162px; padding: 9px; border: solid 1px #E6E6E6; box-shadow: 2px 2px 0 rgba(153,153,153,0.1); margin-top: 10px;}
.selected-mansong-goods .goods-thumb { line-height: 0; background-color: #FFF; text-align: center; vertical-align: middle; display: table-cell; *display: block; width: 160px; height: 160px; border: solid 1px #F5F5F5; overflow: hidden;}
.selected-mansong-goods .goods-thumb img { max-width: 160px; max-height: 160px; margin-top:expression(160-this.height/2); *margin-top:expression(80-this.height/2)/*IE6,7*/;}

.mansong-rule span { *line-height: normal !important; *height: auto !important; *margin-top: 0 !important; *zoom:0 !important; line-height: 20px}
.mansong-rule .gift { clear: both;}
.mansong-rule-list {}
.mansong-rule-list li {width: 450px; color: #3A87AD; filter:progid:DXImageTransform.Microsoft.gradient(enabled='true',startColorstr='#3FD9EDF7', endColorstr='#3FD9EDF7');background:rgba(217,237,247,0.25); border: dashed 1px #BCE8F1; padding: 4px 9px; margin-bottom: 10px;}

.mansong-rule-list li strong { color: #F30; font-weight: 600;}
.mansong-rule-list li .goods-thumb { vertical-align: middle; display: inline-block; width: 32px; height: 32px; border: solid 1px #BCE8F1; margin-left: 2px;}
.mansong-rule-list li .goods-thumb img { max-width: 32px; max-height: 32px;}
.mansong-rule-list li .sc-btn-mini { float: right; display: inline-block;}
</style>
<div class="page">
<div class="fixed-bar">
    <div class="item-title">
        <h3>满就减</h3>
        <ul class="tab-base">
            <li><a href="${base}/platformmansong/list"><span>活动列表</span></a></li>
            <li><a href="javascript:void(0)" class="current"><span>添加活动</span></a></li>
        </ul>
    </div>
</div>

<div class="fixed-empty"></div>
<!-- 提示栏 -->
<table class="table tb-type2" id="prompt">
  <tbody>
    <tr style="background: none repeat scroll 0% 0% rgb(255, 255, 255);" class="space odd">
        <th colspan="12"><div class="title">
            <h5>操作说明</h5>
            <span class="arrow"></span></div></th>
    </tr>
    <tr style="background: none repeat scroll 0% 0% rgb(255, 255, 255);" class="odd">
        <td>
        <ul>
		   <li>满就减活动包括店铺所有商品，活动时间不能和已有活动重叠</li>
		   <li>每个满就减活动最多可以设置3个价格级别，点击新增级别按钮可以增加新的级别，价格级别应该由低到高</li>
	    </ul>
        </td>
    </tr>
  </tbody>
</table>

<form id="add_form" action="${base}/platformmansong/save" method="post">
    <input type="hidden" name="id" value="${shopPMansong.mansongId}">
    <table class="table tb-type2">
        <tbody>
        	
			<tr>
	            <td width="250" style="text-align:right;" class="required" ><label class="validation" for="mansongName">活动名称:</label></td>
				<td class="vatop rowform" style="width:auto;">
				<input maxlength="25" class="w300 text" name="mansongName" type="text" style=" width: 250px;">
	           	<td class="vatop tips"></td>
	        </tr>
			<tr>
	            <td width="250" style="text-align:right;" class="required" ><label class="validation" for="memberName">开始时间:</label></td>
				<td class="vatop rowform" style="width:auto;">
				<input class="Wdate" onFocus="WdatePicker({skin:'twoer',lang:'zh-cn',dateFmt:'yyyy-MM-dd HH:mm',maxDate:'#F{$dp.$D(\'endTime\')}'})" id="startTime" name="startTime"/>
				</td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr>
	            <td width="250" style="text-align:right;" class="required" ><label class="validation" for="endTime" >结束时间:</label></td>
				<td class="vatop rowform" style="width:auto;">
				<input class="Wdate" onFocus="WdatePicker({skin:'twoer',lang:'zh-cn',dateFmt:'yyyy-MM-dd HH:mm',minDate:'#F{$dp.$D(\'startTime\')}'})" name="endTime" id="endTime"/>
				</td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr>
	            <td width="250" style="text-align:right;" class="required" ><label class="validation" >满就减规则:</label></td>
				<td class="vatop rowform" style="width:480px;">
					<input type="hidden" id="mansong_rule_count" name="rule_count">
			        <ul id="mansong_rule_list" class="mansong-rule-list"> </ul>
					<a href="javascript:void(0);" id="btn_add_rule" class="sc-btn sc-btn-acidblue"><i class="icon-plus-sign"></i>添加规则</a>
					<div id="div_add_rule" style="display:none;">
				        <div class="sc-mansong-error">
				        	<span id="mansong_price_error" style="display:none;"><i class="icon-exclamation-sign"></i><font size="1" color="red">规则金额不能为空且必须为数字</font></span>
				        	<span id="mansong_discount_error" style="display:none;"><i class="icon-exclamation-sign"></i><font size="1" color="red">满减金额必须小于规则金额</font></span>
				        </div>
				        <div class="sc-mansong-rule">
					        <span>单笔订单满&nbsp;<input id="mansong_price" type="text" autocomplete="off"><em class="add-on"><i class="icon-renminbi"></i></em>，</span>
      <span>立减现金&nbsp;<input id="mansong_discount" type="text" autocomplete="off"><em class="add-on"><i class="icon-renminbi"></i></em></span>
				        </div>
				        <div id="mansong_rule_error" style="display:none;">请至少选择一种促销方式</div>
				        <div id="div_confirmOrCancel" class="mt10" style="display:none;">
				        	<a href="javascript:void(0);" id="btn_save_rule" class="sc-btn sc-btn-acidblue"><i class="icon-ok-circle"></i>确定规则设置</a>
          						<a href="javascript:void(0);" id="btn_cancel_add_rule" class="sc-btn sc-btn-orange"><i class="icon-ban-circle"></i>取消</a></div>
				     </div>
				</td>
	           	<td class="vatop tips">设置当单笔订单满足金额时（必填选项），减免金额（选填）；留空为不做减免金额。系统最多支持设置三组等级规则。</td>
	        </tr>
			<tr>
	            <td width="250" style="text-align:right;" class="required" ><label for="remark">备注:</label></td>
				<td class="vatop rowform" style="width:auto;">
				<textarea maxlength="100" rows="3" cols="50" class="txt" name="remark" id="remark"></textarea>
	           	<td class="vatop tips"></td>
	        </tr>
        </tbody>
        <tfoot>
	        <tr>
	            <td></td>
	            <td colspan="2">
	            	<a href="JavaScript:void(0);" class="btn" id="btn_submit"><span>提交</span></a>
	            	<a href="JavaScript:history.go(-1);" class="btn"><span>返回</span></a>
	            </td>
	        </tr>
        </tfoot>
    </table>
</form>
</div>
<script>
//按钮先执行验证再提交表单
$(function(){
	//提交表单
    $("#btn_submit").click(function(){
        $("#add_form").submit();
    });
	
	//添加规则
	$("#btn_add_rule").click(function(){
		$('#mansong_price').val('');
        $('#mansong_discount').val('');
        $('#mansong_price_error').hide();
        $('#mansong_rule_error').hide();
        $('#div_add_rule').show();
        $('#div_confirmOrCancel').show();
        $('#btn_add_rule').hide();
	});
	
	// 保存规则
    $('#btn_save_rule').on('click', function() {
        var mansong = {};
        mansong.price = Number($('#mansong_price').val());
        if(isNaN(mansong.price) || mansong.price <= 0) {
            $('#mansong_price_error').show();
            return false;
        } else {
            $('#mansong_price_error').hide();
        }
        mansong.discount = Number($('#mansong_discount').val());
        if(isNaN(mansong.discount) || mansong.discount < 0 || mansong.discount > mansong.price) {
            $('#mansong_discount_error').show();
            return false;
        } else {
            $('#mansong_discount_error').hide();
        }
        
        $('#mansong_rule_list').append("<li nctype='mansong_rule_item'><span>单笔订单满<strong>"
        			+mansong.price+"</strong> 元，立减现金<strong>"
        			+mansong.discount+"</strong>元。</span>"
        			+"<input type='hidden' name='mansong_rule[]' value='"+mansong.price+";"+mansong.discount+"'>"
        			+" <a nctype='btn_del_mansong_rule' href='javascript:void(0);'class='sc-btn-mini sc-btn-red'><i class='icon-trash'></i>删除</a></li>");
        close_div_add_rule();
    });

 	// 删除已添加的规则
    $('#mansong_rule_list').on('click', '[nctype="btn_del_mansong_rule"]', function() {
        $(this).parents('[nctype="mansong_rule_item"]').remove();
        close_div_add_rule();
    });
	
	// 取消添加规则
    $('#btn_cancel_add_rule').on('click', function() {
        close_div_add_rule();
    });
	
	// 关闭规则添加窗口
    function close_div_add_rule() {
        var rule_count = $('#mansong_rule_list').find('[nctype="mansong_rule_item"]').length;
        if( rule_count >= 3) {
            $('#btn_add_rule').hide();
        } else {
            $('#btn_add_rule').show();
        }
        $('#div_add_rule').hide();
        $('#mansong_rule_count').val(rule_count);
    }
   
});
</script>
</@layout.body>