<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/common_select.js"></script>
<script type="text/javascript" src="${base}/res/js/My97DatePicker/WdatePicker.js"></script>
<style type="text/css">
    .d_inline {
        display:inline;
    }
</style>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>店铺</h3>
            <ul class="tab-base">
                <li><a href="${base}/store/manager/list"><span>管理</span></a></li>
                <li><a href="${base}/store/manager/auditList" ><span>开店申请</span></a></li>
                <li><a href="JavaScript:void(0);" class="current"><span>编辑</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form id="store_form" method="post" action="${base}/store/manager/updateDetail">
        <input type="hidden" name="storeId" value="${storeDetail.storeId}" />
        <table class="table tb-type2">
            <tbody>
            <tr class="noborder">
                <td colspan="2" class="required"><label>店主账号:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform">${storeDetail.memberName}</td>
                <td class="vatop tips"></td>
            </tr>
            <tr>
                <td colspan="2"><label class="validation" for="storeOwnerCard">身份证号:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" name="storeOwnerCard" value="${storeDetail.storeOwnerCard}" id="store_storeOwnerCard" class="txt"></td>
                <td class="vatop tips"></td>
            </tr>
            <tr>
                <td colspan="2"> 店铺:</td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform">${storeDetail.storeName}</td>
                <td class="vatop tips"></td>
            </tr>
            <tr>
                <td colspan="2" class="required"><label>所属分类:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform">
	                 <select name="scId">
	                    <option value="0">请选择...</option>
	                    <#list classsList as class>
	                        <#if class.CId??>
	                            <option value="${class.CId}" <#if class.CId == storeDetail.scId>selected="selected" </#if>>
	                                &nbsp;&nbsp;${class.CName}</option>
	                        <#else>
	                            <option value="${class.PId}" <#if class.PId == storeDetail.scId>selected="selected" </#if>>
	                            ${class.PName} </option>
	                        </#if>
	                    </#list>
	                </select>
                </td>
                <td class="vatop tips"></td>
            </tr>
            <tr>
                <td colspan="2"><label  for="areaInfo">所在地</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform">${storeDetail.areaInfo}</td>
                <td class="vatop tips"></td>
            </tr>
             <tr>
                <td colspan="2"><label  for="storeAddress">详细地区</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform">${storeDetail.storeAddress}</td>
                <td class="vatop tips"></td>
            </tr>
            <tr>
                <td colspan="2"><label class="validation" for="storeZip">邮政编码</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" name="storeZip" value="${storeDetail.storeZip}" id="store_Zip" class="txt"></td>
                <td class="vatop tips"></td>
            </tr>
            <tr>
                <td colspan="2"><label  class="validation"  for="storeTel">联系电话</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" name="storeTel" value="${storeDetail.storeTel}" id="store_Tel" class="txt"></td>
                <td class="vatop tips"></td>
            </tr>
            </tbody>
            <tbody>
            <tr>
                <td colspan="2" class="required"><label>
                    <label for="gradeId">  所属等级:  </label>
                </label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><select id="grade_id" name="gradeId">
                    <#list gradeList as grade>
                        <option value="${grade.sgId}" <#if grade.sgId == storeDetail.gradeId>selected="selected" </#if>>
                       			 ${grade.sgName}  
                        </option>
                    </#list>
                </select></td>
                <td class="vatop tips"></td>
            </tr>
            <tr>
                <td colspan="2" class="required"><label>有效期至:</label></td>
            </tr>
           <tr class="noborder">
                <td class="vatop rowform">
                    <input onClick="WdatePicker({dateFmt:'yyyy-MM-dd'});" class="txt Wdate" type="text" value="<#if storeDetail.endTimeStr??>${storeDetail.endTimeStr?string("yyyy-MM-dd")}</#if>" id="endTimet" name="endTimet" style="width: 151px;height: 18px;"/>
                </td>
                <td class="vatop tips">格式：2009-4-30，留空表示不限时间</td>
            </tr> 
            <tr>
                <td colspan="2" class="required">
                    <label for="state">状态:</label>
               </td>
            </tr>
            <tr class="noborder">
              <#if storeDetail.storeState==2>
                 <td class="vatop rowform onoff">
                    <label for="store_state1" class="cb-enable  selected" ><span>开启</span></label>
                    <label for="store_state0" class="cb-disable" ><span>关闭</span></label>
                    <input id="store_state1" name="storeState" checked="checked" onclick="$('#tr_store_close_info').hide();" value="1" type="radio">
                    <input id="store_state0" name="storeState"  onclick="$('#tr_store_close_info').show();" value="0" type="radio">
                </td>
              <#else>
                <td class="vatop rowform onoff">
                    <label for="store_state1" class="cb-enable <#if storeDetail.storeState == 1>selected</#if>" ><span>开启</span></label>
                    <label for="store_state0" class="cb-disable <#if storeDetail.storeState == 0>selected</#if>" ><span>关闭</span></label>
                    <input id="store_state1" name="storeState" <#if storeDetail.storeState == 1>checked="checked"</#if> onclick="$('#tr_store_close_info').hide();" value="1" type="radio">
                    <input id="store_state0" name="storeState" <#if storeDetail.storeState == 0>checked="checked"</#if> onclick="$('#tr_store_close_info').show();" value="0" type="radio">
                </td>
              </#if>
                <td class="vatop tips"></td>
            </tr>
             <tr>
                <td colspan="2" class="required">
                    <label for="storeRecommend">推荐:</label>
                </td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform onoff"><label for="store_Recommend1" class="cb-enable <#if storeDetail.storeRecommend == 1>selected</#if>" ><span>是</span></label>
                    <label for="store_Recommend0" class="cb-disable <#if storeDetail.storeRecommend == 0>selected</#if>" ><span>否</span></label>
                    <input id="store_Recommend1" name="storeRecommend" <#if storeDetail.storeRecommend == 1>checked="checked"</#if>  value="1" type="radio">
                    <input id="store_Recommend0" name="storeRecommend" <#if storeDetail.storeRecommend == 1>checked="checked"</#if>  value="0" type="radio">
                </td>
                <td class="vatop tips"></td>
            </tr>
            <!--  <tr>
                <td colspan="2"><label  for="storeSort">排序</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" name="storeSort" value="${storeDetail.storeSort}" id="store_Sort" class="txt"></td>
                <td class="vatop tips"></td>
            </tr> -->
            </tbody>
            <tbody id="tr_store_close_info">
            <tr >
                <td colspan="2" class="required"><label for="storeCloseInfo">关闭原因:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><textarea name="storeCloseInfo" rows="6" class="tarea" id="store_close_info">${storeDetail.storeCloseInfo}</textarea></td>
                <td class="vatop tips"></td>
            </tr>
            </tbody>
            <tfoot>
            <tr class="tfoot">
                <td colspan="15"><a href="JavaScript:void(0);" class="btn" id="submitBtn"><span>提交</span></a></td>
            </tr>
            </tfoot>
        </table>
    </form>
