<@layout.head>
	<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
	<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
	<script type="text/javascript" src="${base}/res/js/layer/layer.js"></script>
	<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css" />
	<script type="text/javascript">
		$(function() {
			$('#formSearch').attr("action", "");
			$('#ncsubmit').click(function() {
				$('#formSearch').submit();
			});
		});
		var vadate = false;

		function delgoodsRecommend(recommendid) {
			//校验菜单底线是否含有子菜单
			valicountparent(recommendid);
			if (vadate) {
				if (confirm('您确定要删除吗?')) {
					var url = "${base}/goodsGroup/deleteid";
					var para = {
						"reCommendid": recommendid
					};
					$.ajax({
						type: "post",
						url: url,
						data: para,
						dataType: "json",
						async: false,
						success: function(data) {
							if (data.message == "true") {
								alert(data.result);
								window.location = "${base}/goodsGroup/list";
							} else {
								alert(data.result);
							}
						}
					});
				}
			} else {
				alert("请删除子菜单后再进行删除！");
			}
		}

		function valicountparent(reCommendid) {
			var url = "${base}/goodsGroup/validatereCommendid";
			var para = {
				"reCommendid": reCommendid
			};
			var va = $.ajax({
				type: "post",
				url: url,
				data: para,
				dataType: "json",
				async: false,
				success: function(data) {
					if (data) {
						vadate = true;
						return true;
					} else {
						vadate = false;
						return false;
					}
				}
			});
		}
		var clicknum = 1;

		function clickreCommend(reCommendid) {
				var num = 0;
				var ifrm = $("#layui-layer-iframe" + clicknum);
				var domInput = $("#reDiv > input");
				var inputVal = "";
				//num += domInput.size();
				layer.open({
					type: 2,
					title: '关联商品',
					shadeClose: true,
					shade: false,
					maxmin: true,
					area: ['770px', '450px'],
					content: '${base}/goods/goodsCommon/recommendlist?reCommendId=' + reCommendid, //iframe的url
					btns: 2,
					btn: ['确定', '取消'],
					yes: function(index) {
						var domframe = window.frames["layui-layer-iframe" + clicknum];
						var list = domframe.document.getElementsByName("ids");
						var attchValue = "";
						for (var i = 0; i < list.length; i++) {
							if (list[i].checked) {
								if (i == list.length - 1) {
									attchValue += list[i].value;
								} else {
									attchValue += list[i].value + ",";
								}
								num++;
							}
						};
						savegoodsRecommend(reCommendid, attchValue); //保存商品
						clicknum++;
						layer.close(index);
					},
					no: function(index) {
						clicknum++;
					},
					close: function(index) {
						clicknum++;
					}
				});
			}
			//关联商品的保存方法

		function savegoodsRecommend(recommendid, goodsids) {
			var url = "${base}/RelGoodsRecommend/save";
			var para = {
				"reCommendid": recommendid,
				"goodsids": goodsids,
			};
			$.ajax({
				type: "post",
				url: url,
				data: para,
				dataType: "json",
				async: false,
				success: function(data) {
					if (data.message == "true") {
						alert(data.result);
					} else {
						alert(data.result);
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
				<h3>首页商品推荐管理</h3>
				<ul class="tab-base">
					<li><a href="${base}/goodsGroup/list" class="current"><span>管理</span></a></li>
					<@shiro.hasPermission name="sys:tag:edit">
					<li><a href="${base}/goodsGroup/forward?reCommendid=0"><span>新增</span></a></li>
					</@shiro.hasPermission>
				</ul>
			</div>
		</div>
		<div class="fixed-empty"></div>
		<form method="post" name="formSearch" id="formSearch" action="${base}/adv/list">
			<input type="hidden" name="pageNo" value="${pager.pageNo}">
			<table class="tb-type1 noborder search">
				<tbody>
					<tr>
						<td>
							栏目描述:
						</td>
						<td>
							<input name="recommendInfo" value="${recommendInfo}" class="txt">
						</td>
						<td><a href="javascript:void(0);" id="ncsubmit" class="btn-search " title="查询">&nbsp;</a>
							<a href="${base}/goodsGroup/list" class="btns "><span>撤销检索</span></a>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<table class="table tb-type2" id="prompt">
		</table>
		<form method="post" id="form_member">
			<input type="hidden" name="form_submit" value="ok" />
			<table class="table tb-type2 nobdb">
				<thead>
					<tr class="thead">
						<th>&nbsp;</th>
						<th class="align-center">推荐商品栏目</th>
						<th class="align-center">推荐商品栏目描述</th>
						<th class="align-center">是否启用</th>
						<th class="align-center">添加时间</th>
						<th class="align-center">操作</th>
					</tr>
					<tbody>
						<#list pager.result as goodsRecommend>
							<tr class="hover">
								<td class="w24"></td>
								<td class="align-center">${goodsRecommend.recommendName}</td>
								<td class="align-center">${goodsRecommend.recommendInfo}</td>
								<td class="align-center">
									<#if goodsRecommend.recommendUse ??&& goodsRecommend.recommendUse==1>
										启用
										<#else>
											停用
									</#if>
								</td>
								<td class="align-center">${goodsRecommend.createTimeStr}</td>
								<td class="align-center"><@shiro.hasPermission name="sys:tag:edit">
									<a href="${base}/goodsGroup/forward?reCommendid=${goodsRecommend.reCommendid}" title="编辑">编辑</a> | <a href="JavaScript:void(0);" onclick="delgoodsRecommend('${goodsRecommend.reCommendid}')" title="删除">删除</a> | </@shiro.hasPermission><a href="${base}/RelGoodsRecommend/checkrecommendlist?reCommendId=${goodsRecommend.reCommendid}"
									title="查看商品">查看商品</a> <@shiro.hasPermission name="sys:tag:edit"> | <a href="JavaScript:void(0);" onclick="clickreCommend('${goodsRecommend.reCommendid}')" title="关联商品">关联商品</a></@shiro.hasPermission>
								</td>
							</tr>
						</#list>
					</tbody>
					<tfoot class="tfoot">
						<tr>
							<td colspan="16">
								<@layout.pager pager/>
							</td>
						</tr>
					</tfoot>
			</table>
		</form>
	</div>
</@layout.body>