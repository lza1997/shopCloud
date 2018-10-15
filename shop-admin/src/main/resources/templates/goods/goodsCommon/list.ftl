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

    function deleteGoods(){
        var items = $("input[name='ids']:checked").length;
        if (items==0) {
            alert("请至少选择一个要删除的项目");
        }else{
            if(confirm('您确定要删除吗?')){
                $("#form_list").attr("action",APP_BASE+"/goods/goodsCommon/delGoods");
                $('#form_list').submit();
            }
        }
    }

    function wgxjGoods(){
        var items = $("input[name='ids']:checked").length;
        if (items==0) {
            alert("请至少选择一个要下架的项目");
        }else{
            var item = "";
            $("input[name='ids']:checked").each(function(){
                item += this.value+",";
            });
           item = item.substring(0,item.length-1);
            goods_lockup(item);
        }
    }
    //商品审核通过
    function oNApply(id){
    	layer.confirm('您确定要通过该商品的审核吗?', {icon: 3}, function(index){
    		$("#form_list").attr("action",APP_BASE+"/goods/goodsCommon/oNApply?goodsId="+id);
            $('#form_list').submit();   	    
    	});
    }
   //商品审核拒绝
    function offApply(id){
    	layer.confirm('您确定要拒绝该商品的审核吗?', {icon: 3}, function(index){
    		$("#form_list").attr("action",APP_BASE+"/goods/goodsCommon/offApply?goodsId="+id);
            $('#form_list').submit();   	    
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
                <li><a href="JavaScript:void(0);" class="current"><span>所有商品</span></a></li>
                <li><a href="${base}/goods/goodsCommon/downList" ><span>违规下架商品</span></a></li>
                <li><a href="${base}/goods/goodsCommon/goodsApply" ><span>待审核商品</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form method="post" name="formSearch" id="formSearch" action="${base}/goods/goodsCommon/list">
        <input type="hidden" name="pageNo" value="${pager.pageNo}">
        <#assign goodsGcId = gcommon.gcId>
        <#assign goodsBrandId = gcommon.brandId>
        <table class="tb-type1 noborder search">
            <tbody>
            <tr>
                <th><label for="search_goods_name">商品名称:</label></th>
                <td><input type="text" value="${goods.goodsName}" name="goodsName" id="search_goods_name" class="txt"></td>
                <th><label for="search_commonid">商品货号:</label></th>
                <td><input type="text" value="${goods.goodsSerial}" name="goodsSerial" id="search_commonid" class="txt" /></td>
                <th><label>分类</label></th>
                <td id="gcategory" colspan="8" style="width:600px">
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
                </td>
            </tr>
            <tr>
                <th><label for="search_store_name">所属店铺:</label></th>
                <td>
                <input type="text" name="storeName" id="search_store_name" class="txt" value="${goods.storeName}">
                </td>
                <th><label>品&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;牌:</label></th>
                <td><select name="brandId">
                    <option value="">请选择...</option>
                <#list brandList as brand>
                    <option value="${brand.brandId}" <#if gcommon.brandId == brand.brandId>selected="selected" </#if>>${brand.brandName}</option>
                </#list>
                </select></td>
                <th><label>商品状态:</label></th>
                <td>
	                <select name="goodsShow">
	                    <option value="" <#if gcommon.goodsShow == null>selected="selected"</#if>>请选择...</option>
	                    <option value="1" <#if gcommon.goodsShow == 1>selected="selected"</#if>>上架</option>
	                    <option value="0" <#if gcommon.goodsShow == 0>selected="selected"</#if>>下架</option>
	                </select>
                </td>
                <th><label>审核状态:</label></th>
                <td>
	                <select name=goodsState>
	                    <option value="" <#if gcommon.goodsState == null>selected="selected"</#if>>请选择...</option>
	                    <option value="60" <#if gcommon.goodsState == 60>selected="selected"</#if>>待审核</option>
	                    <option value="30" <#if gcommon.goodsState == 30>selected="selected"</#if>>已通过</option>
	                    <option value="50" <#if gcommon.goodsState == 50>selected="selected"</#if>>已拒绝</option>
	                    <option value="40" <#if gcommon.goodsState == 40>selected="selected"</#if>>违规</option>
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
                <li>上架,下架，当商品处于非违规下架状态时，前台能浏览该商品，店主可控制商品上、下架状态</li>
                <li>违规下架，当商品处于违规下架状态时，前台将不能浏览该商品，管理员可控制商品违规下架状态，并且违规下架商品被商家重新编辑后可以上架</li>
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
	                <td><input type="checkbox" name="ids" value="${goods.goodsId}" class="checkitem"></td>
	                <td><i class="icon-plus-sign" style="cursor: pointer;" nctype="ajaxGoodsList" data-comminid="${goods.goodsId}"
	                       title="点击展开查看此商品全部规格；规格值过多时请横向拖动区域内的滚动条进行浏览。"></i></td>
	                <td class="w60 align-center">${goods.goodsId}</td>
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
	                	<#if goods.goodsState==60>待审核</#if>
	                    <#if goods.goodsState==30>已通过</#if>
	                    <#if goods.goodsState==50>已拒绝</#if>
	                    <#if goods.goodsState==40>违规</#if>
                    </td>
	                <td class="align-center">
	                	<p><a href="${frontServer}/product/detail?id=${goods.goodsId}" target="_blank">查看</a></p>
	                	<#if goods.goodsState == 30 && goods.goodsShow==1>
	                		<p><a href="javascript:void(0);" onclick="goods_lockup(${goods.goodsId});">违规下架</a></p>
	                	</#if>
	                	<#if goods.goodsState == 60 && goods.goodsShow==1>
	                		<p><a onclick="oNApply('${goods.goodsId}')">通过</a></p>
	                		<p><a onclick="offApply('${goods.goodsId}')">拒绝</a></p>
	                	</#if>
	                    
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
                    &nbsp;&nbsp;<a href="JavaScript:void(0);" class="btn" nctype="lockup_batch" onclick="wgxjGoods()"><span>违规下架</span></a> <a href="JavaScript:void(0);" class="btn" nctype="del_batch" onclick="deleteGoods()"><span>删除</span></a>
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
                                            '<a href="${frontServer}/product/detail?id='+o.goodsId+'" target="_blank"><image src="${imgServer}'+ o.goodsImage + '" ></a></div>'
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

    // 获得选中ID
    function getId() {
        var str = '';
        $('#form_goods').find('input[name="id[]"]:checked').each(function(){
            id = parseInt($(this).val());
            if (!isNaN(id)) {
                str += id + ',';
            }
        });
        if (str == '') {
            return false;
        }
        str = str.substr(0, (str.length - 1));
        return str;
    }

    // 商品下架
    function goods_lockup(ids) {
        _uri = APP_BASE+"/goods/goodsCommon/remark?id="+ids ;
        CUR_DIALOG = ajax_form('goods_lockup', '违规下架理由', _uri, 350);
    }
</script>
</@layout.body>