<@layout.head>
<link href="${base}/res/css/font/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
<!--[if IE 7]>
  <link rel="stylesheet" href="${base}/res/css/font/font-awesome/css/font-awesome-ie7.min.css">
<![endif]-->
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/common_select.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/dialog/dialog.js" id="dialog_js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/dialog/dialog.css"  />
<script type="text/javascript" src="${base}/res/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery.mousewheel.js"></script>
<script type="text/javascript">
    $(function(){
        $('#ncsubmit').click(function(){
            $('#formSearch').submit();
        });
    });

    function deleteParam(){
        var items = $("input[name='ids']:checked").length;
        if (items==0) {
            alert("请至少选择一个要删除的项目");
        }else{
            if(confirm('您确定要删除吗?')){
                $("#form_list").attr("action",APP_BASE+"/doc/api/returnvalue/delDoc");
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
            <h3>返回值管理</h3>
            <ul class="tab-base">
                <li><a href="JavaScript:void(0);" class="current"><span>列表</span></a></li>
                <li><a href="${base}/doc/api/returnvalue/add?docid=${docid}" ><span>新增</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form method="post" name="formSearch" id="formSearch" action="${base}/doc/api/returnvalue/list">
        <input type="hidden" name="pageNo" value="${pager.pageNo}" />
        <input type="hidden" name="docid" value="${docid} }" />
        <table class="tb-type1 noborder search">
            <tbody>
            <tr>
                <th>名称</th>
                <td><input class="txt" name="name" value="${name}" type="text"></td>
                <th>状态</th>
                <td>
                	<select name="status">
                		<option value="2" <#if status == 2>selected</#if>>全部</option>
                		<option value="1" <#if status == 1>selected</#if>>显示</option>
                		<option value="0" <#if status == 0>selected</#if>>不显示</option>
                	</select>
                </td>
                <td><a href="javascript:void(0);" id="ncsubmit" class="btn-search " title="查询">&nbsp;</a>
            </tr>
            </tbody>
        </table>
    </form>
    
    <form method='post' id="form_list" >
        <input type="hidden" name="form_submit" value="ok" />
        <table class="table tb-type2">
            <thead>
            <tr class="thead">
                <th class="w24"></th>
                <th >名称</th>
                <th >类型</th>
                <th >是否必填</th>
                <th >默认值</th>
                <th >描述</th>
                <th >操作 </th>
            </tr>
            </thead>
            <tbody>
            <#if doc??>
            <#list doc as data>
            <tr class="hover edit">
                <td><input type="checkbox" name="ids" value="${data.id}" class="checkitem"></td>
                <td >${data.name}</td>
                <td ><#if data.type == 1>String<#else>Integer</#if></td>
                <td ><#if data.isrequired == 1>是<#else>否</#if></td>
                <td >${data.defaultValue}</td>
                <td >${data.description}</td>
                <td align="left">
                	<p>
                		<a href="${base}/doc/api/returnvalue/findById?id=${data.id}&docid=${docid}" title="修改">修改</a>&nbsp;&nbsp;
                		<a href="${base}/doc/api/returnvalue/del?ids=${data.id}" title="删除">删除</a>&nbsp;&nbsp;
                	</p>
                 </td>
            </tr>
            <tr style="display:none;">
                <td colspan="20"><div class="ncsc-goods-sku ps-container"></div></td>
            </tr>
            </#list>
            </#if>
            </tbody>
            <tfoot>
            <tr class="tfoot">
                <td><input type="checkbox" class="checkall" id="checkallBottom"></td>
                <td colspan="16">
                	<label for="checkallBottom">全选</label>
                    &nbsp;&nbsp;
                    <a href="JavaScript:void(0);" class="btn" nctype="del_batch" onclick="deleteParam()"><span>删除</span></a>
                    <@layout.pager pager/>
                 </td>
            </tr>
            </tfoot>
        </table>
    </form>
</div>

<script type="text/javascript">

    // 获得选中ID
    function getId() {
        var str = '';
        $('#form_goods').find('input[name="id[]"]:checked').each(function(){
            id = parseInt($(this).val());
            if (!isNaN(id)) {
                str += id + ',';
            }
        });
        if (str == '') {
            return false;
        }
        str = str.substr(0, (str.length - 1));
        return str;
    }
</script>
</@layout.body>