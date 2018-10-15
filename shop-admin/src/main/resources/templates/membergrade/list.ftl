<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/jquery.edit.js"></script>
<script type="text/javascript" src="${base}/res/js/common_select.js" charset="utf-8"></script>
	
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
        $('#ncsubmit').click(function(){
            $('#formSearch').submit();
        });
        
        gcategoryInit('gcategory');
    });
    function delType(){
        var items = $("input[name='ids']:checked").length;
        if (items==0) {
            alert("请至少选择一个要删除的项目");
        }else{
            if(confirm('您确定要删除吗?')){
                $('#form_list').submit();
            }
        }
    }
    function delRow(obj){
        if(confirm('您确定要删除吗?')) {
            $(obj).parents("tr").find("td:eq(0)>input").attr("checked", true);
            $('#form_list').submit();
        }
    }
</script>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>会员等级</h3>
            <ul class="tab-base">
                <li><a class="current" href="JavaScript:void(0);"><span>列表</span></a></li>
                <li><a href="${base}/member/grade/add   "><span>新增</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <!-- <form method="post" name="formSearch" id="formSearch" action="${base}/group/dictionaryGroup/list">
        <input type="hidden" name="pageNo" value="${pager.pageNo}">
        <table class="tb-type1 noborder search">
			<tbody>
				<tr>
					<th><label for="search_brand_name">搜索</label></th>
					<td><input type="text" id="groupName" name="groupName" value="" class="mls_names" /></td>
					<td><a href="javascript:void(0);" id="ncsubmit"
						class="btn-search " title="查询">&nbsp;</a>
					</td>
				</tr>
			</tbody>
		</table>
    </form> -->
    <table id="prompt" class="table tb-type2">
        <tbody>
        <tr class="space odd">
            <th colspan="12" class="nobg"> <div class="title">
                <h5>操作提示</h5>
                <span class="arrow"></span> </div>
            </th>
        </tr>
        <tr class="odd">
            <td><ul>
                <li>会员等级的设置</li>
            </ul></td>
        </tr>
        </tbody>
    </table>
    <form id="form_list" method="post" action="${base}/member/grade/delete">
        <table class="table tb-type2">
            <thead>
            <tr class="thead">
            	<th></th>
                <th>等级名称</th>
                <th>是否默认</th>
                <th>等级所需积分</th>
                <th class="align-center">操作</th>
            </tr>
            </thead>
            <tbody>
            <#if pager.result?size gt 0>
	            <#list pager.result as memberGrade>
	            <tr class="hover edit" name="goodsInfo">
	            	<td class="w24">
	            		<input type="checkbox" class="checkitem" name="ids" value="${memberGrade.gradeId}" />
	            	</td>
	                <td class="">
	                	<img src="${imgServer}/${memberGrade.gradeImg}" style="height: 30px;width: 30px;">${memberGrade.gradeName}
	                </td>
	                <td class="yes-onoff">
                    <#if memberGrade.isDefault == '0'>
                    	否
                    <#else>
                    	是
                    </#if>
                </td>
	                <td class="">${memberGrade.integration}</td>
	                <td class="align-center" style="width:170px">
	                <a href="${base}/member/grade/update?id=${memberGrade.gradeId}">编辑</a> | 
	                <a href="javascript:void(0)" onclick="delRow(this)">删除</a>
	                </td>
	            </tr>
	            </#list>
            <#else>
            	<tr class="hover edit">
	            	<td colspan="24" style="text-align: center;">
	            		暂时没有记录
	            	</td>
	            </tr>
            </#if>
            </tbody>
            <tfoot>
            <tr>
                <td><input type="checkbox" class="checkall" id="checkallBottom" /></td>
                <td id="dataFuncs" colspan="16">
                	<label for="checkallBottom">全选</label>&nbsp;&nbsp;
                    <a class="btn" onclick="delType();" href="JavaScript:void(0);"> <span>删除</span> </a>
                    <@layout.pager pager/>
                </td>
            <tr>
            </tfoot>
        </table>
    </form>
</div>
</@layout.body>