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
            <h3>商品</h3>
            <ul class="tab-base">
                <li><a href="${base}/platform/sellList"><span>出售中的商品</span></a></li>
                <li><a href="${base}/platform/storeList"><span>仓库中的商品</span></a></li>
                <li><a href="JavaScript:void(0);" class="current"><span>违规下架的商品</span></a></li>
                <li><a href="${base}/platform/closeShow"><span>下架的商品</span></a></li>
                <li><a href="${base}/platform/preApply"><span>待审核的商品</span></a></li>
                <li><a href="${base}/platform/offApply"><span>已拒绝的商品</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form method="post" name="formSearch" id="formSearch" action="${base}/platform/offShow">
        <input type="hidden" name="pageNo" value="${pager.pageNo}">
        <table class="tb-type1 noborder search">
            <tbody>
            <tr>
                <th><label for="search_goods_name">商品名称</label></th>
                <td><input type="text" value="${goods.goodsName}" name="goodsName" id="search_goods_name" class="txt"></td>
                <th><label for="search_commonid">商品货号</label></th>
                <td><input type="text" value="${goods.goodsSerial}" name="goodsSerial" id="search_commonid" class="txt" /></td>
                <th><label>分类</label></th>
                <td id="gcategory" colspan="8"><input type="hidden" id="cate_id" name="gcId" value="" class="mls_id" />
                    <input type="hidden" id="cate_id" name="gcId" value="" class="mls_id" />
                    <input type="hidden" id="cate_name" name="gcName" value="" class="mls_names" />
                    <select class="querySelect">
	                    <#if gcidpath!''>
	               		<#else>
		                    <option value="0">请选择...</option>
		                    <#list classList as gc>
		                        <option value="${gc.gcId}" <#if goodsGcId == gc.gcId> selected="selected" </#if> >${gc.gcName}</option>
		                    </#list>
		                </#if>
                    </select>
                    <!-- <select class="class="querySelect"">
                    <option value="0">请选择...</option>
                    <#list classList as gc>
                        <option value="${gc.gcId}">${gc.gcName}</option>
                    </#list>
                    </select> -->
               </td>
            </tr>
            <tr>
                <th><label>品牌</label></th>
                <td>
	                <select name="brandId">
	                    <option value="">请选择...</option>
	                <#list brandList as brand>
	                    <option value="${brand.brandId}" <#if goods.brandId == brand.brandId>selected="selected" </#if>>${brand.brandName}</option>
	                </#list>
	                </select>
                </td>
                 <td ><a href="javascript:void(0);" id="ncsubmit" class="btn-search " title="查询">&nbsp;</a></td>
                <td class="w120">&nbsp;</td>
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
                <li>上架，当商品处于非上架状态时，前台将不能浏览该商品，店主和管理员都可控制商品上架状态</li>
                <li>违规下架，当商品处于违规下架状态时，前台将不能浏览该商品，只有管理员可控制商品违规下架状态，并且商品不能上架</li>
            </ul></td>
        </tr>
        </tbody>
    </table>
    <form method='post' id="form_list">
        <input type="hidden" name="form_submit" value="ok" />
        <table class="table tb-type2">
            <thead>
            <tr class="thead">
                <th class="w24"></th>
                <th class="w24"></th>
                <th class="align-center">平台货号</th>
                <th colspan="2">商品名称</th>
                <th>品牌&分类</th>
                <th class="align-center">价格</th>
                <th class="align-center">商品状态</th>
                <th class="align-center">商品审核状态</th>
                <th class="w48 align-center">操作  </th>
            </tr>
            </thead>
            <tbody>
            <#if pager.result??>
	            <#list pager.result as goods>
	            <tr class="hover edit">
	                <td><input type="checkbox" value="${goods.goodsId}" class="checkitem" name="goods"></td>
	                <td>
		                <!-- <i class="icon-plus-sign" style="cursor: pointer;" nctype="ajaxGoodsList" data-comminid="${goods.goodsId}"
		                       title="点击展开查看此商品全部规格；规格值过多时请横向拖动区域内的滚动条进行浏览。">
		                </i> -->
	                </td>
	                <td class="w60 align-center">${goods.goodsSerial}</td>
	                <td class="w60 picture"><div class="size-56x56"><span class="thumb size-56x56"><i></i>
	                    <img src="${imgServer}${goods.goodsImage}" onload="javascript:DrawImage(this,56,56);"/>
	                </span></div></td>
	                <td class="goods-name w270"><p><span>${goods.goodsName}</span></p>
	                    <p class="store">所属店铺:${goods.storeName}</p></td>
	                <td><p>${goods.brandName}</p>
	                    <p>${goods.gcName}</p></td>
	                <td class="align-center">￥${goods.goodsStorePrice}</td>
	                <td class="align-center">
	                	<#if goods.goodsShow==0>下架</#if>
	                    <#if goods.goodsShow==1>上架</#if>
                    </td>
                    <td class="align-center">
	                    <#if goods.goodsState==40>(违规)</#if>
                    </td>
	                <td class="align-center">
	                	<p><a href="javascript:void(0);" onClick="combinationDialog('${gl.goodsId}','${gl.storeId}')">修改组合商品</a></p>
	                	<p><a href="${frontServer}/product/detail?id=${goods.goodsId}" target="_blank">查看</a></p>
	                	<p><a href="${base}/platform/editgoods?goodsId=${goods.goodsId}">上架</a></p>
	                    <!-- <p><a href="javascript:void(0);" onclick="upGoods('${goods.goodsId}');">上架</a></p> -->
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
                <td colspan="16"><label for="checkallBottom">全选</label>
                   <a href="JavaScript:void(0);" class="btn" nctype="del_batch" onclick="deleteBatchGoods()"><span>删除</span></a>
                    <@layout.pager pager/>
            </tr>
            </tfoot>
        </table>
    </form>
