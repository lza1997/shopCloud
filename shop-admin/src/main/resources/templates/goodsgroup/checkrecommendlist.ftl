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
	</script>
	<style>
		.fixed-empty {
			height: 0px !important;
		}
	</style>
</@layout.head>
<@layout.body>
	<div class="page">
		<div class="fixed-empty"></div>
		<form method="post" name="formSearch" id="formSearch" action="${base}/RelGoodsRecommend/checkrecommendlist">
			<input type="hidden" name="pageNo" value="${pager.pageNo}">
			 <input type="hidden" name="reCommendId" value="${reCommendId}"/>
			<table class="tb-type1 noborder search">
				<tbody>
					<tr>
						<th>
							<label for="search_goods_name">商品名称</label>
						</th>
						<td>
							<input type="text" value="${goodsName}" name="goodsName" id="search_goods_name" class="txt">
						</td>
						<td><a href="javascript:void(0);" id="ncsubmit" class="btn-search " title="查询">&nbsp;</a></td>
					</tr>
				</tbody>
			</table>
		</form>
		<table class="table tb-type2" id="prompt">
			<tbody>
				<tr class="space odd">
					<th colspan="12">
						<div class="title">
							<h5>操作提示</h5>
							<span class="arrow"></span></div>
					</th>
				</tr>
				<tr>
					<td>
						<ul>
							<li>填写合适的排序值，前台首页，里的新品，推荐将按照此排序值排序</li>
						</ul>
					</td>
				</tr>
			</tbody>
		</table>
		<form method='post' id="form_list" action="${base}/RelGoodsRecommend/update">
			<input type="hidden" name="form_submit" value="ok" />
			<table class="table tb-type2">
				<thead>
					<tr class="thead">
						<th class="w24">排序</th>
						<th class="align-center">平台货号</th>
						<th colspan="2">商品名称</th>
						<th>品牌&分类</th>
						<th class="align-center">价格</th>
						<th class="align-center">商品状态</th>
						<th class="w48 align-center">操作 </th>
					</tr>
				</thead>
				<tbody>
					<#if checklist??>
						<#list checklist as regoods>
							<tr class="hover edit">
								<td>
								    <input type="hidden" name="relId" value="${regoods.relId}"/>
									<input type="text" name="sort" id="sort" value="${regoods.sort}"  style="width: 24px;">
								</td>
								<td class="w60 align-center">
									${regoods.goods.goodsId}
								</td>
								<td class="w60 picture">
									<div class="size-56x56">
										<span class="thumb size-56x56">
					                     <i></i>
					                      <a href="${frontServer}/product/detail?id=${regoods.goods.goodsId}" target="_blank">
					                        <img src="${imgServer}${regoods.goods.goodsImage}" onload="javascript:DrawImage(this,56,56);"/>
					                      </a>
						                </span>
									</div>
								</td>
								<td class="goods-name w270">
									<p>
									   <a href="${frontServer}/product/detail?id=${regoods.goods.goodsId}" target="_blank">
											<span>
						                    	${regoods.goods.goodsName}
						                    </span>
					                    </a>
									</p>
									<p class="store">
										所属店铺:${regoods.goods.storeName}
									</p>
								</td>
								<td>
									<p>${regoods.goods.brandName}</p>
									<p>${regoods.goods.gcName}</p>
								</td>
								<td class="align-center">
									￥${regoods.goods.goodsStorePrice}
								</td>
								<td class="align-center">
									<#if regoods.goods.goodsShow==0>下架</#if>
									<#if regoods.goods.goodsShow==1>上架</#if>
									<#if regoods.goods.goodsState==1>(违规)</#if>
								</td>
								<td class="align-center">
									<p><a href="javascript:void(0);" onclick="delrecommend('${regoods.relId}');">删除</a></p>
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
			        <tr>
			            <td colspan="2"><a href="JavaScript:void(0);" class="btn" id="submitBtn"><span>提交</span></a></td>
			        </tr>
		        </tfoot>
			</table>
		</form>
	</div>

	<script type="text/javascript">
		$(function(){
		    //排序
	        $("#submitBtn").click(function(){
	            $("#form_list").submit();
	        });
	        //搜索
	        $("#ncsubmit").click(function(){
	            $("#formSearch").submit();
	        });
        });
        
		function delrecommend(id) {
			//校验菜单底线是否含有子菜单
			if (confirm('您确定要删除吗?')) {
				var url = "${base}/RelGoodsRecommend/delete";
				var para = {
					"id": id
				};
				$.ajax({
					type: "post",
					url: url,
					data: para,
					dataType: "json",
					async: false,
					success: function(data) {
						if (data.success == "true") {
							alert(data.result);
							window.location = '${base}/RelGoodsRecommend/checkrecommendlist?reCommendId=' + '${reCommendId}';
						} else {
							alert(data.result);
						}
					}
				});
			}
		}
		
		
	</script>
</@layout.body>