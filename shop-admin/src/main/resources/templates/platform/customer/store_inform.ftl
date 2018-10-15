<@p.header title="被举报禁止"/>
<div class="layout">
  <div class="sidebar">
    
  </div>
  <div class="right-content">
        <div class="path">
      <div><a href="${base}">商家中心</a> <span>></span>
                <a href="#?act=store_inform"/>
                被举报禁售                </a><span>></span>被举报禁售              </div>
    </div>
        <div class="main">
      
<div class="wrap">
  <div class="tabmenu">
    <ul class="tab pngFix">
  <li class="active"><a  href="#?act=store_inform&op=inform_list">被举报禁售</a></li></ul>
  </div>
  <table class="ncu-table-style">
    <thead>
      <tr>
        <th class="w10"></th>
        <th class="w200 tl">商品名称</th>
        <th class="w100">举报类型</th>
        <th>举报主题</th>
        <th class="w70">图片</th>
        <th class="w100">举报时间</th>
        <th class="w80">处理结果</th>
        <th class="w70">操作</th>
      </tr>
    </thead>
    <tbody>
            <tr>
        <td colspan="20" class="norecord"><i>&nbsp;</i><span>暂无符合条件的数据记录</span></td>
      </tr>
          </tbody>
    <tfoot>
          </tfoot>
  </table>
</div>
<script type="text/javascript">
$(document).ready(function(){
    $(".inform_detail").hide();
    $(".show_detail").click(function(){
        $(".inform_detail").hide();
        $(this).parents("tr").next(".inform_detail").show();
    });
    $(".close_detail").click(function(){
        $(this).parents(".inform_detail").hide();
    });
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
    </div>
  </div>
    <div class="clear"></div>
</div>

</body>
</html>
<@p.footer/>