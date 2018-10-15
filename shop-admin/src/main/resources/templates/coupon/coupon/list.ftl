<@layout.head>
<link href="${base}/res/css/font/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
<!--[if IE 7]>
  <link rel="stylesheet" href="${base}/res/css/font/font-awesome/css/font-awesome-ie7.min.css">
<![endif]-->
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/common_select.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/dialog/dialog.js" id="dialog_js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/dialog/dialog.css"  />
<script type="text/javascript" src="${base}/res/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery.mousewheel.js"></script>
<script type="text/javascript">
    function deleteGoods(){
        var items = $("input[name='ids']:checked").length;
        if (items==0) {
            alert("请至少选择一个要删除的项目");
        }else{
            if(confirm('您确定要删除吗?')){
                $("#form_list").attr("action",APP_BASE+"/couponclass/deleteCoupon");
                $('#form_list').submit();
            }
        }
    }
</script>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>优惠券列表</h3>
            <ul class="tab-base">
                <li><a href="${base}/coupon/list" <#if status == 0>class="current"</#if>><span>列表</span></a></li>
                <li><a href="${base}/coupon/list?couponAllowState=0" <#if status == 1>class="current"</#if>><span>待审核</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    
    <form method='post' id="formSearch" name="formSearch" action="${base}/coupon/list">
        <input type="hidden" name="pageNo" value="${pager.pageNo}">
        <table class="table tb-type2">
            <thead>
            <tr class="thead">
                <th class="w24"></th>
                <th >优惠券图片</th>
                <th >优惠券名称</th>
                <th >店铺名称</th>
                <th >优惠金额(元)</th>
                <th >使用期限</th>
                <th >上架</th>
                <th >审核状态</th>
                <th >推荐</th>
                <th >操作 </th>
            </tr>
            </thead>
            <tbody>
            <#if datas??>
            <#list datas as data>
            <tr class="hover edit">
                <td><input type="checkbox" name="ids" value="${data.classId}" class="checkitem"></td>
                <td ><img src="${imgServer}${data.couponPic}" style="height:30px;width:60px"/></td>
                <td >${data.couponTitle}</td>
                <td >${data.storeName}</td>
                <td >${data.couponPrice}</td>
                <td >
                	<#if data.startTimeStr??>
	                	${data.startTimeStr?string("yyyy-MM-dd")}~${data.endTimeStr?string("yyyy-MM-dd")}</td>
                	</#if>
                <td >
                	<#if data.couponState == 1>
						下架
					<#else>
						上架
					</#if>
                </td>
                <td >
                	<#if data.couponAllowState == 0>
						待审核
					<#elseif data.couponAllowState == 1>
						已通过
					<#elseif data.couponAllowState == 2>
						未通过
					</#if>
                </td>
                <td >
                	<#if data.couponRecommend == 0>
						否
					<#else>
						是
					</#if>
                </td>
                <td align="left">
                	<p>
                		<a href="${base}/coupon/edit?id=${data.couponId}" title="修改">修改</a>&nbsp;&nbsp;
                		<a href="${base}/coupon/delete?ids=${data.couponId}" title="删除">删除</a>&nbsp;&nbsp;
                	</p>
                 </td>
            </tr>
            <tr style="display:none;">
                <td colspan="20"><div class="ncsc-goods-sku ps-container"></div></td>
            </tr>
            </#list>
            </#if>
            </tbody>
            <tfoot>
            <tr class="tfoot">
                <td><input type="checkbox" class="checkall" id="checkallBottom"></td>
                <td colspan="16">
                	<label for="checkallBottom">全选</label>
                    &nbsp;&nbsp;
                    <a href="JavaScript:void(0);" class="btn" nctype="del_batch" onclick="deleteGoods()"><span>删除</span></a>
                    <@layout.pager pager/>
                 </td>
            </tr>
            </tfoot>
        </table>
    </form>
</div>

</@layout.body>