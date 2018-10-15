<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/jquery.edit.js"></script>
<script type="text/javascript" src="${base}/res/js/dialog/dialog.js" id="dialog_js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery.mousewheel.js"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/dialog/dialog.css"  />
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript">
    $(function(){
        $('#ncsubmit').click(function(){
            $('#formSearch').submit();
        });
    });
    
     // 商品下架
    function check(stid) {
        _uri = APP_BASE+"/storeGoodsClass/remark?stid="+stid ;
        CUR_DIALOG = ajax_form('check', '审核结果', _uri, 350);
    }
</script>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>店铺</h3>
            <ul class="tab-base">
                <li><a href="JavaScript:void(0);" class="current"><span>管理</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form method="post" name="formSearch" id="formSearch" action="${base}/storeGoodsClass/list">
        <input type="hidden" name="pageNo" value="${pager.pageNo}">
        <table class="tb-type1 noborder search">
            <tbody>
            <tr>
                <th><label for="storeName">店铺</label></th>
                <td><input type="text" name="storeName" id="store_name" class="txt" value="${storegoodsClass.storeName}"></td>
                <th><label for="sellerName">分类名称</label></th>
                <td><input type="text" name="stcName" id="owner_and_stcName" class="txt" value="${storegoodsClass.stcName}"></td><td></td>
                <td><a href="javascript:void(0);" id="ncsubmit" class="btn-search " title="查询">&nbsp;</a>
                    <#if  storegoodsClass.storeName?? || storegoodsClass.stcName??>
                        <a href="${base}/storeGoodsClass/list" class="btns " title="撤销检索"><span>撤销检索</span></a>
                    </#if>
            </tr>
            </tbody>
        </table>
    </form>
    <table class="table tb-type2" id="prompt">
        <tbody>
        <tr class="space odd">
            <th colspan="12"><div class="title">
                <h5>操作提示</h5>
                <span class="arrow"></span></div></th>
        </tr>
        </tbody>
    </table>
    <form method="post" id="store_form">
        <input type="hidden" name="form_submit" value="ok" />
        <table class="table tb-type2">
            <thead>
            <tr class="thead">
                <th>店铺名称</th>
                <th>分类名称</th>
                <th>是否显示</th>
                <th>审核状态</th>
                <th>创建时间</th>
                <th class="align-center">操作</th>
            </tr>
            </thead>
            <tbody>
            <#list pager.result as storegoodsClass>
            <tr>
                <td>${storegoodsClass.storeName}</td>
                <td>${storegoodsClass.stcName}</td>
                <td>
                    <#if storegoodsClass.stcState == 0>
                     		     不显示
                    <#else>
                                                                                          显示
                    </#if> 
                </td>
                <td>
                   <#if storegoodsClass.checkState==0>
                      	审核中
                      <#elseif storegoodsClass.checkState==1>
                      	审核通过
                      <#else>
                       	未通过
                   </#if>
                </td>
                <td>
                <#if storegoodsClass.createTimeStr??>
	                ${storegoodsClass.createTimeStr?string("yyyy-MM-dd")}
                </#if>
                </td>
                <td class="align-center w120">
                    <a href="javascript:void(0);" onclick="check(${storegoodsClass.stcId});">审核</a>
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