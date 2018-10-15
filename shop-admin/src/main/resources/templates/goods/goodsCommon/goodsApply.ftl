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
<script type="text/javascript" src="${base}/res/js/layer/layer.js" charset="utf-8"></script>
<script type="text/javascript">
    $(function(){
        $('#ncsubmit').click(function(){
            $('#formSearch').submit();
        });
    });
	//删除待审核商品
    function deleteGoods(){
        var items = $("input[name='ids']:checked").length;
        if (items==0) {
        	layer.msg('请至少选择一个要删除的项目', {icon: 2});
        }else{
        	layer.confirm('您确定要删除吗?', {icon: 3}, function(index){
        		 $("#form_goods").attr("action",APP_BASE+"/goods/goodsCommon/deldownGoods");
	             $('#form_goods').submit();	    
        	});
        }
    }
    //商品审核通过
    function oNApply(id){
    	layer.confirm('您确定要通过该商品的审核吗?', {icon: 3}, function(index){
    		$("#form_goods").attr("action",APP_BASE+"/goods/goodsCommon/oNApply?goodsId="+id);
            $('#form_goods').submit();   	    
    	});
    }
  //商品审核拒绝
    function offApply(id){
    	layer.confirm('您确定要拒绝该商品的审核吗?', {icon: 3}, function(index){
    		$("#form_goods").attr("action",APP_BASE+"/goods/goodsCommon/offApply?goodsId="+id);
            $('#form_goods').submit();   	    
    	});
    }
