<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
</@layout.head>
<@layout.body>
<div class="page">
<div class="fixed-bar">
    <div class="item-title">
        <h3>广告位管理</h3>
        <ul class="tab-base">
            <li><a href="${base}/advPosition/list"><span>管理</span></a></li>
            <li><a href="${base}/advPosition/forward?apId=0" class="current"><span>新增</span></a></li>
            <!-- <li><a href="javascript:void(0)" class="current"><span>修改</span></a></li> -->
        </ul>
    </div>
</div>
<div class="fixed-empty"></div>
<form id="adv_position_form" action="${base}/advPosition/saveOrUpdate" method="post">
    <input type="hidden" name="apId" value="${advPosition.apId}">
    <table class="table tb-type2">
        <tbody>
	        <tr class="noborder">
	            <td colspan="2" class="required"><label class="validation" for="gcName">广告位置名:</label></td>
	        </tr>
	        <tr class="noborder">
	            <td class="vatop rowform">
	            <input type="text" value="${advPosition.apName}" name="apName" id="apName" maxlength="100" class="txt"></td>
	            <td class="vatop tips"></td>
	        </tr>
	        <tr>
	            <td colspan="2" class="required"><label for="parent_id">广告位简介:</label></td>
	        </tr>
	        <tr class="noborder">
	            <td class="vatop rowform">
	            <input type="text" value="${advPosition.apIntro}" name="apIntro" id="apIntro" maxlength="100" class="txt">
	            </td>
	            <td class="vatop tips"></td>
	        </tr>
	        
	         <tr>
	             <td colspan="2" class="required"><label for="murl" class="validation">广告类别:</label></td>
	            </tr>
	            <tr class="noborder">
	                <td class="vatop rowform">
	              <!-- 0图片1文字2幻灯3Flash -->
	                <select name="apClass" id="apClass">
	                	<option value="0" <#if (advPosition.apClass==0)>selected</#if>>图片</option>
	                	<option value="1" <#if (advPosition.apClass==0)>selected</#if>>文字</option>
	                	<option value="2" <#if (advPosition.apClass==0)>selected</#if> >Flash</option>
	                </select>
	                </td>
	            </tr>
	        <tr>
	        <tr>
	            <td colspan="2" class="required"><label for="gcmdescription">广告展示方式:</label></td>
	        </tr>
	        <tr class="noborder">
                <td class="vatop rowform">
                <!-- 0幻灯片1多广告展示2单广告展示 -->
                <select name="apDisplay" id="apDisplay">
                	<option value="0" <#if (advPosition.apDisplay==0)>selected</#if>>幻灯片</option>
                	<option value="1" <#if (advPosition.apDisplay==1)>selected</#if>>多广告展示</option>
                	<option value="2" <#if (advPosition.apDisplay==2)>selected</#if>>单广告展示</option>
                </select>
                </td>
	        </tr>
	        <tr>
	            <td colspan="2" class="required"><label for="apKey">获取标记:</label></td>
	        </tr>
	        <tr class="noborder">
                <td class="vatop rowform">
               		<input type="text" value="${advPosition.apKey}" name="apKey" id="apKey" maxlength="100" class="txt">
                </td>
	        </tr>
	        <tr>
	            <td colspan="2" class="required" ><label for="isUse" class="validation">是否启用:</label></td>
	        </tr>
	        <tr class="noborder">
	            <td class="vatop rowform">启用：<input type="radio" value="1" name="isUse" id="isUse" class="radio" checked >
	            停用：<input type="radio" value="0" name="isUse" id="isUse" class="radio" ></td>
	            <td class="vatop tips"></td>
	        </tr>
	        
	         <tr>
	            <td colspan="2" class="required" ><label for="apWidth" class="validation">广告位宽度:</label></td>
	        </tr>
	        <tr class="noborder">
	            <td class="vatop rowform"><input type="text" value="${advPosition.apWidth}" name="apWidth" id="apWidth" class="txt"></td>
	           <td class="vatop tips">请填写数字</td>
	        </tr>
	         <tr>
	            <td colspan="2" class="required" ><label for="apHeight" class="validation">广告位高度:</label></td>
	        </tr>
	        <tr class="noborder">
	            <td class="vatop rowform"><input type="text" value="${advPosition.apHeight}" name="apHeight" id="apHeight" class="txt"></td>
	            <td class="vatop tips">请填写数字</td>
	        </tr>
	        
        </tbody>
        <tfoot>
	        <tr>
	            <td colspan="2"><a href="JavaScript:void(0);" class="btn" id="submitBtn"><span>提交</span></a></td>
	        </tr>
        </tfoot>
    </table>
</form>
</div>
<script>
    //按钮先执行验证再提交表单
    $(function(){
        $("#submitBtn").click(function(){
            if($("#adv_position_form").valid()){
                $("#adv_position_form").submit();
            }
        });
        /*  $('#adv_position_form').validate({
           errorPlacement: function(error, element){
                error.appendTo(element.parent().parent().prev().find('td:first'));
            },
            rules : {
            	mname: {
                    required : true,
                    maxlength: 10,
                    minlength: 1
                },
                murl: {
                    required : true,
                    maxlength: 30,
                    minlength: 1
                },
                msort: {
                    required : true,
                    digits	 : true
                }
            },
            messages : {
            	mname : {
                    required : '请填写菜单名称',
                    maxlength: '规格菜单名称长度应在1-10个字符之间',
                    minlength: '规格菜单名称长度应在1-10个字符之间'
                },
                murl : {
                    required : '请填写菜单路径',
                    maxlength: '规格菜单路径长度应在1-30个字符之间',
                    minlength: '规格菜单路径长度应在1-30个字符之间'
                },
                msort: {
                    required : '请填写菜单排序',
                    digits   : '请填写整数'
                }
            } 
        });*/
    });
</script>
</@layout.body>