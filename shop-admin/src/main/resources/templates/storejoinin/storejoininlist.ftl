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
                <li><a href="${base}/store/manager/list" ><span>管理</span></a></li>
                <li><a href="JavaScript:void(0);" class="current"><span>开店申请</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form method="post" name="formSearch" action="${base}/shopStoreJoinin/list">
         <input type="hidden" name="pageNo" value="${pager.pageNo}">
        <table class="tb-type1 noborder search">
            <tbody>
            <tr>
                <th><label for="storeName">店铺</label></th>
                <td><input type="text" name="storeName" id="store_name" class="txt" value="${joinIn.storeName}"></td>
                <th><label for="memberName">店主</label></th>
                <td><input type="text"  name="memberName" id="owner_and_name" class="txt" value="${joinIn.memberName}"></td>
                <th><label>所属等级</label></th>
                <td><select name="sgId">
                    <option value="">请选择...</option>
                    <#list gradeList as grade>
                        <option value="${grade.sgId}"
                                <#if grade.sgId == joinIn.sgId>selected="selected"</#if>>${grade.sgName}</option>
                    </#list>
                </select></td>
                <td>
                    <a href="javascript:document.formSearch.submit();" class="btn-search " title="查询">&nbsp;</a>
                    <#if joinIn.storeName?? || joinIn.memberName?? || joinIn.sgId?? || joinIn.joininState??>
                        <a href="" class="btns " title="撤销检索"><span>撤销检索</span></a>
                    </#if>
                </td>
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
        <tr>
            <td><ul>
                <li></li>
            </ul></td>
        </tr>
        </tbody>
    </table>
    <form method="post" id="store_form" name="store_form">
        <input type="hidden" name="form_submit" value="ok" />
        <input type="hidden" name="type" id="type" value="" />
        <table class="table tb-type2">
            <thead>
            <tr class="thead">
                <th>店铺</th>
                <th>店主账号</th>
                <th>所在地</th>
                <th class="align-center">所属等级</th>
                <th class="align-center">状态</th>
                <th class="align-center">操作</th>
            </tr>
            </thead>
            <tbody>
            <#list pager.result as join>
                <tr class="hover edit">
                    <td>${join.storeName}</td>
                    <td>${join.memberName}</td>
                    <td class="w150">${join.companyAddress}</td>
                    <td class="align-center">
                        ${join.sgName}
                    </td>
                    <td class="align-center w72">
                       <#if join.joininState!=null && join.joininState??>
                    	 	 <#if join.joininState ==10>
                    			  审核中
                    		  <#elseif join.joininState==20>
                    		              审核成功
                    		  <#else>
                    			   审核失败
                    	  </#if>
                       </#if>
                    </td>
                    <td class="w72 align-center">
                        <#if join.joininState!=null && join.joininState == 10>
                            <a href="${base}/shopStoreJoinin/forward?memberId=${join.memberId}">审核</a>
                        <#else>
                            <a href="${base}/shopStoreJoinin/forward?memberId=${join.memberId}">查看</a>
                        </#if>
                    </td>
                </tr>
            </#list>
            </tbody>
            <tfoot>
            <tr class="tfoot">
                <td></td>
                <td colspan="15">
                    <@layout.pager pager/>
                </td>
            </tr>
            </tfoot>
        </table>
    </form>
</div>
</@layout.body>