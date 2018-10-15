<@p.header title="投诉管理"/>
<div class="layout">
	<div class="sidebar">
	</div>
	<div class="right-content">
		<div class="path">
			<div>
				<a href="${base}">商家中心</a> <span>></span> <a
					href="#?act=store_complain" /> 投诉管理 </a><span>></span>我的投诉
			</div>
		</div>
		<div class="main">

			<div class="wrap">
				<div class="tabmenu">
					<ul class="tab pngFix">
						<li class="active"><a
							href="#?act=store_complain&op=complain_accuser_list">我的投诉</a>
						</li>
						<li class="normal"><a
							href="#?act=store_complain&op=complain_accused_list">被投诉</a>
						</li>
					</ul>
				</div>
				<form id="list_form" method="get">
					<table class="search-form">
						<input type="hidden" id='act' name='act' value='' />
						<input type="hidden" id='op' name='op' value='' />
						<tr>
							<td>&nbsp;</td>
							<td class="w100 tr"><select class="goods_type"
								name="select_complain_state">
									<option value="0" selected=true>选择状态</option>
									<option value="1">进行中</option>
									<option value="2">已完成</option>
							</select>
							</td>
							<td class="w90 tc"><input type="submit" class="submit"
								onclick="submit_search_form()" value="搜索" />
							</td>
						</tr>
					</table>
				</form>
				<table class="ncu-table-style">
					<thead>
						<tr>
							<th class="w10"></th>
							<th class="tl">投诉人</th>
							<th class="tl">被投诉人</th>
							<th class="tl">投诉主题</th>
							<th>投诉时间</th>
							<th>投诉状态</th>
							<th class="w90">操作</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="20" class="norecord"><i>&nbsp;</i><span>暂无符合条件的数据记录</span>
							</td>
						</tr>
					</tbody>
					<tfoot>
					</tfoot>
				</table>
			</div>
			<script type="text/javascript">
				function submit_search_form() {
					$('#act').val('store_complain');
					$('#op').val("complain_accuser_list");
					$('#list_form').submit();
				}

				//收缩展开效果
				$(document).ready(function() {
					$(".sidebar dl dt").click(function(){
						$(this).toggleClass("hou");
						var sidebar_id = $(this).attr("id");
						var sidebar_dd = $(this).next("dd");
						sidebar_dd.slideToggle("slow", function() {
							$.cookie(COOKIE_PRE + sidebar_id, sidebar_dd.css("display"), {
								expires :7,
								path : '/'
							});
						});
					});
				});
			</script>
		</div>
	</div>
	<div class="clear"></div>
</div>

</body>
</html>
<@p.footer/>
