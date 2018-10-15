<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/jquery.edit.js"></script>
<script type="text/javascript">
    $(function(){
        $('#ncsubmit').click(function(){
            $('#formSearch').submit();
        });
    });
</script>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>交易</h3>
            <ul class="tab-base">
                <li><a href="JavaScript:void(0);" class="current"><span>商品交易</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form method="post" name="formSearch" id="formSearch" action="${base}/tradegoods/list">
        <input type="hidden" name="pageNo" value="${pager.pageNo}">
       <#--  <table class="tb-type1 noborder search">
            <tbody>
            <tr>
                <th><label for="storeName">店铺</label></th>
                <td><input type="text" name="storeName" id="store_name" class="txt" value="${store.storeName}"></td>
                <th><label for="sellerName">店主</label></th>
                <td><input type="text" name="memberName" id="owner_and_name" class="txt" value="${store.memberName}"></td><td></td>
                <th><label>所属等级</label></th>
                <td><select name="gradeId">
                    <option value="">请选择...</option>
                    <#list gradeList as grade>
                        <option value="${grade.sgId}"
                                <#if grade.sgId == store.gradeId>selected="selected"</#if>>${grade.sgName}</option>
                    </#list>
                </select></td>
                <th><label>店铺类型</label></th>
                <td>
                    <select name="storeStatus">
                        <option value="" <#if store.storeState == ''>selected="selected" </#if>>请选择...</option>
                        <option value="open" <#if store.storeState ==1>selected="selected" </#if>>开启</option>
                        <option value="close" <#if store.storeState ==2>selected="selected" </#if>>关闭</option>
                    </select>
                </td>
              
                <td><a href="javascript:void(0);" id="ncsubmit" class="btn-search " title="查询">&nbsp;</a>
                    <#if store.sellerName?? || store.storeName?? || store.gradeId?? || store.storeStatus??>
                        <a href="${base}/store/manager/list" class="btns " title="撤销检索"><span>撤销检索</span></a>
                    </#if>
            </tr></tbody>
        </table> -->
    </form>
    <table class="table tb-type2" id="prompt">
        <tbody>
        <tr class="space odd">
            <th colspan="12"><div class="title">
                <h5>操作提示</h5>
                <span class="arrow"></span></div></th>
        </tr>
        <tr>
            <td><ul>
                <li></li>
            </ul></td>
        </tr>
        </tbody>
    </table>
    <form method="post" id="store_form">
        <input type="hidden" name="form_submit" value="ok" />
        <table class="table tb-type2">
            <thead>
            <tr class="thead">
                <th>序号</th>
                <th>货物名称</th>
                <th>分类名称</th>
                <th>交易量</th>
                <th>交易额(元)</th>
                <th>销售地</th>
                <th>店铺名称</th>
            </tr>
            </thead>
            <tbody>
            <#list pager.result as goodstrade>
            <tr>
                <td>
                   ${goodstrade_index+1}
                </td>
                <td>
		          <a href="javascript:void(0)" title="${goodstrade.goodsName}">
						<#if goodstrade.goodsName?length lt 15>   
						     ${goodstrade.goodsName}
						<#else> 
						     ${goodstrade.goodsName[0..14]}... 
						</#if>
				   </a>
                </td>
                <td>
                    ${goodstrade.gcName}
                </td>
                <td>
                    ${goodstrade.tradeGoodsCount}
                </td>
                <td>
                    ${goodstrade.tradeGoodsPrice}
                </td>
                <td>
                    ${goodstrade.provinceName}${goodstrade.cityName}
                </td>
                <td>
                    ${goodstrade.storeName}
                </td>
            </tr>
            </#list>
            </tbody>
            <tfoot>
            <tr class="tfoot">
                <td></td>
                <td colspan="16">
                    <@layout.pager pager/>
                </td>
            </tr>
            </tfoot>
        </table>
    </form>
</div>
</@layout.body>