<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/jquery.edit.js"></script>
<script type="text/javascript">
    $(function(){
        $('#mianYouSubmit').click(function(){
           $('#formSearch').submit();
        });
    });
    function delBrand(){
        var items = $("input[name='mianyouIds']:checked").length;
        if (items==0) {
            alert("请至少选择一个要删除的项目");
        }else{
            if(confirm('您确定要删除吗?')){
                $('#form_list').submit();
            }
        }
    }
    function delRow(obj){
        if(confirm('您确定要删除吗?')) {
            $(obj).parents("tr").find("td:eq(0)>input").attr("checked", true);
            $('#form_list').submit();
        }
    }
</script>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>满免邮管理</h3>
            <ul class="tab-base">
                <li><a href="${base}/mianYou/list" <#if (state !=1)>class="current"</#if>><span>活动列表</span></a></li>
                <li><a href="${base}/mianYou/list?state=1" <#if (state ==1)>class="current"</#if>><span>待审核</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form method="post" name="formSearch" id="formSearch" action="${base}/mianYou/list">
        <table class="tb-type1 noborder search">
            <tbody>
            <tr>
                <th><label for="mianyouName">活动名称:</label></th>
				<td><input class="txt" name="mianyouName" id="mianyouName" value="${pager.condition.mianyouName}" type="text"></td>
                <th><label for="storeName">店铺名称:</label></th>
				<td><input class="txt" name="storeName" id="storeName" value="${pager.condition.storeName}" type="text"></td>
                <td><a href="javascript:void(0);" id="mianYouSubmit" class="btn-search " title="查询">&nbsp;</a>
                    <a href="${base}/mianYou/list" class="btns "><span>撤销检索</span></a>
                </td>
            </tr>
            </tbody>
        </table>
    </form>
    <table class="table tb-type2" id="prompt">
        <tbody>
        <tr class="space odd">
            <th colspan="12"><div class="title"><h5>操作提示</h5><span class="arrow"></span></div></th>
        </tr>
        <tr>
            <td>
                <ul>
                    <li>卖家发布的满免邮活动需要审核通过才可以加入优惠计算</li>
					<li>删除操作不可恢复，请慎重操作</li>
					<li>点击详细链接查看活动详细信息</li>
                </ul>
            </td>
        </tr>
        </tbody>
    </table>
    <form method="post" id='form_list' >
        <table class="table tb-type2">
            <thead>
            <tr class="thead">
                <th class="align-center">活动名称</th>
                <th class="align-center">店铺名称</th>
                <th class="align-center">开始时间</th>
                <th class="align-center">结束时间</th>
                <th class="align-center">状态</th>
                <th class="w72 align-center">操作</th>
            </tr>
            </thead>
            <tbody>
            <#list pager.result as mianYou>
	            <tr class="hover edit">
					<td class="align-center">
						${mianYou.mianyouName}
					</td>
                    <td class="align-center">
                        <a target="_blank" href="${frontServer}/store/shop?storeId=${mianYou.storeId}">${mianYou.storeName}</a>
                    </td>
					<td class="align-center">
					<#if mianYou.startTimeStr??>
	                	${mianYou.startTimeStr?string("yyyy-MM-dd ")}</td>
                	</#if>
					</td>
					<td class="align-center">
					<#if mianYou.endTimeStr??>
	                	${mianYou.endTimeStr?string("yyyy-MM-dd ")}</td>
                	</#if>
					</td>
					<td class="align-center">
						<!-- 状态(1-新申请/2-审核通过/3-已取消/4-审核失败) -->
						<#if mianYou.state == 1>新申请</#if>
						<#if mianYou.state == 2>审核通过</#if>
						<#if mianYou.state == 3>已取消</#if>
						<#if mianYou.state == 4>审核失败</#if>
					</td>
	                <td class="align-center">
	                    <a href="${base}/mianYou/findById?mianyouId=${mianYou.mianyouId}">详细</a>
	                    <#if (state==1)> &nbsp;|&nbsp;<a href="${base}/mianYou/forward?mianyouId=${mianYou.mianyouId}">审核</a></#if>
	                    <#if (state!=1)> &nbsp;|&nbsp; <a href="${base}/mianYou/delete?mianyouIds=${mianYou.mianyouId}">删除</a></#if>
	                </td>
	            </tr>
	        </#list>
            </tbody>
            <tfoot>
	            <tr class="tfoot">
		             <td colspan="30">
		                <@layout.pager pager/>
		             </td>
	            </tr>
            </tfoot>
        </table>
    </form>
</div>
</@layout.body>