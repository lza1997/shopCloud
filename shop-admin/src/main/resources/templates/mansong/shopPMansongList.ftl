<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/jquery.edit.js"></script>
<script type="text/javascript">
    $(function(){
        $('#shopPMansongSubmit').click(function(){
           $('#formSearch').submit();
        });
    });
</script>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>满就减</h3>
            <ul class="tab-base">
                <li><a href="${base}/shopPMansong/list" <#if (state !=1)>class="current"</#if>><span>活动列表</span></a></li>
                <li><a href="${base}/shopPMansong/list?state=1" <#if (state ==1)>class="current"</#if>><span>待审核</span></a></li>
                <!-- <li><a href="${base}/shopPMansongQuota/list"><span>套餐管理</span></a></li> -->
            </ul>
        </div>
    </div>
    
    <!-- 提示栏 -->
    <div class="fixed-empty"></div>
    
    <table class="table tb-type2" id="prompt">
        <tbody>
        <tr style="background: none repeat scroll 0% 0% rgb(255, 255, 255);" class="space odd">
            <th colspan="12"><div class="title">
                <h5>操作提示</h5>
                <span class="arrow"></span></div></th>
        </tr>
        <tr style="background: none repeat scroll 0% 0% rgb(255, 255, 255);" class="odd">
            <td>
            <ul>
	    		<li>卖家发布的满就减活动需要审核通过才可以加入优惠计算</li>
				<li>删除操作不可恢复，请慎重操作</li>
				<li>点击详细链接查看活动详细信息</li>
            </ul>
            </td>
        </tr>
        </tbody>
    </table>
    
    <!-- 搜索栏 -->
    <form method="post" name="formSearch" id="formSearch" action="${base}/shopPMansong/list">
        <input type="hidden" name="pageNo" value="${pager.pageNo}">
        <table class="tb-type1 noborder search">
            <tbody>
            <tr>
            	<td>&nbsp;</td>
	      <th>活动状态</th>
	      <td class="w100">
	      	<select name="state" style="width:100px">
                <option value="" <#if state == null>selected</#if>>全部</option>
                <option value="1" <#if state == 1>selected</#if>>新申请</option>
                <option value="2" <#if state == 2>selected</#if>>审核通过</option>
                <option value="3" <#if state == 3>selected</#if>>已取消</option>
                <option value="4" <#if state == 4>selected</#if>>审核失败</option>
	        </select></td>
	      <td style="width:10px">&nbsp;</td>
	      <th class="w110">活动名称</th>
	      <td class="w160"><input type="text" class="text w150" name="mansongName" value="${mansongName }"></td>
	      <td style="width:10px">&nbsp;</td>
	      <th class="w110">店铺名称</th>
	      <td class="w160"><input type="text" class="text w150" name="storeName" value="${storeName }"></td>
	      <td class="w70 tc">
	      <a href="javascript:void(0);" id="shopPMansongSubmit" class="btn-search " title="查询">&nbsp;</a>
                    <a href="${base}/shopPMansong/list" class="btns "><span>撤销检索</span></a></td>
            </tr>
            </tbody>
        </table>
    </form>
    
    <form method="post" id='form_list'>
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
            <#list pager.result as shopPMansong>
	            <tr class="hover edit">
				<td class="align-center">
					${shopPMansong.mansongName}
				</td>
				<td class="align-center">
					<a target="_blank" href="${frontServer}/store/shop?storeId=${shopPMansong.storeId}">${shopPMansong.storeName}</a>
				</td>
				<td class="align-center">
					<#if shopPMansong.startTimeStr??>
	                	${shopPMansong.startTimeStr?string("yyyy-MM-dd")}</td>
                	</#if>
				</td>
				<td class="align-center">
					<#if shopPMansong.endTimeStr??>
	                	${shopPMansong.endTimeStr?string("yyyy-MM-dd")}</td>
                	</#if>
				</td>
				<td class="align-center">
					<!-- 状态(1-新申请/2-审核通过/3-已取消/4-审核失败) -->
					<#if shopPMansong.state == 1>新申请</#if>
					<#if shopPMansong.state == 2>审核通过</#if>
					<#if shopPMansong.state == 3>已取消</#if>
					<#if shopPMansong.state == 4>审核失败</#if>
				</td>
	                
                <td class="align-center">
                    <a href="${base}/shopPMansong/findById?id=${shopPMansong.mansongId}">详细</a>
                    <#if (state==1)> &nbsp;|&nbsp;<a href="${base}/shopPMansong/forward?id=${shopPMansong.mansongId}">审核</a></#if>
                <@shiro.hasPermission name="sys:mansong:edit">
                    <#if (state!=1)> &nbsp;|&nbsp; <a href="${base}/shopPMansong/delete?id=${shopPMansong.mansongId}">删除</a></#if>
                </@shiro.hasPermission>
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