<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/common_select.js"></script>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>动态管理</h3>
            <ul class="tab-base">
                <li><a href="JavaScript:void(0);" class="current"><span>动态列表</span></a></li>
                <#--<li><a href="#?act=sns_strace&op=scomm_list"><span>评论列表</span></a></li>-->
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form method="post" name="formSearch">
        <input type="hidden" name="pageNo" value="${pager.pageNo}">
        <table class="tb-type1 noborder search">
            <tbody>
            <tr>
                <th><label for="search_uname">店铺名称</label></th>
                <td><input type="text" value="${traceLog.straceStorename}" name="straceStorename" id="search_sname" class="txt"></td>
                <th><label for="search_content">内容</label></th>
                <td><input type="text" value="${traceLog.straceContent}" name="straceContent" id="search_scontent" class="txt"></td>
                <th><label>动态类型</label></th>
                <td><select name="straceType">
                    <option value='0'>请选择...</option>
                    <option value="2" <#if traceLog.straceType == 2>selected="selected"</#if>>新鲜事</option>
                    <option value="3" <#if traceLog.straceType == 3>selected="selected"</#if>>新品</option>
                    <option value="4" <#if traceLog.straceType == 4>selected="selected"</#if>>优惠券</option>
                    <option value="5" <#if traceLog.straceType == 5>selected="selected"</#if>>限时折扣</option>
                    <option value="6" <#if traceLog.straceType == 6>selected="selected"</#if>>满即送</option>
                    <option value="7" <#if traceLog.straceType == 7>selected="selected"</#if>>优惠套装</option>
                    <option value="8" <#if traceLog.straceType == 8>selected="selected"</#if>>团购</option>
                    <option value="9" <#if traceLog.straceType == 9>selected="selected"</#if>>推荐</option>
                    <option value="10" <#if traceLog.straceType == 10>selected="selected"</#if>>热销商品</option>
                </select></td>
                <th><label for="search_stime">发表时间</label></th>
                <td><input type="text" class="txt date" value="${traceLog.starttime}" name="starttime" id="search_stime" class="txt">
                    <label for="search_etime">~</label>
                    <input type="text" class="txt date" value="${traceLog.endtime}" name="endtime" id="search_etime" class="txt">
                    <a href="javascript:document.formSearch.submit();" class="btn-search " title="查询">&nbsp;</a></td>
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
                <li>如果动态信息存在不合法内容您可以将其状态设置为屏蔽或者直接删除</li>
                <li>动态删除后其对应的评论也一并删除，请慎重</li>
            </ul></td>
        </tr>
        </tbody>
    </table>
    <form method='post' id="form_trace" action="">
        <table class="table tb-type2">
            <tbody>
            <#list pager.result as log>
            <tr class="hover edit">
                <td style="vertical-align:top;"><input type="checkbox" name="ids" value="${log.straceId}" class="checkitem"></td>
                <td class="fd-list">
                    <!-- 动态列表start -->
                    <li>
                        <div class="fd-aside">
              	<span class="thumb size60">
					<a href="javascript:;" target="_blank">
                        <img onload="javascript:DrawImage(this,60,60);" src="${imgServer}${log.straceStorelogo}">
                    </a>
              	</span>
                        </div>
                        <dl class="fd-wrap">
                            <dt>
                            <h3><a href="javascript:;">${log.straceStorename}</a>：</h3>
                            <h5>${log.straceTitle}</h5>
                            </dt>
                            <dd>
                                ${log.straceContent}
                            </dd>
                            <dd>
                                <span class="fc-time fl">${log.straceTime}</span> <span class="fr">转发&nbsp;|&nbsp;<a href="javascript:;">评论</a></span>&nbsp;&nbsp;状态:<#if log.straceState == 0><font style='color:red;'>屏蔽</font><#else>正常</#if></span>
                            </dd>
                            <div class="clear"></div>
                        </dl>
                    </li>
                    <!-- 动态列表end -->
                </td>
            </tr>
            </#list>
            </tbody>
            <tfoot>
            <tr class="tfoot">
                <td class="w24"><input type="checkbox" class="checkall" id="checkallBottom"></td>
                <td colspan="16"><label for="checkallBottom">全选</label>
                    &nbsp;&nbsp; <a href="JavaScript:void(0);" class="btn" onclick="submit_form('del');"><span>删除</span></a> <a href="JavaScript:void(0);" class="btn" onclick="submit_form('hide');"><span>屏蔽</span></a> <a href="JavaScript:void(0);" class="btn" onclick="submit_form('show');"><span>显示</span></a>

                </td>
            </tr>
            </tfoot>
        </table>
    </form>
</div>
<script type="text/javascript">
    $(function(){
        $('#search_stime').datepicker({dateFormat: 'yy-mm-dd'});
        $('#search_etime').datepicker({dateFormat: 'yy-mm-dd'});
    });
    function submit_form(type){
        var items = $("input[name='ids']:checked").length;
        if (items == 0) {
            alert("请至少选择一个要删除的项目");
        }else{
            if (type == 'del') {
                if (!confirm('您确定要删除吗?')) {
                    return false;
                }
                $('#form_trace').attr('action', APP_BASE + '/store/tracelog/delLog');
            } else if (type == 'hide') {
                $('#form_trace').attr('action', APP_BASE + '/store/tracelog/updateState?state=0');
            } else {
                $('#form_trace').attr('action', APP_BASE + '/store/tracelog/updateState?state=1');
            }
            $('#form_trace').submit();
        }

    }
</script>
</@layout.body>