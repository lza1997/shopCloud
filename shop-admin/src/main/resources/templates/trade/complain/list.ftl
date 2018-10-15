<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>投诉管理</h3>
            <ul class="tab-base">
                <#assign  list=[{"type":"10","name":"新投诉"},{"type":"20","name":"待申诉"},{"type":"30","name":"对话中"},
                {"type":"40","name":"待仲裁"},{"type":"99","name":"已关闭"}]/>
                <#list list as menu>
                    <#if complain.complainState == menu.type>
                        <li><a href="JavaScript:void(0);" class="current"><span>${menu.name}</span></a></li>
                    <#else>
                        <li><a href="${base}/trade/complain/list?complainState=${menu.type}"><span>${menu.name}</span></a></li>
                    </#if>
                </#list>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form id="search_form" method="get" name="formSearch">
        <input type="hidden" name="pageNo" value="${pager.pageNo}">
        <table class="tb-type1 noborder search">
            <tbody>
            <tr>
                <th><label for="accuserName">投诉人</label></th>
                <td><input class="txt" type="text" name="accuserName" id="input_complain_accuser" value="${complain.accuserName}"></td>
                <th><label for="complainSubjectContent">投诉主题</label></th>
                <td colspan="2"><input class="txt2" type="text" name="complainSubjectContent" id="input_complain_subject_content" value="${complain.complainSubjectContent}"></td>
            </tr>
            <tr>
                <th><label for="accusedName">被投诉店铺</label></th>
                <td><input class="txt" type="text" name="accusedName" id="input_complain_accused" value="${complain.accusedName}"></td>
                <th><label for="time_from">投诉时间</label></th>
                <td><input id="time_from" class="txt date" type="text" name="startTime" value="${complain.startTime}">
                    <label for="time_to">~</label>
                    <input id="time_to" class="txt date" type="text" name="endTime" value="${complain.endTime}"></td>
                <td><a href="javascript:document.formSearch.submit();" class="btn-search " title="查询">&nbsp;</a>
                    <#if (complain.accuserName != null && complain.accuserName != '') || (complain.complainSubjectContent != null && complain.complainSubjectContent != '')
                    || (complain.accusedName != null && complain.accusedName != '') || (complain.startTime != null && complain.startTime != '') || (complain.endTime != null && complain.endTime != '')>
                        <a class="btns " href="${base}/trade/complain/list" title="撤销检索"><span>撤销检索</span></a>
                    </#if>
                </td>
            </tr>
            </tbody>
        </table>
    </form>
    <table class="table tb-type2" id="prompt">
        <tbody>
        <tr class="space odd">
            <th colspan="12"><div class="title"><h5>操作提示</h5><span class="arrow"></span></div></th>
        </tr>
        <tr>
            <td>
                <ul>
                    <li>在投诉时效内，买家可对订单进行投诉，投诉主题由管理员在后台统一设置</li>
                    <li>投诉时效可在系统设置处进行设置</li>
                    <li>点击详细，可进行投诉审核。审核完成后，被投诉店铺可进行申诉。申诉成功后，投诉双方进行对话，最后由后台管理员进行仲裁操作</li>
                </ul></td>
        </tr>
        </tbody>
    </table>
    <form method='post' id="list_form">
        <table class="table tb-type2 nobdb">
            <thead>
            <tr class="thead">
                <th class="w12">&nbsp;</th>
                <th>投诉人</th>
                <th>被投诉店铺</th>
                <th>投诉主题</th>
                <th class="align-center">投诉时间</th>
                <th class="w72 align-center">操作</th>
            </tr>
            </thead>
            <tbody>
            <#list pager.result as c>
                <tr class="hover">
                    <td>&nbsp;</td>
                    <td>${c.accuserName}</td>
                    <td>${c.accusedName}</td>
                    <td>${c.complainSubjectContent}</td>
                    <td class="nowarp align-center">${c.complainDatetime?string("yyyy-MM-dd HH:mm:ss")}</td>
                    <td class="align-center"><a href="#?act=complain&op=complain_progress&complain_id=${c.complainId}">详细</a></td>
                </tr>
            </#list>
            </tbody>
            <tfoot>
            <tr>
                <td colspan="15">
                    <@layout.pager pager/>
                </td>
            </tr>
            </tfoot>
        </table>
    </form>
</div>
<script type="text/javascript">
    $(document).ready(function(){
        //表格移动变色
        $("tbody .line").hover(
                function()
                {
                    $(this).addClass("complain_highlight");
                },
                function()
                {
                    $(this).removeClass("complain_highlight");
                });
        $('#time_from').datepicker({dateFormat: 'yy-mm-dd',onSelect:function(dateText,inst){
            var year2 = dateText.split('-') ;
            $('#time_to').datepicker( "option", "minDate", new Date(parseInt(year2[0]),parseInt(year2[1])-1,parseInt(year2[2])) );
        }});
        $('#time_to').datepicker({onSelect:function(dateText,inst){
            var year1 = dateText.split('-') ;
            $('#time_from').datepicker( "option", "maxDate", new Date(parseInt(year1[0]),parseInt(year1[1])-1,parseInt(year1[2])) );
        }});

    });
</script>
</@layout.body>