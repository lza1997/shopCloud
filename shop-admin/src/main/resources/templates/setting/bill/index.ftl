<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/My97DatePicker/WdatePicker.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/jquery.validation.min.js"></script>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>结算设置</h3>
            <ul class="tab-base">
                <li><a href="javascript:void(0);" class="current"><span>结算时间设置</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form id="update_form" method="post" action="${base}/setting/bill/update">
        <table class="table tb-type2">
            <tbody>
	            <tr class="noborder">
	                <td class="required" colspan="2"><label class="validation" for="name">开始时间：</label></td>
	            </tr>
	            <tr class="noborder">
	                <td class="vatop rowform"><input <#if map??&&map['startTime']!=''>value="${map['startTime']}" readonly="readonly" <#else> onclick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'%y-%M-{%d+1}'});" </#if>type="text" class="txt Wdate valid" name="startTime" id="startTime" style="width: 151px;height: 18px;"/></td>
	                <td class="vatop tips">开始时间一经设置不可更改。</td>
	            </tr>
	            
	            <tr class="noborder">
	                <td class="required" colspan="2"><label class="validation" for="tag">结算周期：</label></td>
	            </tr>
	            <tr class="noborder">
	                <td class="vatop rowform"><input type="text" class="txt" name="cycle" id="cycle" style="width: 50px;height: 18px;"
	                	<#if map??>value="${map['cycle']}"</#if>/>天</td>
	                <td class="vatop tips">请填写结算周期,修改周期后,新的结算周期在本周期结算完成后生效。</td>
	            </tr>
            </tbody>
            <tfoot>
            <tr class="tfoot">
                <td colspan="15"><a id="submitBtn" class="btn" href="JavaScript:void(0);" onclick="submit();"> <span>提交</span> </a></td>
            </tr>
            </tfoot>
        </table>
    </form>
</div>
</@layout.body>
<script type="text/javascript">

	$(function(){
		formValidate();
	});
	
	jQuery.validator.addMethod("isDay",function(value,element){
		var pattern = /^\+?[1-9][0-9]*$/; //正整数
		return this.optional(element) || (pattern.test(value));  
	},"请填写正确的天数");

	var formValidate = function(){
		$("#update_form").validate({
		    errorPlacement: function(error, element){
		        $(element).next('.field_notice').hide();
		        $(element).after(error);
		    },
		    rules : {
		    	startTime : {
		    		required   : true
		    	},
		        cycle : {	
					required   : true,
					isDay	: true
				}
		    },
		    messages : {
		    	startTime : {
		    		required   : '请填写开始时间'
		    	},
		        cycle : {
					required : '请填写结算周期',
					isDay	: '请填写正确的天数'
		        }
		    }
		});
	}
	
	function submit(){
		if($('#update_form').valid()){
			$("#update_form").submit();
		}
	}
</script>