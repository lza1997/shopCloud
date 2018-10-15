<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<#-- <script type="text/javascript" src="${base}/res/js/jquery.edit.js" charset="utf-8"></script> -->
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>设置</h3>
            <ul class="tab-base">
                <li><a href="${base}/setting/points/index"><span>积分设置</span></a></li>
                <li><a href="${base}/setting/site/siteSetting"><span>站点设置</span></a></li>
                <li><a href="JavaScript:void(0);" class="current"><span>图片设置</span></a></li>
                 <!--  <li><a href="${base}/dev/cache/setting"><span>缓存设置</span></a></li>-->
                <li><a href="${base}/setting/consult/setting"><span>咨询设置</span></a></li>
                <li><a href="${base}/setting/goodsApply/setting"><span>商品审核设置</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form id="img_form" enctype="multipart/form-data" method="post" action="${base}/setting/images/imagesSave">
	    <table class="table tb-type2">
	        <thead>
		        <tr class="thead">
		            <th class="w48"></th>
		            <th class="w96">图片尺寸</th>
		            <th class="w96">宽</th>
		            <th class="w96">高</th>
		        </tr>
	        </thead>
	        <tbody id="treet1">
	        	<input type="hidden" id="update_val" name="update_val" value=""/>
	            <tr class="hover edit">
	                <td>
	                </td>
	                <td class="sort">商品详细页小图尺寸:</td>
	                <td class="name"><input name="tiny_pic_width" class="editable" value="${map['tiny_pic_width']}"/>px</td>
	                <td class="name"><input name="tiny_pic_height" class="editable" value="${map['tiny_pic_height']}"/>px</td>
	            </tr>
	            <tr class="hover edit">
	                <td>
	                </td>
	                <td class="sort">缩略图尺寸:</td>
	                <td class="name"><input name="thumbnail_pic_width" class="editable" value="${map['thumbnail_pic_width']}"/>px</td>
	                <td class="name"><input name="thumbnail_pic_height" class="editable" value="${map['thumbnail_pic_height']}"/>px</td>
	            </tr>
	            <tr class="hover edit">
	                <td>
	                </td>
	                <td class="sort">商品详细页图片尺寸:</td>
	                <td class="name"><input name="small_pic_width" class="editable" value="${map['small_pic_width']}"/>px</td>
	                <td class="name"><input name="small_pic_height" class="editable" value="${map['small_pic_height']}"/>px</td>
	            </tr>
	            <tr class="hover edit">
	                <td>
	                </td>
	                <td class="sort">商品相册图片尺寸:</td>
	                <td class="name"><input name="big_pic_width" class="editable" value="${map['big_pic_width']}"/>px</td>
	                <td class="name"><input name="big_pic_height" class="editable" value="${map['big_pic_height']}"/>px</td>
	            </tr>  
	        </tbody>
	        <tfoot>
		        <tr>
		            <td colspan="16">
		                &nbsp;&nbsp;<a href="JavaScript:void(0);" class="btn" id="submitBtn"><span>提交</span></a></td>
		        </tr>
	        </tfoot>
	    </table>
    </form>
</div>
<script type="text/javascript">
//提交表单
$(function(){
	$("#submitBtn").click(function(){
        $("#img_form").submit();
    });
});
</script>
</@layout.body>