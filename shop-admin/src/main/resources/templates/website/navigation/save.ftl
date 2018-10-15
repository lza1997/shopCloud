<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/common_select.js" charset="utf-8"></script>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>页面导航</h3>
            <ul class="tab-base">
                <li><a href="${base}/website/navigation/list" ><span>管理</span></a></li>
                <li><a href="JavaScript:void(0);" class="current"><span>新增</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form id="navigation_form" method="post" action="${base}/website/navigation/edit">
        <table class="table tb-type2">
            <tbody>
            <tr class="noborder">
                <td colspan="2" class="required"><label>导航类型</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><ul class="nofloat">
                    <li class="left w100pre"><span class="radio">
                <input type="radio" value="0" name="navType" id="diy" checked="checked" onclick="showType('diy');">
                <label for="diy">自定义导航</label>
                </span></li>
                    <li class="left w100pre"><span class="radio">
                <input type="radio"  value="1" name="navType" id="goods_class" onclick="showType('goods_class');">
                <label for="goods_class">商品分类</label>
                </span>
                        <select name="gcId" id="goods_class_id" style="display: none;">
                            <#list gClassList as class>
                                <option value="${class.gcId}" >&nbsp;&nbsp;${class.gcName}</option>
                                <#if class.classList??>
                                    <#list class.classList as gc>
                                        <option value="${gc.gcId}">&nbsp;&nbsp;&nbsp;&nbsp;${gc.gcName}</option>
                                        <#if gc.classList??>
                                            <#list gc.classList as c>
                                                <option value="${c.gcId}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${c.gcName}</option>
                                            </#list>
                                        </#if>
                                    </#list>
                                </#if>
                            </#list>
                        </select>
                    </li>
                    <li class="left w100pre"><span class="radio">
                <input type="radio" value="2" name="navType" id="article_class" onclick="showType('article_class');">
                <label for="article_class">文章分类</label>
                </span>
                        <select name="acId" id="article_class_id" style="display: none;">
                            <#list aClassList as class>
                                <option value="${class.acId}" >&nbsp;&nbsp;${class.acName}</option>
                                <#if class.articleClassList??>
                                    <#list class.articleClassList as ac>
                                        <option value="${ac.acId}">&nbsp;&nbsp;&nbsp;&nbsp;${ac.acName}</option>
                                    </#list>
                                </#if>
                            </#list>
                        </select>
                    </li>
                </ul></td>
                <td class="vatop tips"></td>
            </tr>
            <tr>
                <td colspan="2" class="required"><label class="validation" for="navTitle">标题:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" value="" name="navTitle" id="" class="txt"></td>
                <td class="vatop tips"></td>
            </tr>
            <tr>
                <td colspan="2" class="required"><label for="navUrl">链接:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" value="http://" name="navUrl" id="" class="txt"></td>
                <td class="vatop tips"></td>
            </tr>
            <tr>
                <td colspan="2" class="required"><label>
                    <label for="type">所在位置:</label>
                </label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><ul>
                    <li>
                        <input type="radio" value="0" name="navLocation">
                        <label>头部</label>
                    </li>
                    <li>
                        <input type="radio" checked="checked" value="1" name="navLocation">
                        <label>中部</label>
                    </li>
                    <li>
                        <input type="radio" value="2" name="navLocation">
                        <label>底部</label>
                    </li>
                </ul></td>
                <td class="vatop tips"></td>
            </tr>
            <tr>
                <td colspan="2" class="required"><label>
                    <label>新窗口打开:</label>
                </label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform onoff"><label for="nav_new_open1" class="cb-enable selected" ><span>是</span></label>
                    <label for="nav_new_open0" class="cb-disable" ><span>否</span></label>
                    <input id="nav_new_open1" name="navNewOpen" checked="checked" value="1" type="radio">
                    <input id="nav_new_open0" name="navNewOpen" value="0" type="radio"></td>
                <td class="vatop tips"></td>
            </tr>
            <tr>
                <td colspan="2" class="required"><label for="nav_sort">排序:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" value="255" name="navSort" id="" class="txt"></td>
                <td class="vatop tips"></td>
            </tr>
            </tbody>
            <tfoot>
            <tr class="tfoot">
                <td colspan="15"><a href="JavaScript:void(0);" class="btn" id="submitBtn"><span>提交</span></a></td>
            </tr>
            </tfoot>
        </table>
    </form>
</div>
<script>

    //按钮先执行验证再提交表单
    $(function () {
        $("#submitBtn").click(function () {
            if ($("#navigation_form").valid()) {
                $("#navigation_form").submit();
            }
        });
        showType('diy')
    });
    //
    $(document).ready(function(){
        $('#navigation_form').validate({
            errorPlacement: function(error, element){
                error.appendTo(element.parent().parent().prev().find('td:first'));
            },
            rules : {
                navTitle : {
                    required : true
                },
                navSort:{
                    number   : true
                }
            },
            messages : {
                navTitle : {
                    required : '标题不能为空'
                },
                navSort  : {
                    number   : '分类排序仅能为数字'
                }
            }
        });
    });

    function showType(type){
        $('#goods_class_id').css('display','none');
        $('#article_class_id').css('display','none');
        $('#activity_id').css('display','none');
        if(type == 'diy'){
            $('#nav_url').attr('disabled',false);
        }else{
            $('#nav_url').attr('disabled',true);
            $('#'+type+'_id').show();
        }
    }
</script>
</@layout.body>