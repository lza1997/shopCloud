<@layout.head>
<script type="text/javascript" src="${base}/res/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${base}/res/js/layer/layer.js"></script>
</@layout.head>
<@layout.body>
<div class="page">
	<div class="fixed-bar">
	     <div class="item-title">
	         <h3>新增菜单</h3>
	         <ul class="tab-base">
	             <li><a href="${base}/promotionClass/index"><span>管理</span></a></li>
	             <li><a href="javaScript:;" class="current"><span><#if promotionClass??>编辑<#else>新增</#if></span></a></li>
	         </ul>
	     </div>
	 </div>
	 <div class="fixed-empty"></div>
		<form id="class_form" action="${base}/promotionClass/saveOrUpdate" method="post" >
		<input name="pcId" value="${promotionClass.pcId}" id="pcId" type="hidden">
		<table class="table tb-type2 nobdb">
		    <tbody>
		    	<tr class="noborder">
		          <td colspan="2" class="required"><label class="validation" for="pcName">分类名称:</label></td>
		        </tr>
		        <tr class="noborder">
		          <td class="vatop rowform"><input type="text" name="pcName" class="txt" value="${promotionClass.pcName }"></td>
		        </tr>
		        <tr class="noborder">
		          <td colspan="2" class="required"><label class="validation" for="pcSort">排序:</label></td>
		        </tr>
		        <tr class="noborder">
		          <td class="vatop rowform"><input type="text" name="pcSort" class="txt" value="255"></td>
		        </tr>
		      <tr class="noborder">
		          <td colspan="2" class="required"><label class="validation" for="startStr">开始时间:</label></td>
		        </tr>
		        <tr class="noborder">
		          <td class="vatop rowform">
		          	<input type="text" name="startStr" value="" class="txt Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss.ss'});">
		          </td>
		        </tr>
		        <tr class="noborder">
		          <td colspan="2" class="required"><label class="validation" for="endStr">结束时间:</label></td>
		        </tr>
		        <tr class="noborder">
		          <td class="vatop rowform"><input type="text" name="endStr" value="" class="txt Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss.ss'});">
		          </td>
		        </tr>
		        <tr class="noborder">
		          <td colspan="2" class="required"><label class="validation" for="pcStatus">状态:</label></td>
		        </tr>
		        <tr class="noborder">
		          <td class="vatop rowform">启用：<input id="pcStatus" type="radio" name="pcStatus" value="0"/>
		          停用：<input id="pcStatus" type="radio" name="pcStatus" value="1" checked/></td>
		        </tr>
		       	<tr>
		       		<td><input id="submitBtn" type="button" class="btn" value="提交"></td>
		       	</tr>
		   </tbody>
		</table>
		</form>
</div>
<script type="text/javascript">
    $(function(){
    	$("#submitBtn").click(function(){
        	//按钮先执行验证再提交表单
        	var size = '${listSize}';
        	if(size>0){
        		if($("#pcStatus:checked").attr("value")==1){
        			$("#class_form").submit();
        		}
        		layer.msg('只能开启一个促销分类', {icon:2});
        	}else{
        		$("#class_form").submit();
        	}
        	
        });
        /* $('#pcStartTime').datetimepicker({});
        $('#pcEndTime').datetimepicker({}); */
    });
</script>
</@layout.body>