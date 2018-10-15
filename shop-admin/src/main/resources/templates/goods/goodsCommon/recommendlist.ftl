<@layout.head>
	<link href="${base}/res/css/font/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
	<!--[if IE 7]>
  <link rel="stylesheet" href="${base}/res/css/font/font-awesome/css/font-awesome-ie7.min.css">
<![endif]-->
	<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
	<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
	<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css" />
	<script type="text/javascript" src="${base}/res/js/common_select.js" charset="utf-8"></script>
	<script type="text/javascript" src="${base}/res/js/dialog/dialog.js" id="dialog_js" charset="utf-8"></script>
	<link rel="stylesheet" type="text/css" href="${base}/res/js/dialog/dialog.css" />
	<script type="text/javascript" src="${base}/res/js/perfect-scrollbar.min.js"></script>
	<script type="text/javascript" src="${base}/res/js/jquery.mousewheel.js"></script>
	<script type="text/javascript">
		$(function() {
			$('#ncsubmit').click(function() {
				$('#formSearch').submit();
			});
		});

		function deleteGoods() {
			var items = $("input[name='ids']:checked").length;
			if (items == 0) {
				alert("请至少选择一个要删除的项目");
			} else {
				if (confirm('您确定要删除吗?')) {
					$("#form_list").attr("action",
						APP_BASE + "/goods/goodsCommon/delGoods");
					$('#form_list').submit();
				}
			}
		}

		function wgxjGoods() {
			var items = $("input[name='ids']:checked").length;
			if (items == 0) {
				alert("请至少选择一个要下架的项目");
			} else {
				var item = "";
				$("input[name='ids']:checked").each(function() {
					item += this.value + ",";
				});
				item = item.substring(0, item.length - 1);
				goods_lockup(item);
			}
		}
	</script>
</@layout.head>
<@layout.body>
	<div class="page">
		<form method="post" name="formSearch" id="formSearch" action="${base}/goods/goodsCommon/recommendlist">
			<input type="hidden" name="pageNo" value="${pager.pageNo}">
			<table class="tb-type1 noborder search">
				<tbody>
					<tr>
						<th>
							<label for="search_goods_name">商品名称</label>
						</th>
						<td>
							<input type="text" value="${goods.goodsName}" name="goodsName" id="search_goods_name" class="txt">
						</td>
						<td><a href="javascript:void(0);" id="ncsubmit" class="btn-search " title="查询">&nbsp;</a>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<!--  <table class="table tb-type2" id="prompt">
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
    </table> -->
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
					</tr>
				</thead>
				<tbody>
					<#if pager.result??>
						<#list pager.result as goods>
							<tr class="hover edit">
								<td>
									<input type="checkbox" name="ids" id="ids" value="${goods.goodsId}" class="checkitem">
								</td>
								<td><i class="icon-plus-sign" style="cursor: pointer;" nctype="ajaxGoodsList" data-comminid="${goods.goodsId}" title="点击展开查看此商品全部规格；规格值过多时请横向拖动区域内的滚动条进行浏览。"></i>
								</td>
								<td class="w60 align-center">${goods.goodsId}</td>
								<td class="w60 picture">
									<div class="size-56x56">
										<span class="thumb size-56x56"><i></i> <a
										href="${frontServer}/product/detail?id=${goods.goodsId}"
										target="_blank"> <img src="${imgServer}${goods.goodsImage}"
									onload="javascript:DrawImage(this,56,56);" /> </a> </span>
									</div>
								</td>
								<td class="goods-name w270">
									<p>
										<a href="${frontServer}/product/detail?id=${regoods.goods.goodsId}" target="_blank">
											<span>${goods.goodsName}</span>
										</a>
									</p>
									<p class="store">所属店铺:${goods.storeName}</p>
								</td>
								<td>
									<p>${goods.brandName}</p>
									<p>${goods.gcName}</p>
								</td>
								<td class="align-center">￥${goods.goodsStorePrice}</td>
								<td class="align-center">
									<#if goods.goodsShow==0>下架</#if>
									<#if goods.goodsShow==1>上架</#if>
									<#if goods.goodsState==1>(违规)</#if>
								</td>
							</tr>
							<tr style="display:none;">
								<td colspan="20">
									<div class="ncsc-goods-sku ps-container"></div>
								</td>
							</tr>
						</#list>
					</#if>
				</tbody>
				<tfoot>
					<tr class="tfoot">
						<td>
							<input type="checkbox" class="checkall" id="checkallBottom">
						</td>
						<td colspan="16">
							<label for="checkallBottom">全选</label>
							<@layout.pager pager/>
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>

	<script type="text/javascript">
		$(function() {
			gcategoryInit("gcategory");
			// ajax获取商品列表
			$('i[nctype="ajaxGoodsList"]')
				.toggle(
					function() {
						$(this).removeClass('icon-plus-sign').addClass(
							'icon-minus-sign');
						var _parenttr = $(this).parents('tr');
						var _commonid = $(this).attr('data-comminid');
						var _div = _parenttr.next().find('.ncsc-goods-sku');
						if (_div.html() == '') {
							$
								.getJSON(
									APP_BASE + '/goods/goodsCommon/getGoods', {
										commonids: _commonid
									},
									function(data) {
										if (data != 'false') {
											var _ul = $('<ul class="ncsc-goods-sku-list"></ul>');
											$
												.each(
													data,
													function(
														i,
														o) {
														$(
																'<li><div class="goods-thumb" title="商家货号：' + o.goodsCommonid + '">' + '<a href="${frontServer}/product/detail?id=' + o.goodsId + '" target="_blank"><image src="${imgServer}' + o.goodsImage + '" ></a></div>' + '<div class="goods_spec">颜色<em title=""></em></div>' + '<div class="goods-price">价格：<em title="￥' + o.goodsPrice + '">￥' + o.goodsPrice + '</em></div><div class="goods-storage">库存：<em title="' + o.goodsStorage + '">' + o.goodsStorage + '</em></div><a href="${frontServer}/product/detail?id=' + o.goodsId + '" target="_blank" class="ncsc-btn-mini">查看商品详情</a></li>')
															.appendTo(
																_ul);
													});
											_ul.appendTo(_div);
											_parenttr.next().show();
											// 计算div的宽度
											_div
												.css(
													'width',
													document.body.clientWidth - 54);
											_div.perfectScrollbar();
										}
									});
						} else {
							_parenttr.next().show()
						}
					},
					function() {
						$(this).removeClass('icon-minus-sign').addClass(
							'icon-plus-sign');
						$(this).parents('tr').next().hide();
					});
		});
		 // 获得选中ID
		function getId() {
				var str = '';
				$('#form_goods').find('input[name="id[]"]:checked').each(function() {
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
			_uri = APP_BASE + "/goods/goodsCommon/remark?id=" + ids;
			CUR_DIALOG = ajax_form('goods_lockup', '违规下架理由', _uri, 350);
		}
	</script>
</@layout.body>