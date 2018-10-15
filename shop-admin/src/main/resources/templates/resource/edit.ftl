<@layout.head>
<script type="text/javascript">

function ajaxSubmit() {
	$.post("o_update", {
		"root" : $("#root").val(),
		"name" : $("#name").val(),
		"source" : $("#source").val()
	}, function(data) {
		if (data) {
			alert("修改成功");
		} else {
			alert("修改失败");
		}
	}, "json");
}
</script>
<style>
.return-button {
    background: url(${base}/res/images/tpl/theme-button.png) no-repeat -71px 0px;
    width: 81px;
    height: 24px;
    color: #646665;
    text-indent: 18px;
    line-height: 24px;
    border: 0 none;
    cursor: pointer;
    margin-left: 425px;
}
</style>
</@layout.head>
<@layout.body>
<div class="body-box">


	<form id="jvForm" method="post" action="o_update" labelWidth="15" >
		<div style="padding-bottom: 29px; padding-top: 34px;"> <label>文件名</label>
		<input type="text" value="${filename}" readonly="readonly" size="40" class="disabled"/>
		
		<input class="return-button" type="submit" value="返回列表" onclick="this.form.action='v_list';"/></div>
		

	<textarea id="source" name="source" style="width:90%;height:350px" wrap="off" maxlength="1232896" onkeydown="if((event.keyCode==115||event.keyCode==83)&&event.ctrlKey){ajaxSubmit();return false;}">
	${source}</textarea>



	<input type="hidden" id="root" name="root" value="${root}"/>
	<input type="hidden" id="name" name="name" value="${name!}"/>
	<div style="padding-left: 347px;padding-top: 20;">
	<input type="submit" value="提交" class="submit" class="submit"/> &nbsp;
	<input type="reset" value="重置" class="reset" class="reset"/>
</div>

</form>

</div>

</@layout.body>