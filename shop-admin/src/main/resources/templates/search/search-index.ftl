<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/jquery.edit.js"></script>
<script type="text/javascript" src="${base}/res/js/common_select.js" charset="utf-8"></script>

<script>
	function createIndex(urlName){
			var url = "${base}/search/" + urlName;
			$.post(url, function(data){
				if(data.state == "1"){
					alert("生成索引成功");
				}else{
					alert("生成索引失败");
				}
			});
		}
		
		$(function (){
			$("#setAll").change(function(){
				if($(this).is(":checked")){
					$("[name='ids']").each(function(){
						$(this).attr("checked","checked");
					});
				}else{
					$("[name='ids']").each(function(){
					$(this).attr("checked",null);
					});
				}
			});
		});
		
	function createBatchIndex(){
	if($("[name='ids']:checked").length != 0){
		var tag = true;
		$("[name='ids']:checked").each(function(){
			var url = $(this).attr("value");
			$.post(url, function(data){
				if(data.stat == "0"){
					tag = false;
				}
				
			});
			});
			if(tag){
					alert("批量生产索引成功");
					$("#setAll").attr("checked",null);
					$("[name='ids']").each(function(){
						$(this).attr("checked",null);
					});
			}else{
				alert("批量生产索引失败");
			}
		}else{
		alert("至少选择一个批量生成!");
	}
}
	
</script>
	
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>生成索引</h3>
        </div>
    </div>
    <div class="fixed-empty"></div>
        <table class="table tb-type2">
            <thead>
            <tr class="thead">
            	<th></th>
                <th>索引名称</th>
                <th>索引类型</th>
                <th class="align-center">操作</th>
            </tr>
            </thead>
            <tbody>
            <tr class="hover edit">
            	<td class="w24"></td>
                <td class="">商品索引</td>
                <td class="">商品</td>
                <td class="align-center" style="width:170px">
                <a href="javascript:void(0)" onclick="createIndex('createGoodsIndex');">生成索引</a> 
                </td>
            </tr>
            <tr class="hover edit">
            	<td class="w24"></td>
                <td class="">店铺索引</td>
                <td class="">店铺</td>
                <td class="align-center" style="width:170px">
                <a href="javascript:void(0)" onclick="createIndex('createStoreIndex');">生成索引</a> 
                </td>
            </tr>
            <tr class="hover edit">
            	<td class="w24"></td>
                <td class="">商品智能匹配关键词</td>
                <td class="">关键词</td>
                <td class="align-center" style="width:170px">
                <a href="javascript:void(0)" onclick="createIndex('createGoodsWords');">生成索引</a> 
                </td>
            </tr>
            <tr class="hover edit">
            	<td class="w24"></td>
                <td class="">店铺智能匹配关键词</td>
                <td class="">关键词</td>
                <td class="align-center" style="width:170px">
                <a href="javascript:void(0)" onclick="createIndex('createStoreWords');">生成索引</a> 
                </td>
            </tr>
            </tbody>
        </table>
</div>
</@layout.body>
