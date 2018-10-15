<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/jquery.edit.js"></script>
<script type="text/javascript" src="${base}/res/js/common_select.js" charset="utf-8"></script>

<script>
	function createStatic(urlName){
			var url = "${base}/toStatic/" + urlName;
			$.post(url, function(data){
				if(data == "success"){
					alert("生成静态页成功");
				}else{
					alert("生成静态页失败");
				}
			})
		}
</script>
	
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>生成静态页面</h3>
        </div>
    </div>
    <div class="fixed-empty"></div>
        <table class="table tb-type2">
            <thead>
            <tr class="thead">
            	<th></th>
                <th>静态页面</th>
                <th class="align-center">操作</th>
            </tr>
            </thead>
            <tbody>
            <tr class="hover edit">
            	<td class="w24"></td>
                <td class="">平台首页</td>
                <td class="align-center" style="width:170px">
                <a href="javascript:void(0)" onclick="createStatic('indexStatic.do');">生成静态页面</a> 
                </td>
            </tr>
            <tr class="hover edit">
            	<td class="w24"></td>
                <td class="">商品详细页</td>
                <td class="align-center" style="width:170px">
                <a href="javascript:void(0)" onclick="createStatic('goodsStatic.do');">生成静态商品详细页</a> 
                </td>
            </tr>
            </tbody>
        </table>
</div>
</@layout.body>