</script>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>商品</h3>
            <ul class="tab-base">
                <li><a href="${base}/goods/goodsCommon/list"><span>所有商品</span></a></li>
                <li><a href="${base}/goods/goodsCommon/downList"><span>违规下架商品</span></a></li>
                <li><a href="JavaScript:void(0);" class="current"><span>待审核商品</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form method="post" name="formSearch" id="formSearch">
        <input type="hidden" name="pageNo" value="${pager.pageNo}">
        <table class="tb-type1 noborder search">
            <tbody>
            <tr>
                <th> <label for="search_goods_name">商品名称</label></th>
                <td><input type="text" value="${gcommon.goodsName}" name="goodsName" id="search_goods_name" class="txt"></td>
                <th><label>分类</label></th>
                <td id="gcategory" colspan="8"><input type="hidden" id="cate_id" name="gcId" value="" class="mls_id" />
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
                 </td>
            </tr>
            <tr>
                <th><label for="search_store_name">所属店铺</label></th>
                <td><input type="text" value="${gcommon.goodsId.storeName}" name="storeName" id="search_store_name" class="txt"></td>
                <th><label>品牌</label></th>
                <td><select name="brandId">
                        <option value="">请选择...</option>
                        <#list brandList as brand>
                            <option value="${brand.brandId}" <#if gcommon.brandId == brand.brandId>selected="selected" </#if>>${brand.brandName}</option>
                        </#list>
                     </select>
                    <a href="javascript:void(0);" id="ncsubmit" class="btn-search " title="查询">&nbsp;</a>
                </td>
            </tr>
            </tbody>
        </table>
    </form>
    <form method='post' id="form_goods" action="${base}/goods/goodsCommon/delGoods">
        <table class="table tb-type2">
            <thead>
            <tr class="space">
                <th colspan="15">列表</th>
            </tr>
            <tr class="thead">
                <th></th>
                <th class="w24"></th>
                <th>平台货号</th>
                <th colspan="2">商品名称</th>
                <th>品牌&分类</th>
                <th class="align-center">价格</th>
                <th class="align-center">商品状态</th>
                <th class="align-center">商品审核状态</th>
                <th class="align-center">操作</th>
            </tr>
            </thead>
            <tbody>
            <#if pager.result??>
	            <#list pager.result as goods>
	            <tr class="hover edit">
	                <td class="w24"><input type="checkbox" name="ids" value="${goods.goodsId}" class="checkitem"></td>
	                <td><i class="icon-plus-sign" nctype="ajaxGoodsList" data-comminid="${common.goodsCommonid}" style="cursor: pointer;"></i></td>
	                <td>${goods.goodsId}</td>
	                <td class="w60 picture"><div class="size-56x56"><span class="thumb size-56x56"><i></i>
	                    <img src="${imgServer}${goods.goodsImage}" onload="javascript:DrawImage(this,56,56);"/>
	                </span></div></td>
	                <td class="goods-name w270"><p><span>${goods.goodsName}</span></p>
	                    <p class="store">所属店铺:${goods.storeName}</p></td>
	                <td class="w200">
	                    <p>${goods.brandName}</p>
	                    <p>${goods.gcName}</p>
	                </td>
	                <td class="align-center">￥${goods.goodsStorePrice}</td>
	                <td class="align-center">
	                	<#if goods.goodsShow==0>下架</#if>
	                    <#if goods.goodsShow==1>上架</#if>
                    </td>
	                <td class="align-center">
	                    待审核
	                </td>
	                <td class="w48 align-center">
	                	<p><a href="${frontServer}/product/detail?id=${goods.goodsId}" target="_blank">查看</a></p>
	                	<p><a onclick="oNApply('${goods.goodsId}')">通过</a></p>
	                	<p><a onclick="offApply('${goods.goodsId}')">拒绝</a></p>
	                </td>
	                
	            </tr>
	            <tr style="display:none;"><td colspan="20"><div class="ncsc-goods-sku ps-container"></div></td></tr>
	            </#list>
            </#if>
            </tbody>
            <tfoot>
            <tr class="tfoot">
                <td><input type="checkbox" class="checkall" id="checkallBottom"></td>
                <td colspan="16"><label for="checkallBottom">全选</label>
                    &nbsp;&nbsp;<a href="JavaScript:void(0);" class="btn" nctype="del_batch" onclick="deleteGoods()"><span>删除</span></a>
                    <@layout.pager pager/>
                </td>
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
        $('#ncsubmit').click(function(){
            $('input[name="op"]').val('goods');$('#formSearch').submit();
        });

        // ajax获取商品列表
        $('i[nctype="ajaxGoodsList"]').toggle(
                function(){
                    $(this).removeClass('icon-plus-sign').addClass('icon-minus-sign');
                    var _parenttr = $(this).parents('tr');
                    var _commonid = $(this).attr('data-comminid');
                    var _div = _parenttr.next().find('.ncsc-goods-sku');
                    if (_div.html() == '') {
                        $.getJSON(APP_BASE+'/goods/goodsCommon/getGoods' , {commonids : _commonid}, function(data){
                            if (data != 'false') {
                                var _ul = $('<ul class="ncsc-goods-sku-list"></ul>');
                                $.each(data, function(i, o){
                                    $('<li><div class="goods-thumb" title="商家货号：' + o.goodsCommonid + '">' +
                                            '<a href="${frontServer}/product/detail?id='+o.goodsId+'" target="_blank"><image src="' +APP_BASE+"/upload/goods"+ o.goodsImage + '" ></a></div>'
                                            + '<div class="goods_spec">颜色<em title=""></em></div>'
                                            + '<div class="goods-price">价格：<em title="￥' + o.goodsPrice + '">￥' + o.goodsPrice + '</em></div><div class="goods-storage">库存：<em title="' + o.goodsStorage + '">' + o.goodsStorage + '</em></div><a href="${frontServer}/product/detail?id='+o.goodsId+'" target="_blank" class="ncsc-btn-mini">查看商品详情</a></li>').appendTo(_ul);
                                });
                                _ul.appendTo(_div);
                                _parenttr.next().show();
                                // 计算div的宽度
                                _div.css('width', document.body.clientWidth-54);
                                _div.perfectScrollbar();
                            }
                        });
                    } else {
                        _parenttr.next().show()
                    }
                },
                function(){
                    $(this).removeClass('icon-minus-sign').addClass('icon-plus-sign');
                    $(this).parents('tr').next().hide();
                }
        );
    });
</script>
</@layout.body>