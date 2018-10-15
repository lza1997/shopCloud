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
            <h3>app反馈管理</h3>
            <ul class="tab-base">
                <li><a href="javaScript:;" class="current"><span>管理</span></a></li>
               <#--  <li><a href="${base}/feedback/add" ><span>新增</span></a></li> -->
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form method="post" name="formSearch" id="formSearch" action="${base}/feedback/list">
        <input type="hidden" name="pageNo" value="${pager.pageNo}">
        <table class="tb-type1 noborder search">
            <tbody>
            <tr>
                <td>
                    <select name="queryType">
                        <option value="1" <#if queryType == 1>selected</#if>>会员</option>
                    </select>
                </td>
                <td><input type="text" value="${memberName}" name="memberName" class="txt"></td>
                <td>
                    <select name="orderString">
                        <option value=""  <#if member.orderString == null>selected</#if>>排序</option>
                    </select>
                </td>
                <td>
                    <select name="status" >
                        <option value=""  <#if member.status==null>selected</#if>>会员状态</option>
                    </select>
                </td>
                <td><a href="javascript:void(0);" id="ncsubmit" class="btn-search " title="查询">&nbsp;</a>
                    <#if memberName != ''>
                    <a href="${base}/member/list" class="btns "><span>撤销检索</span></a>
                    </#if>
                </td>
            </tr>
            </tbody>
        </table>
    </form>
    <form method="post" id="form_member">
        <input type="hidden" name="form_submit" value="ok" />
        <table class="table tb-type2 nobdb">
            <thead>
            <tr class="thead">
               <!--  <th>&nbsp;</th> -->
                <th class="align-center">标题</th>
                <th class="align-center">内容</th>
                <th class="align-center">反馈时间</th>
                <th class="align-center">设备类型</th>
               <!--  <th class="align-center">操作</th> -->
            </tr>
            <tbody>
                <#list pager.result as feedback>
                <tr class="hover member">
                    <!-- <td class="w24"></td> -->
                    <td class="align-center">${feedback.title}</td>
                    <td class="align-center">${feedback.content}</td>
                    <td class="align-center">${feedback.createTime}</td>
                    <td class="align-center">
                    <#if (feedback.phoneType==1)>IOS
                    <#elseif (feedback.phoneType==2)>Android
                    <#else>其他</#if>
                    </td>
                    <!-- <td class="align-center">
                        <a href="${base}" title="编辑" >编辑</a>
                    </td> -->
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