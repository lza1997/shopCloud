<@layout.head>
<script type="text/javascript">


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


	<form id="jvForm" action="o_save" labelWidth="15" >
		<div style=" padding-top: 34px;"> <label>文件名</label>
		<input type="text" name="filename"  size="40" class="required"/><span class="pn-fhelp"> .ftl</span>
		<input class="return-button" type="submit" value="返回列表" onclick="history.go(-1);"/></div>
		
		
	<textarea id="source" name="source" style="width:90%;height:350px;margin-top: 20px;margin-left: 20px;margin-bottom: 20px;" wrap="off" maxlength="1232896"></textarea>



	<input type="hidden" id="root" name="root" value="${root}"/>
	<div style="padding-left: 347px;padding-top: 20;">
	<input type="submit" value="提交" class="submit" class="submit"/> &nbsp;
	<input type="reset" value="重置" class="reset" class="reset"/>
</div>

</form>

</div>

</@layout.body>