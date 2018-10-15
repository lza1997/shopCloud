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
                <li><a href="JavaScript:void(0);" class="current"><span>缓存设置</span></a></li>
                <li><a href="${base}/setting/consult/setting"><span>咨询设置</span></a></li>
                <li><a href="${base}/setting/goodsApply/setting"><span>商品审核设置</span></a></li>
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
						<li>使用缓存必须安装redis服务</li>
						<li>请安装 redis 3.0 或以上版本</li>
					</ul>
				</td>
			</tr>
		</tbody>
	</table>
	<#assign adv_isShow = map['adv_isShow']/>
	<#assign category_isShow = map['category_isShow']/>
	<#assign dic_isShow = map['dic_isShow']/>
	<#assign area_isShow = map['area_isShow']/>
	<#assign other_isShow = map['other_isShow']/>
	
 <form action="${base}/dev/cache/update" method="post" id="update_form">
    <table class="table tb-type2">
        <thead>
	        <tr class="thead">
	            
	            <th class="align-center">类型</th>
	            <th class="align-center">时间(秒)</th>
	            <th>状态</th>
	            <th class="align-center">备注</th>
	        </tr>
        </thead>
        <tbody id="treet1">
            <tr class="hover edit">
                <td class="align-center">广告缓存</td>
                <td class="input align-center"><input name="adv_seconds" class="editable" value="${map['adv_seconds']}"/></td>
                <td class="onoff">
		                <label for="adv_isShow1" class="cb-enable <#if adv_isShow == 1>selected</#if>"><span>是</span></label>
		                <label for="adv_isShow0" class="cb-disable <#if adv_isShow == 0>selected</#if>" ><span>否</span></label>
	                	<input id="adv_isShow1" name="adv_isShow" <#if adv_isShow == 1>checked="true"</#if> value="1" type="radio">
	                	<input id="adv_isShow0" name="adv_isShow" <#if adv_isShow == 0>checked="true"</#if> value="0" type="radio">
                </td>
                <td class="txt"></td>
            </tr>
            <tr class="hover edit">
                <td class="align-center">分类缓存</td>
                <td class="input align-center"><input name="category_seconds" class="editable" value="${map['category_seconds']}"/></td>
                <td class="onoff">
		                <label for="category_isShow1" class="cb-enable <#if category_isShow == 1>selected</#if>"><span>是</span></label>
		                <label for="category_isShow0" class="cb-disable <#if category_isShow == 0>selected</#if>"><span>否</span></label>
	                	<input id="category_isShow1" name="category_isShow" <#if category_isShow == 1>checked="true"</#if> value="1" type="radio">
	                	<input id="category_isShow0" name="category_isShow" <#if category_isShow == 0>checked="true"</#if> value="0" type="radio">
                </td>
                <td class="txt"></td>
            </tr>
            <tr class="hover edit">
                <td class="align-center">数据字典缓存</td>
                <td class="input align-center"><input name="dic_seconds" class="editable" value="${map['dic_seconds']}"/></td>
                <td class="onoff">
                
	                <label for="dic_isShow1" class="cb-enable <#if dic_isShow == 1>selected</#if>"><span>是</span></label>
	                <label for="dic_isShow0" class="cb-disable <#if dic_isShow == 0>selected</#if>"><span>否</span></label>
                	<input id="dic_isShow1" name="dic_isShow"  <#if dic_isShow == 1>checked="true"</#if> value="1" type="radio">
                	<input id="dic_isShow0" name="dic_isShow" <#if dic_isShow == 0>checked="true"</#if> value="0" type="radio">
                </td>
                <td class="txt"></td>
            </tr>
            <tr class="hover edit">
                <td class="align-center">地区表缓存</td>
                <td class="input align-center"><input name="area_seconds" class="editable" value="${map['area_seconds']}"/></td>
                <td class="onoff">
	                <label for="area_isShow1" class="cb-enable <#if area_isShow == 1>selected</#if>"><span>是</span></label>
	                <label for="area_isShow0" class="cb-disable <#if area_isShow == 0>selected</#if>"><span>否</span></label>
                	<input id="area_isShow1" name="area_isShow"  <#if area_isShow == 1>checked="true"</#if> value="1" type="radio">
                	<input id="area_isShow0" name="area_isShow" <#if area_isShow == 0>checked="true"</#if> value="0" type="radio">
                </td>
                <td class="txt"></td>
            </tr>
            <tr class="hover edit">
                <td class="align-center">其他</td>
                <td class="input align-center"><input name="other_seconds" class="editable" value="${map['other_seconds']}"/></td>
                <td class="onoff">
	                <label for="other_isShow1" class="cb-enable <#if other_isShow == 1>selected</#if>"><span>是</span></label>
	                <label for="other_isShow0" class="cb-disable <#if other_isShow == 0>selected</#if>"><span>否</span></label>
                	<input id="other_isShow1" name="other_isShow" <#if other_isShow == 1>checked="true"</#if> value="1" type="radio">
                	<input id="other_isShow0" name="other_isShow" <#if other_isShow == 0>checked="true"</#if> value="0" type="radio">
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