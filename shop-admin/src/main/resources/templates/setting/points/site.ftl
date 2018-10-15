<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/admincp.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/common_select.js" charset="utf-8"></script>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>设置</h3>
            <ul class="tab-base">
                <li><a href="${base}/setting/points/index"><span>积分设置</span></a></li>
                <li><a href="JavaScript:void(0);" class="current"><span>站点设置</span></a></li>
                <li><a href="${base}/setting/images/imagesSetting"><span>图片设置</span></a></li>
                <!--  <li><a href="${base}/dev/cache/setting"><span>缓存设置</span></a></li>-->
                <li><a href="${base}/setting/consult/setting"><span>咨询设置</span></a></li>
                <li><a href="${base}/setting/goodsApply/setting"><span>商品审核设置</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form id="site_form" enctype="multipart/form-data" method="post" action="${base}/setting/site/siteSave">
        <table class="table tb-type2 nobdb">
            <tbody>
            <tr class="noborder">
                <td colspan="2" class="required"><label class="validation">网站名称:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform">
               		<input type="text" value="${map['siteName']}" name="siteName" id="siteName" class="txt">
                </td>
                <td class="vatop tips"></td>
            </tr>
            <tr class="noborder" style="border-top: 1px dotted #ddd;">
                <td colspan="2" class="required"><label class="validation">网站标题:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform">
                	<input type="text" value="${map['siteTitle']}" name="siteTitle" id="siteTitle" class="txt">
                </td>
                <td class="vatop tips"></td>
            </tr>
            <tr class="noborder" style="border-top: 1px dotted #ddd;">
                <td colspan="2" class="required"><label class="validation">关键字:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform">
               		<input type="text" value="${map['siteKey']}" name="siteKey" id="siteKey" class="txt">
                </td>
                <td class="vatop tips"></td>
            </tr>
            <tr class="noborder"  style="border-top: 1px dotted #ddd;">
                <td colspan="2" class="required"><label class="validation">描述:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform">
                	<textarea type="text" value="${map['siteDiscription']}" name="siteDiscription" id="siteDiscription" >${map['siteDiscription']}</textarea>
                </td>
                <td class="vatop tips"></td>
            </tr>
            <tr>
                <td colspan="2" class="required">Logo:  </td>
            </tr>
            
            <tr class="noborder">
                <td class="vatop rowform">
	                <span class="type-file-box">
		                <input type='text' id='textfield1' class='type-file-text' value="${map['logo']}"/>
		            	<input type='button'  id='button1' value='' class='type-file-button' />
		            	<input name="logo"  type="file" class="type-file-file" id="pic" size="30" hidefocus="true" nc_type="change_pic">
	            	</span>
	            	<p class="picture">
			            <#if map['logo'] ??&& map['logo']!=''>
			               <img src="${imgServer}${map['logo']}" id="logoImage" width="120" height="120" alt="" nc_type="avatar" />
			            <#else>
			               <img src="${base}/res/images/member/default_image.png"  id="logoImage" nc_type="store_Labelimage" style="width: 200px;height: 60px;"/>
			            </#if>
		          	</p> 	
            	</td>
                <td class="vatop tips">支持格式gif,jpg,jpeg,png</td>
            </tr> 
            <tr class="noborder">
                <td colspan="2" class="required"><label class="validation">退货时间:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform">
               		<input type="text" value="${map['returnTime']}" name="returnTime" id="returnTime" class="txt">
                </td>
                <td class="vatop tips">以天为单位</td>
            </tr>
           
            </tbody>
            <tfoot>
            <tr class="tfoot">
                <td colspan="2" >
	                <a href="JavaScript:void(0);" class="btn" id="submitBtn">
	                	<span>提交</span>
	                </a>
                </td>
            </tr>
            </tfoot>
        </table>
    </form>
</div>
<script type="text/javascript">
$("#pic").change(function(){
    $("#textfield1").val($(this).val());
});

//提交表单
$(function(){
	$("#submitBtn").click(function(){
        $("#site_form").submit();
    });
});
</script>
</@layout.body>