</div>
<script type="text/javascript">
/* function del_auth(key){
    var store_id='1';
    $.get("index.php?act=store&&op=del_auth",{'key':key,'store_id':store_id},function(date){
        if(date){
            $("#"+key).remove();
            $("#"+key+"_del").remove();
            alert('认证文件删除成功');
        }
        else{
            alert('认证文件删除失败');
        }
    });
} */
$(function(){

    $('#end_time').datepicker();
    $('input[name="storeState"][value=1]').trigger('click');
    regionInit("region");
    $('input[class="edit_region"]').click(function(){
        $(this).css('display','none');
        $(this).parent().children('select').css('display','');
        $(this).parent().children('span').css('display','none');
    });
//按钮先执行验证再提交表单

    $("#submitBtn").click(function(){
        if($("#store_form").valid()){
            $("#store_form").submit();
        }
    });

//
    $('#store_form').validate({
        errorPlacement: function(error, element){
            error.appendTo(element.parentsUntil('tr').parent().prev().find('td:first'));
        },
        rules : {
            storeOwnerCard: {
                required : true,
                minlength: 18,
                maxlength: 18
            },
            storeZip: {
                     number: true,
                     minlength: 6,
                     maxlength: 6
                 },
            storeTel: {
                     required: true,
                     isTel:true
                 },
             storeSort: {
                number: true
            }
        },
        messages : {
            storeOwnerCard: {
                required : '身份证号不能为空',
                minlength: '身份证格式不正确',
                maxlength: '身份证格式不正确'
            },
            storeZip: {
                      number: '邮编必须为数字',
                      minlength: '邮编格式不正确',
                      maxlength: '邮编格式不正确'
                  },
            storeTel: {
                 required: '请输入联系电话',
                 isTel:'请输入正确的联系方式'
             },
             storeSort: {
                number: '请填写数字'
            }
        }
    });
    
           //校验电话格式
	      jQuery.validator.addMethod("isTel", function(value, element) { 
		  var tel =/(^(\d{2,5}-)?\d{6,9}(-\d{2,4})?$)|(^1\d{10}?$)/; //电话号码格式010-12345678 
		  return this.optional(element) || (tel.test(value)); 
	   }, "phone"); 
});
</script>
</@layout.body>