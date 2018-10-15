<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/jquery.edit.js"></script>
<script type="text/javascript">
    $(function(){
        $('#shopPMansongQuotaSubmit').click(function(){
           $('#formSearch').submit();
        });
    });
    function delBrand(){
        var items = $("input[name='ids']:checked").length;
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
            <h3>满即送</h3>
            <ul class="tab-base">
                <li><a href="${base}/shopPMansong/list"><span>活动列表</span></a></li>
                <li><a href="JavaScript:void(0);" class="current"><span>套餐管理</span></a></li>
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
            <strong>卖家的满即送套餐列表</strong>
            </td>
        </tr>
        </tbody>
    </table>
    
    <!-- 搜索栏 -->
    <form method="post" name="formSearch" id="formSearch" action="${base}/shopPMansongQuota/list">
        <input type="hidden" name="pageNo" value="${pager.pageNo}">
        <table class="tb-type1 noborder search">
            <tbody>
            <tr>
          <td>&nbsp;</td>
	      <th class="w110">店铺名称</th>
	      <td class="w160"><input type="text" class="text w150" name="storeName" value="${storeName }"></td>
	      <td class="w70 tc"><label class="submit-border"><input type="submit" class="submit" value="搜索"></label></td>
            </tr>
            </tbody>
        </table>
    </form>
    
    <table class="table tb-type2">
        <thead>
        <tr class="thead">
            <th class="align-left">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <font size="3">店铺名称</font></th>
            <th class="align-center"><font size="3">开始时间</font></th>
            <th class="align-center"><font size="3">结束时间</font></th>
        </tr>
        </thead>
        <tbody>
        <#list pager.result as shopPMansongQuota>
         <tr class="hover edit">
			<td class="align-left">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a target="_blank" href="${frontServer}/store/shop?storeId=${shopPMansongQuota.storeId}">${shopPMansongQuota.storeName}</a>
			</td>
			<td class="align-center">
				<#if shopPMansongQuota.startTimeStr??>
	                ${shopPMansongQuota.startTimeStr?string("yyyy-MM-dd ")}</td>
                </#if>
			</td>
			<td class="align-center">
				<#if shopPMansongQuota.endTimeStr??>
	                ${shopPMansongQuota.endTimeStr?string("yyyy-MM-dd ")}</td>
                </#if>
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
</div>
</@layout.body>