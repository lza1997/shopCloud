<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/ajaxfileupload/ajaxfileupload.js"></script>
<script type="text/javascript" src="${base}/res/js/My97DatePicker/WdatePicker.js" charset="utf-8"></script>
</@layout.head>
<@layout.body>
<div class="page">
<div class="fixed-bar">
    <div class="item-title">
        <h3>满就减</h3>
        <ul class="tab-base">
            <li><a href="${base}/shopPMansong/list"><span>活动列表</span></a></li>
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
		   <li></li>
	    </ul>
        </td>
    </tr>
  </tbody>
</table>

<form id="shopPMansong_form" action="${base}/shopPMansong/saveOrUpdate" method="post">
    <input type="hidden" name="id" value="${shopPMansong.mansongId}">
    <table class="table tb-type2">
        <tbody>
        	
			<tr>
	            <td width="250" style="text-align:right;" class="required" ><label for="mansongName">活动名称:</label></td>
				<td class="vatop rowform" style="width:auto;">
				${shopPMansong.mansongName}
	           	<td class="vatop tips"></td>
	        </tr>
			<tr>
	            <td width="250" style="text-align:right;" class="required" ><label for="memberName">开始时间:</label></td>
				<td class="vatop rowform" style="width:auto;">
				${shopPMansong.startTimeStr}
				</td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr>
	            <td width="250" style="text-align:right;" class="required" ><label for="endTime" >结束时间:</label></td>
				<td class="vatop rowform" style="width:auto;">
				${shopPMansong.endTimeStr}
				</td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr>
	            <td width="250" style="text-align:right;" class="required" ><label for="state">满就减规则:</label></td>
				<td class="vatop rowform" style="width:auto;">
				<#list msRuleList as mansongRule>
					<table class="align-left" width="400">
						<td class="align-left" width="400">
							<font color="#3A87AD">单笔订单满</font>
							<font color="#FF3300" style="font-weight:bold;">${mansongRule.price }</font>
							<font color="#3A87AD">元  ，立减现金 </font> 
							<font color="#FF3300" style="font-weight:bold;">${mansongRule.discount } </font>
							<font color="#3A87AD">元   </font>
						</td>
					</table>
				</#list>
				</td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr>
	            <td width="250" style="text-align:right;" class="required" ><label for="remark">备注:</label></td>
				<td class="vatop rowform" style="width:auto;">
				${shopPMansong.remark}
	           	<td class="vatop tips"></td>
	        </tr>
	        <tr>
                <td width="250" style="text-align:right;" class="required"><label class="validation" for="state">审核通过：</label></td>
                <td class="vatop rowform onoff">
	                <label for="store_AllowState1" class="cb-enable <#if shopPMansong.state == 2>selected</#if>" ><span>通过</span></label>
	                <label for="store_AllowState0" class="cb-disable <#if shopPMansong.state == 1>selected</#if>" ><span>不通过</span></label>
	                <input id="store_AllowState1" name="state" <#if shopPMansong.state == 2>checked="checked"</#if>value="2" type="radio"/>
	                <input id="store_AllowState0" name="state" <#if shopPMansong.state == 1>checked="checked"</#if>value="1" type="radio"/>
	            </td>
            </tr>
        </tbody>
        <tfoot>
	        <tr>
	            <td></td>
	            <td colspan="2">
	            	<a href="JavaScript:void(0);" class="btn" id="submitBtn"><span>提交</span></a>
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
        $("#submitBtn").click(function(){
            $("#shopPMansong_form").submit();
        });
    });
</script>
</@layout.body>