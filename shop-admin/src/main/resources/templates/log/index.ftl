<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript">
    $(function(){
        $('#time_from').datepicker({dateFormat: 'yy-mm-dd'});
        $('#time_to').datepicker({dateFormat: 'yy-mm-dd'});
        $('#ncexport').click(function(){
            $('input[name="op"]').val('export_step1');
            $('#formSearch').submit();
        });
        $('#ncsubmit').click(function(){
            $('input[name="op"]').val('list');
            $('#formSearch').submit();
        });
        $('#ncdelete').click(function(){
            $('#delago').val($('#delago1').val());
            $('input[name="op"]').val('list_del');$('#formSearch').submit();
        });
    });
</script>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>操作日志</h3>
            <ul class="tab-base">
                <li><a href="JavaScript:void(0);" class="current"><span>操作日志</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form method="get" name="formSearch" id="formSearch">
        <input type="hidden" name="act" value="admin_log">
        <input type="hidden" name="op" value="list">
        <input type="hidden" name="delago" id="delago" value="">
        <table class="tb-type1 noborder search">
            <tbody>
            <tr>
                <th>操作人</th>
                <td><input class="txt" name="admin_name" value="" type="text"></td>
                <th>时间</th>
                <td><input class="txt date" type="text" value="" id="time_from" name="time_from">
                    <label for="time_to">~</label>
                    <input class="txt date" type="text" value="" id="time_to" name="time_to"/></td>
                <td><a href="javascript:void(0);" id="ncsubmit" class="btn-search " title="查询">&nbsp;</a>
                </td>
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
                <li>系统默认关闭了操作日志，如需开启，请编辑</li>
                <li>开启操作日志可以记录管理人员的关键操作，但会轻微加重系统负担</li>
            </ul></td>
        </tr>
        </tbody>
    </table>
    <form method="post" id='form_list' action="#?act=admin_log&op=list_del">
        <input type="hidden" name="form_submit" value="ok" />
        <div style="text-align:right;"><a class="btns" href="javascript:void(0);" id="ncexport"><span>导出Excel</span></a></div>
        <table class="table tb-type2">
            <thead>
            <tr class="thead">
                <th></th>
                <th>操作人</th>
                <th>行为</th>
                <th class="align-center">时间</th>
                <th class="align-center">IP</th>
            </tr>
            </thead>
            <tbody>
            <tr class="hover">
                <td class="w24">
                    <input name="del_id[]" type="checkbox" class="checkitem" value="8">
                </td>
                <td>admin</td>
                <td>登录</td>
                <td class="align-center">2014-11-26 22:00:41</td>
                <td class="align-center">192.168.181.1</td>
            </tr>
            </tbody>
            <tfoot>
            <tr class="tfoot">
                <td><input type="checkbox" class="checkall" id="checkallBottom" name="chkVal"></td>
                <td colspan="16"><label for="checkallBottom">全选</label>
                    &nbsp;&nbsp;<a href="JavaScript:void(0);" class="btn" onclick="if(confirm('您确定要删除吗?')){$('#form_list').submit();}"><span>删除</span></a>
                    删除<select name="delago1" id="delago1">
                        <option value="604800">一周前</option>
                        <option value="2592000">一个月前</option>
                        <option value="5184000">两个月前</option>
                        <option value="7776000">三个月前</option>
                        <option value="15552000">六个月前</option>
                        <option value="all">全部</option>
                    </select>记录<a class="btn" href="javascript:void(0);" id="ncdelete"><span>删除</span></a>

                    <div class="pagination"> <ul><li><a class="demo" href="#?act=admin_log&op=list&curpage=1"><span>首页</span></a></li><li><a class="demo" href="#?act=admin_log&op=list&curpage=9"><span>上一页</span></a></li><li><a class='demo' href='#?act=admin_log&op=list&curpage=1'><span>1</span></a></li><li><a class='demo' href='#?act=admin_log&op=list&curpage=2'><span>2</span></a></li><li><span>...</span></li><li><a class='demo' ="#?act=admin_log&op=list&curpage=8'><span>8</span></a></li><li><a class='demo' ="#?act=admin_log&op=list&curpage=9'><span>9</span></a></li><li><span class="currentpage">10</span></li><li><a class='demo' ="#?act=admin_log&op=list&curpage=11'><span>11</span></a></li><li><a class='demo' ="#?act=admin_log&op=list&curpage=12'><span>12</span></a></li><li><a class='demo' ="#?act=admin_log&op=list&curpage=13'><span>13</span></a></li><li><a class='demo' ="#?act=admin_log&op=list&curpage=14'><span>14</span></a></li><li><a class='demo' ="#?act=admin_log&op=list&curpage=15'><span>15</span></a></li><li><span>...</span></li><li><a class="demo" href="/shopnc2/admin/index.php?act=admin_log&op=list&curpage=11"><span>下一页</span></a></li><li><a class="demo" href="/shopnc2/admin/index.php?act=admin_log&op=list&curpage=26"><span>末页</span></a></li></ul> </div>

            </tr>
            </tfoot>
        </table>
    </form>
</div>
</@layout.body>