</div>

<script type="text/javascript">
	$(function(){
		// 选择分类搜索后回显搜索的分类
		<#if gcidpath!''>
	    	var firstLevel = '${firstLevel}';
	    	var secondLevel = '${secondLevel}';
	    	var threeLevel = '${threeLevel}';
			var newOption = "";
	    	<#list classList as gc>
		        newOption += "<option value='${gc.gcId}'' <#if firstLevel == gc.gcId> selected='selected' </#if> >${gc.gcName}</option>";
		    </#list>
	        $(".querySelect").prepend(newOption);
	        loadSelectCategory(secondLevel, threeLevel, $(".querySelect"));
	        loadSelectCategory(firstLevel, secondLevel, $(".querySelect"));
		</#if>
	    gcategoryInit("gcategory");
	}); 
    /**
     * 删除
     */
     function deleteGoods(goodsIds){
    	if(confirm("您确认要删除商品吗?")){
    		var url = '${base}/platform/deleteGoods'
    			var args = {"goodsIds" : goodsIds};
    			$.post(url, args, function(data){
    				//成功
    				if(data.success){
    					alert("删除成功!");
    					location.reload([true]);
    				}else{//失败
    					alert("删除失败!");
    				}
    			});
    	}
     }
     
     /*
      * 批量删除
      */
      function deleteBatchGoods(){
    	 var goodsIds = ""
    	 $("[name=goods]:checked").each(function(){
    		 goodsIds += $(this).val() + ",";
    	 });
    	 if(goodsIds != ''){
    		 goodsIds = goodsIds.substring(0,goodsIds.length-1);
    		 deleteGoods(goodsIds);
    	 }else{
    		 alert("请至少选择一个商品进行删除");
    	 }
     }
      
     /*
      * 上架
      */
      function upGoods(goodsIds){
    	if(confirm("您确认要上架商品吗?")){
    		var url = '${base}/platform/upGoods'
    			var args = {"goodsIds" : goodsIds};
    			$.post(url, args, function(data){
    				//成功
    				if(data.success){
    					alert("上架成功!");
    					location.reload([true]);
    				}else{//失败
    					alert("上架失败!");
    				}
    			});
    	}
     }

      /*
       * 批量上架
       */
       function upBatchGoods(){
    	 var goodsIds = ""
    	 $("[name=goods]:checked").each(function(){
    		 goodsIds += $(this).val() + ",";
    	 });
    	 if(goodsIds != ''){
    		 goodsIds = goodsIds.substring(0,goodsIds.length-1);
    		 upGoods(goodsIds);
    	 }else{
    		 alert("请至少选择一个商品进行上架");
    	 }
      }
      
       /*
        * 组合商品修改
        */
      function combinationDialog(goodsId,storeId) {
    	  layer.open({
              type: 2,
              move: false,
              shade: false,
              title: '修改组合商品',
              content:['${base}/platform/updateCombinationIndex?goodsId=' + goodsId + "&storeId=" + storeId, 'no'],
              area: ['600px', '300px'],
              btns: 2,
              btn: ['确定', '取消'],
              yes: function (index) {
            	  
            	  var allCombinationGoodsIdStr = "";
            	  layer.getChildFrame('[name=goodsCombination]:checked').each(function(){
            		  allCombinationGoodsIdStr += $(this).val() + ",";
            	  });
            	  
            	  var url = "${base}/platform/updateCombination";
            	  var args = {"goodsId":layer.getChildFrame('#goodsId').val(), "allCombinationGoodsIdStr":allCombinationGoodsIdStr};
            	  
            	  $.post(url, args, function(data){
            		 if(data == "true"){
            			 layer.msg('修改成功', {icon: 1});
            			 layer.close(index);
            		 }else{
            			 layer.msg('修改失败', {icon: 2});
            		 }
            	  });
            	  
              }, no: function () {
                  layer.close(index);
              }
          });
      }

</script>
</@layout.body>