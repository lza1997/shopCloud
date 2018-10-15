<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript">
    $(function(){
        $('#formSearch').attr("action","");
        $('#ncsubmit').click(function(){
            $('#formSearch').submit();
        });
    });
</script>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>广告管理</h3>
	        <ul class="tab-base">
	            <li><a href="${base}/adv/list" class="current"><span>管理</span></a></li>
	            <li><a href="${base}/adv/forward?advId=0"><span>新增</span></a></li>
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
                    广告标题:
                </td>
                <td>
                	<input name="advTitle" value="${advTitle}" class="txt">
				</td>
                <td><a href="javascript:void(0);" id="ncsubmit" class="btn-search " title="查询">&nbsp;</a>
                    <a href="${base}/adv/list" class="btns "><span>撤销检索</span></a>
                </td>
            </tr>
            </tbody>
        </table>
    </form>
    <table class="table tb-type2" id="prompt">
        <!-- <tbody>
        <tr style="background: none repeat scroll 0% 0% rgb(255, 255, 255);" class="space odd">
            <th colspan="12"><div class="title">
                <h5>操作提示</h5>
                <span class="arrow"></span></div></th>
        </tr>
        <tr style="background: none repeat scroll 0% 0% rgb(255, 255, 255);" class="odd">
            <td><ul>
                <li>通过会员管理，你可以进行查看、编辑会员资料以及删除会员等操作</li>
                <li>你可以根据条件搜索会员，然后选择相应的操作</li>
            </ul></td>
        </tr>
        </tbody> -->
    </table>
    <form method="post" id="form_member">
        <input type="hidden" name="form_submit" value="ok" />
        <table class="table tb-type2 nobdb">
            <thead>
            <tr class="thead">
                <th>&nbsp;</th>
                <th class="align-center">广告标题</th>
                <th class="align-center">开始时间</th>
                 <th class="align-center">结束时间</th>
                <th class="align-center">点击次数</th>
                <th class="align-center">排序</th>
               <th class="align-center">操作</th>
            </tr>
            <tbody>
                <#list pager.result as adv>
	                <tr class="hover">
	                    <td class="w24"></td>
	                    <td class="align-center">${adv.advTitle}</td>
	                    <td class="align-center">${adv.startDateStr}</td>
	                    <td class="align-center">${adv.endDateStr}</td>
	                    <td class="align-center">${adv.clikcNum}</td>
	                    <td class="align-center">${adv.sort}</td>
	                    <td class="align-center">
	                        <a href="${base}/adv/forward?apId=${adv.apId}&advId=${adv.advId}" title="编辑" >编辑</a> | <a href="${base}/adv/delete?advId=${adv.advId}" title="删除" >删除</a>
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