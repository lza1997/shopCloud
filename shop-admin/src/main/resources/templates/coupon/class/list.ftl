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
<script type="text/javascript" src="${base}/res/js/layer/layer.js"></script>
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
    
     function delCoupon(couponClassId){
    	 //删除优惠分类时先验证此类分类下有没有优惠券
 	      $.ajax({
 	    	   type: "post",
 	    	   url: "${base}/coupon/findCouponByClassId",
               data: {couponClassId:couponClassId},
               async:true,
               dataType: "json",
               success: function(data){
                  if(data.size>0){
               	   	layer.msg('该分类下还有优惠券，不可以删除', {icon:2});
                  }else{
               	   	location.href="${base}/couponclass/deleteCoupon?ids="+data.couponClassId;
                  }
               }
           }); 
     }
       
       
    
</script>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>优惠券分类列表</h3>
            <ul class="tab-base">
                <li><a href="JavaScript:void(0);" class="current"><span>列表</span></a></li>
                <li><a href="${base}/couponclass/add" ><span>新增</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    
    <form method='post' id="form_list" >
        <input type="hidden" name="form_submit" value="ok" />
        <table class="table tb-type2">
            <thead>
            <tr class="thead">
                <th class="w24"></th>
                <th >分类名称</th>
                <th >显示</th>
                <th >排序</th>
                <th >操作 </th>
            </tr>
            </thead>
            <tbody>
            <#if datas??>
            <#list datas as data>
            <tr class="hover edit">
                <td><input type="checkbox" name="ids" value="${data.classId}" class="checkitem"></td>
                <td >${data.className}</td>
                <td ><#if data.classShow == 0>显示<#else>不显示</#if></td>
                <td >${data.classSort}</td>
                <td align="left">
                	<p>
                		<a href="${base}/couponclass/edit?id=${data.classId}" title="修改">修改</a>&nbsp;&nbsp;
                		<!-- ${base}/couponclass/deleteCoupon?ids=${data.classId} -->
                		<a href="javascript:void(0);" onclick="delCoupon('${data.classId}')" title="删除">删除</a>&nbsp;&nbsp;
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