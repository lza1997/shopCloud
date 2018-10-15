<@p.header title="退款记录"/>
<div class="layout">
    <div class="sidebar">
    </div>
  <div class="right-content">
        <div class="path">
      <div><a href="${base}">商家中心</a> <span>></span>
                <a href="#?act=refund"/>
                退款记录                </a><span>></span>退款记录              </div>
    </div>
        <div class="main">
      <link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/smoothness/jquery.ui.css"  />
<div class="wrap">
  <div class="tabmenu">
    <ul class="tab pngFix">
  <li class="active"><a  href="#?act=refund">退款记录</a></li></ul>
  </div>
  <form method="get" action="#?>
        <input type="hidden" name="act" value="refund" />
    <table class="search-form">
      <tr>
        <td>&nbsp;</td>
        <th style="width:115px"><select name="type">
            <option value="order_sn" >订单编号</option>
            <option value="refund_sn" >退款编号</option>
            <option value="buyer_name" >买家会员名</option>
          </select>
          ：</th>
        <td class="w160"><input type="text" class="text" name="key" value="" /></td>
        <th>退款时间：</th>
        <td class="w180"><input name="add_time_from" id="add_time_from" type="text" class="text" value="" />
          &#8211;
          <input name="add_time_to" id="add_time_to" type="text" class="text" value="" /></td>
        <td class="w90 tc"><input type="submit" class="submit" value="搜索" /></td>
      </tr>
    </table>
  </form>
  <table class="ncu-table-style">
    <thead>
      <tr>
        <th class="w180">订单编号</th>
        <th class="w180">退款编号</th>
        <th>买家会员名</th>
        <th class="w80">退款金额</th>
        <th class="w150">退款时间</th>
        <th class="w90">状态</th>
        <th class="w90">操作</th>
      </tr>
    </thead>
    <tbody>
          <tbody>
      <tr>
        <td colspan="20" class="norecord"><i>&nbsp;</i><span>暂无符合条件的数据记录</span></td>
      </tr>
    </tbody>
      </table>
</div>
<!-- <script type="text/javascript" src="http://192.168.1.230/resource/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>  -->
    </div>
  </div>
  <div class="clear"></div>
</div>

<script type="text/javascript">
    $(function(){
	    $('#add_time_from').datepicker({dateFormat: 'yy-mm-dd'});
	    $('#add_time_to').datepicker({dateFormat: 'yy-mm-dd'});
	});
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
</body>
</html>
<@p.footer/>