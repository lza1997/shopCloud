<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>设置</h3>
            <ul class="tab-base">
            	<li><a href="${base}/setting/points/index"><span>积分设置</span></a></li>
                <li><a href="${base}/setting/site/siteSetting"><span>站点设置</span></a></li>
                <li><a href="${base}/setting/images/imagesSetting"><span>图片设置</span></a></li>
                 <!--  <li><a href="${base}/dev/cache/setting"><span>缓存设置</span></a></li>-->
                <li><a href="${base}/setting/consult/setting"><span>咨询设置</span></a></li>
                <li><a href="JavaScript:void(0);" class="current"><span>商品审核设置</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <table class="table tb-type2" id="prompt">
		<tbody>
			<tr style="background: none repeat scroll 0% 0% rgb(255, 255, 255);"
				class="space odd">
				<th colspan="12"><div class="title">
						<h5>操作提示</h5>
						<span class="arrow"></span>
					</div>
				</th>
			</tr>
			<tr style="background: none repeat scroll 0% 0% rgb(255, 255, 255);"
				class="odd">
				<td><ul>
						<li>若设置开启状态关闭，商家发布编辑商品后审核状态为通过</li>
						<li>若设置开启,商家发布编辑的商品状态为待审核状态，需审核通过后商家才可对产品商家下架</li>
					</ul>
				</td>
			</tr>
		</tbody>
	</table>
 <#assign goods_isApply = map['goods_isApply']/>
 <form enctype="multipart/form-data" action="${base}/setting/goodsApply/update" method="post" id="update_form">
    <table class="table tb-type2">
        <thead>
	        <tr class="thead">
	            
	            <th class="align-center">类型</th>
	            <th> 开启状态</th>
	        </tr>
        </thead>
        <tbody id="treet1">
            <tr class="hover edit">
                <td class="align-center">商品审核设置</td>
                <td class="onoff">
		                <label for="goods_isApply1" class="cb-enable <#if goods_isApply == 1>selected</#if>"><span>是</span></label>
		                <label for="goods_isApply0" class="cb-disable <#if goods_isApply == 0>selected</#if>" ><span>否</span></label>
	                	<input id="goods_isApply1" name="goods_isApply" <#if goods_isApply == 1>checked="true"</#if> value="1" type="radio">
	                	<input id="goods_isApply0" name="goods_isApply" <#if goods_isApply == 0>checked="true"</#if> value="0" type="radio">
                </td>
                <td class="txt"></td>
            </tr>
        </tbody>
        <tfoot>
	        <tr>
	            <td colspan="16">
	                &nbsp;&nbsp;<a href="JavaScript:void(0);" class="btn" onclick="updSet()"><span>保存</span></a></td>
	        </tr>
        </tfoot>
    </table>
  </form>
</div>
<script type="text/javascript">
var APP_BASE = '${base}';
  
function updSet(){
	$("#update_form").submit();
}
</script>
</@layout.body>