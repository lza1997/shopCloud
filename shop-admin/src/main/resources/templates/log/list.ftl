<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript">
    $(function(){
        $('#time_from').datepicker({dateFormat: 'yy-mm-dd'});
        $('#time_to').datepicker({dateFormat: 'yy-mm-dd'});
        $('#formSearch').attr("action","");
        $('#ncsubmit').click(function(){
            $('#formSearch').submit();
        });
    });

    function delLog(){
        var items = $("input[name='id']:checked").length;
        if (items==0) {
            alert("请至少选择一个要删除的项目");
        }else{
            if(confirm('您确定要删除吗?')){
                $('#form_list').submit();
            }
        }
    }
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
    <form method="post" name="formSearch" id="formSearch" action="${base}/adminlog/list">
        <input type="hidden" name="pageNo" value="${pager.pageNo}">
        <table class="tb-type1 noborder search">
            <tbody>
            <tr>
                <th>操作人</th>
                <td><input class="txt" name="creatBy" value="${creatBy}" type="text"></td>
                <th>时间</th>
                <td><input class="txt date" type="text" value="${starttime}" id="time_from" name="starttime">
                    <label for="time_to">~</label>
                    <input class="txt date" type="text" value="${endtime}" id="time_to" name="endtime"/></td>
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
                <li>开启操作日志可以记录管理人员的关键操作，但会轻微加重系统负担</li>
            </ul></td>
        </tr>
        </tbody>
    </table>
    <form method="post" id='form_list' action="${base}/adminlog/delLog">
        <table class="table tb-type2">
            <thead>
            <tr class="thead">
                <th></th>
                <th class="align-center">操作人</th>
                <th class="align-center">URI</th>
                <th class="align-center">提交方式</th>
                <th class="align-center">操作者IP</th>
                <th class="align-center">操作时间</th>
            </tr>
            </thead>
            <tbody>
				<#if pager.result?size gt 0>
					<#list pager.result as data>
		            <tr class="hover">
		                <td class="w24">
		                    <input name="id" type="checkbox" class="checkitem" value="${data.id}">
		                </td>
		                <td class="align-center">${data.createBy}</td>
		                <td class="align-center">${data.requestUri}</td>
		                <td class="align-center">${data.method}</td>
		                <td class="align-center">${data.remoteAddr}</td>
		                <td class="align-center">${data.createTimeStr}</td>
		            </tr>
					</#list>
				<#else>
					<tr>
			            <td colspan="6" style="text-align: center;">
			                暂无内容
			            </td>
			        </tr>
				</#if>
            </tbody>
            <tfoot>
            <tr class="tfoot">
                <td><input type="checkbox" class="checkall" id="checkallBottom" name="chkVal"></td>
                <td colspan="6">
               <!--  <label for="checkallBottom">全选</label>
                    &nbsp;&nbsp;<a href="JavaScript:void(0);" class="btn" onclick="delLog();"><span>删除</span></a> -->
				<@layout.pager pager/>
				</td>
            </tr>
            </tfoot>
        </table>
    </form>
</div>
</@layout.body>
