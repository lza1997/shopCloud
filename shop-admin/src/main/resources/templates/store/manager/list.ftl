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
            <h3>店铺</h3>
            <ul class="tab-base">
                <li><a href="JavaScript:void(0);" class="current"><span>管理</span></a></li>
                <li><a href="${base}/store/manager/auditList" ><span>开店申请</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form method="post" name="formSearch" id="formSearch" action="${base}/store/manager/list">
        <input type="hidden" name="pageNo" value="${pager.pageNo}">
        <table class="tb-type1 noborder search">
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
                <#--
                <th><label>店铺类型</label></th>
                <td>
                    <select name="storeStatus">
                        <option value="" <#if store.storeState == ''>selected="selected" </#if>>请选择...</option>
                        <option value="open" <#if store.storeState ==1>selected="selected" </#if>>开启</option>
                        <option value="close" <#if store.storeState ==2>selected="selected" </#if>>关闭</option>
                    </select>
                </td>-->
              
                <td><a href="javascript:void(0);" id="ncsubmit" class="btn-search " title="查询">&nbsp;</a>
                    <#if store.sellerName?? || store.storeName?? || store.gradeId?? || store.storeStatus??>
                        <a href="${base}/store/manager/list" class="btns " title="撤销检索"><span>撤销检索</span></a>
                    </#if>
            </tr></tbody>
        </table>
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
                <li>如果当前时间超过店铺有效期或店铺处于关闭状态，前台将不能继续浏览该店铺，但是店主仍然可以编辑该店铺</li>
            </ul></td>
        </tr>
        </tbody>
    </table>
    <form method="post" id="store_form">
        <input type="hidden" name="form_submit" value="ok" />
        <table class="table tb-type2">
            <thead>
            <tr class="thead">
                <th>店铺</th>
                <th>店主账号</th>
                <th>所在地</th>
                <th>所属等级</th>
                <th>创店时间</th>
                <th class="align-center">有效期至</th>
                <th class="align-center">状态</th>
                <th class="align-center">推荐</th>
                <th class="align-center">操作</th>
            </tr>
            </thead>
            <tbody>
            <#list pager.result as store>
            <tr>
                <td class="hover edit ${store.storeStatus}">
                    <a href="javascript:;" target="_blank">
                        ${store.storeName}
                        <#if store.storeId == 1>(平台)</#if>
                    </a>
                </td>
                <td>${store.memberName}</td>
                <td>${store.areaInfo}</td>
                <td>
                     <#if grademap??>
                           ${grademap[store.gradeId+'']}
                    </#if>
                </td>
                <td>
                   <#if store.createTimeStr??>
                       ${store.createTimeStr?string("yyyy-MM-dd")}
                   </#if>
                </td>
                <td class="nowarp align-center">
                <#if store.endTimeStr??>
	                ${store.endTimeStr?string("yyyy-MM-dd")}
	            <#else>
	                                                无限制
                </#if>
                </td>
                <td class="align-center w72"><#if store.storeState == 1>开启<#else>关闭</#if></td>
                <td class="align-center yes-onoff">
                    <#if store.storeRecommend == 0>
                      <a href="JavaScript:void(0);" class=" disabled"
                        nc_type="inline_edit" fieldname="storeRecommend" modUrl="${base}/store/manager/recommond"
                        fieldid="${store.storeId}" fieldvalue="0" title="可编辑">
                        <img src="${base}/res/images/transparent.gif"></a>
                    <#else>
                    <a href="JavaScript:void(0);" class="enabled"
                       nc_type="inline_edit" fieldname="storeRecommend" fieldid="${store.storeId}" modUrl="${base}/store/manager/recommond"
                       fieldvalue="1"  title="可编辑"><img src="${base}/res/images/transparent.gif"></a>
                    </#if>
                </td>
                <td class="align-center w120">
                    <a href="${base}/store/manager/findById?id=${store.storeId}">查看</a>&nbsp;&nbsp;
                    <a href="${base}/store/manager/findForEdit?id=${store.storeId}">编辑</a><br/>
                    &nbsp;&nbsp;<a href="${base}/report/orderIndex?storeId=${store.storeId}">查看销售情况</a>&nbsp;&nbsp;<br/>
                    &nbsp;&nbsp;<a href="${base}/report/goodsClickIndex?storeId=${store.storeId}">查看商品流量</a>&nbsp;&nbsp;<br/>
                    &nbsp;&nbsp;<a href="${base}/report/balanceIndex?storeId=${store.storeId}">查看结算情况</a>&nbsp;&nbsp;<br/>
                    &nbsp;&nbsp;<a href="${base}/bill/orderBillList?storeId=${store.storeId}">查看店铺账单</a>&nbsp;&nbsp;
                   <#-- <#if store.storeId != 1>
                        <a href="${base}/store/manager/bindClass?id=${store.storeId}">经营类目</a>
                    </#if>-->
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