<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/newtime/jquery-ui-timepicker-addon.min.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/newtime/jquery-ui-timepicker-zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<link rel="stylesheet" type="text/css" href="${base}/res/js/newtime/jquery-ui-timepicker-addon.min.css"  />
<style>
.ui-timepicker-div .ui-widget-header { margin-bottom: 8px; }
.ui-timepicker-div dl { text-align: left; }
.ui-timepicker-div dl dt { float: left; clear:left; padding: 0 0 0 5px; }
.ui-timepicker-div dl dd { margin: 0 10px 10px 45%; }
.ui-timepicker-div td { font-size: 90%; }
.ui-tpicker-grid-label { background: none; border: none; margin: 0; padding: 0; }
.ui-timepicker-rtl{ direction: rtl; }
.ui-timepicker-rtl dl { text-align: right; padding: 0 5px 0 0; }
.ui-timepicker-rtl dl dt{ float: right; clear: right; }
.ui-timepicker-rtl dl dd { margin: 0 45% 10px 10px; }
</style>
<script type="text/javascript">
function initGoodsInfo(){
	if($("[name=goodsInfo]").length == 0){
		$("#theGoodsInfo").css("display","block");
	}
}
 $(function(){
	 initGoodsInfo();
 });
    $(function(){
        $('#time_from').datetimepicker({});
        $('#time_to').datetimepicker({});
        $('#formSearch').attr("action","");
        $('#ncsubmit').click(function(){
        	$("#pageNo").attr("value","");
            $('#formSearch').submit();
        });
        $('#upload').click(function(){
            $('#uploadform').submit();
        });
    });

    function delLog(){
        var items = $("input[name='logId']:checked").length;
        if (items==0) {
            alert("请至少选择一个要删除的项目");
        }else{
            if(confirm('您确定要删除吗?')){
                $('#form_list').submit();
            }
        }
    }
    function deleteSearchCondition(){
    	$("[name=sellerName]").each(function(){
    		$(this).attr("value","");
    	});
    	$("[name=startTime]").each(function(){
    		$(this).attr("value","");
    	});
    	$("[name=endTime]").each(function(){
    		$(this).attr("value","");
    	});
    }
    
    $(function(){
    	//清除查询条件
        $("#deleteSearch").click(function(){
        	deleteSearchCondition();
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
    <form method="post" name="formSearch" id="formSearch" action="${base}/sellerlog/list">
        <input type="hidden" name="pageNo" id="pageNo" value="${pager.pageNo}">
        <table class="tb-type1 noborder search">
            <tbody>
            <tr>
                <th>操作账号</th>
                <td><input class="txt" name="sellerName" value="${sellerName}" type="text"></td>
                <th>时间</th>
                <td><input class="txt date" type="text" value="${startTime}" id="time_from" name="startTime" style="width: 120px;">
                    <label for="time_to">~</label>
                    <input class="txt date" type="text" value="${endTime}" id="time_to" name="endTime" style="width: 120px;"/></td>
                <td><a href="javascript:void(0);" id="ncsubmit" class="btn-search" title="查询">&nbsp;</a>
                </td>
                <td><a class="btns" href="${base}/sellerlog/list" title="撤销检索"><span>撤销检索</span></a>
                </td>
            </tr>
            </tbody>
        </table>
    </form>
    
    <form method="post" id="uploadform" action="${base}/sellerlog/exportExcel">
        <input type="hidden" name="pageNo" value="${pager.pageNo}">
                <input type="hidden" name="sellerName" value="${sellerName}" >
                <input type="hidden" value="${startTime}" name="startTime">
                <input type="hidden" value="${endTime}" name="endTime"/></td>
                <a id="upload" href="javascript:void(0)" target="blank" class="btn" style="flout:right;">导出excel</a>
    </form>
    
    <form method="post" id='form_list' action="${base}/sellerlog/delete">
        <table class="table tb-type2">
            <thead>
            <tr class="thead">
                <th></th>
                <th>日志内容</th>
                <th>生成时间</th>
                <th class="align-center">卖家编号</th>
                <th class="align-center">卖家帐号</th>
                <th class="align-center">店铺编号</th>
                <th class="align-center">卖家IP</th>
                <th class="align-center">URL</th>
            </tr>
            </thead>
            <tbody>
			<#if pager.result??>
				<#list pager.result as data>
	            <tr class="hover"  name="goodsInfo">
	                <td class="w24">
	                    <input name="logId" type="checkbox" class="checkitem" value="${data.logId}">
	                </td>
	                <td>${data.logContent}</td>
	                <td>${data.logTime}</td>
	                <td class="align-center">${data.logSellerId}</td>
	                <td class="align-center">${data.logSellerName}</td>
	                <td class="align-center">${data.logStoreId}</td>
	                <td class="align-center">${data.logSellerIp}</td>
	                <td class="align-center">${data.logUrl}</td>
	            </tr>
				</#list>
			<#else>
		        <tr>
		            <td colspan="8" class="align-center">
		                暂无内容
		            </td>
		        </tr>
			</#if>
            </tbody>
           
            <tfoot>
            <tr class="tfoot">
                <td><input type="checkbox" class="checkall" id="checkallBottom" name="chkVal"></td>
                <td colspan="16"><label for="checkallBottom">全选</label>
                    &nbsp;&nbsp;<a href="JavaScript:void(0);" class="btn" onclick="delLog();"><span>删除</span></a>                    
				<@layout.pager pager/>
				</td>
            </tr>
            </tfoot>
        </table>
    </form>
</div>
</@layout.body>
