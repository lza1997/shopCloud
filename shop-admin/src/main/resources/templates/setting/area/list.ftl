<@layout.head>
<link href="${base}/res/css/font/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
<!--[if IE 7]>
<link rel="stylesheet" href="${base}/res/css/font/font-awesome/css/font-awesome-ie7.min.css">
<![endif]-->
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/dialog/dialog.js" id="dialog_js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/dialog/dialog.css"  />
<script type="text/javascript" src="${base}/res/js/area_array.js"></script>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>配送地区</h3>
            <ul class="tab-base">
                <li><a class="current"><span>配送地区</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form id="area_form" method="post" action="${base}/setting/area/edit">
        <input type="hidden" name="county" id="county" value="" />
        <table class="table tb-type2" id="prompt">
            <tbody>
            <tr class="space odd">
                <th colspan="12"><div class="title">
                    <h5>操作提示</h5>
                    <span class="arrow"></span></div></th>
            </tr>
            <tr>
                <td><ul>
                    <li>此处只能设置平台自营店铺支持货到付款的地区，注意：只有开启货到付款时以下设置的地区才会生效</li>
                    <li>选择完子地区确认后，系统并未保存，需要点击页面底部的保存按钮系统才会保存设置的地区</li>
                </ul></td>
            </tr>
            </tbody>
        </table>
        <table id="table_area_box" class="table tb-type2">
            <thead>
            <tr class="thead">
                <th class="w10"></th>
                <th class="w120">省</th>
                <th>市</th>
            </tr>
            </thead>
            <tbody>
            <#list province as p>
            <tr>
                <td></td>
                <td><label>
                    <input type="checkbox" <#if p.isChecked == true>CHECKED</#if> value="${p.areaId}" name="province[]">
                    <strong>${p.areaName}</strong></label></td>
                <td>
                    <#list p.childern as c>
                        <div class="area-list">
                            <label>
                                <input <#if c.isChecked == true>CHECKED</#if> type="checkbox" nc_province="${c.areaParentId}" value="${c.areaId}" name="city[]">
                                ${c.areaName} </label>
                            (<span city_id="${c.areaId}" title="已选下级地区">${c.countChildren}</span>)<a city_id="${c.areaId}" nc_title="${c.areaName}" province_id="${c.areaParentId}" nc_type="edit" href="javascript:void(0);" title="选择下级地区"><i class="icon-pencil"></i></a> </div>
                        <?php }?>
                    </#list>
                </td>
            </tr>
            </#list>
            </tbody>
            <tfoot>
            <tr class="tfoot">
                <td colspan="15"><a href="JavaScript:void(0);" class="btn" id="submitBtn"><span>提交</span></a></td>
            </tr>
            </tfoot>
        </table>
    </form>
</div>
<script type="text/javascript">

    //将系统已选择的县ID放入JS数组
    var CUR_COUNTY = new Array();
        <#if country?exists>
            <#list country?keys as key>
                CUR_COUNTY[${key}] = new Array();
                <#assign mapCountry=country[key] />
                <#list mapCountry as c>
                    CUR_COUNTY[${key}][${c}] = true;
                </#list>
            </#list>
        </#if>
    $(function(){

        //省点击事件
        $('input[name="province[]"]').on('click',function(){
            if ($(this).attr('checked') == 'checked'){
                $('input[nc_province="' + $(this).val() + '"]').each(function(){
                    $(this).attr('checked','checked');
                    if (typeof nc_a[$(this).val()] == 'object') {
                        county_array = nc_a[$(this).val()];
                    } else {
                        county_array = new Array();
                    }
                    CUR_COUNTY[$(this).val()] = new Array();
                    for(i = 0; i < county_array.length; i++) {
                        CUR_COUNTY[$(this).val()][county_array[i][0]] = true;
                    }
                    count = county_array.length;
                    $('span[city_id="'+$(this).val()+'"]').html(count);
                });
            }else{
                $('input[nc_province="' + $(this).val() + '"]').each(function(){
                    $(this).attr('checked',false);
                    CUR_COUNTY[$(this).val()] = undefined;
                    $('span[city_id="'+$(this).val()+'"]').html(0);
                });
            }
        });

        //点击编辑事件
        $('a[nc_type="edit"]').on('click',function(){
            if (typeof CUR_COUNTY[$(this).attr('city_id')] == 'object'){
                cur_county = CUR_COUNTY[$(this).attr('city_id')];
            }else{
                cur_county = new Array();
            }
            var province_array = nc_a[$(this).attr('city_id')];
            if (typeof nc_a[$(this).attr('city_id')] == 'object'){
                county_array = nc_a[$(this).attr('city_id')];
            }else{
                county_array = new Array();
            }
            if (county_array.length == 0) {
                alert('下面没有子地区，无需要编辑');
                return;
            }
            county_html = '<table id="table_area_box_edit" class="table tb-type2"><tbody><tr class="noborder"><td city_id="'+$(this).attr('city_id')+'" province_id="'+$(this).attr('province_id')+'">';
            for(i = 0; i < county_array.length; i++){
                county_html += '<label><input type="checkbox"';
                if (typeof(cur_county[county_array[i][0]]) != 'undefined') {
                    county_html += ' checked ' ;
                }
                county_html += (' value="'+county_array[i][0]+'" name="county[]">' + county_array[i][1] + '</label>');
            }
            county_html += '</td></tr><tr><td class="align-center"><a id="county_submit" class="btn" href="JavaScript:void(0);"><span>确认</span></a></td></tr><tr class="noborder"><td class="align-center" style="color:#f30;">确认后，还需要点击页面底部的保存按钮完成保存操作</td></tr></tbody></table>';
            html_form('select_county', '选择 '+ $(this).attr('nc_title') +' 子地区', county_html, 500,1);
        });

        //选择市级事件
        $('input[name="city[]"]').on('click',function(){
            if ($(this).attr('checked')) {
                if (typeof nc_a[$(this).val()] == 'object') {
                    county_array = nc_a[$(this).val()];
                } else {
                    county_array = new Array();
                }
                CUR_COUNTY[$(this).val()] = new Array();
                for(i = 0; i < county_array.length; i++) {
                    CUR_COUNTY[$(this).val()][county_array[i][0]] = true;
                }
                count = county_array.length;
                if ($('input[nc_province="'+$(this).attr('nc_province')+'"]').size() == $('input[nc_province="'+$(this).attr('nc_province')+'"]:checked').size()) {
                    $('input[value="'+$(this).attr('nc_province')+'"]').attr('checked',true);
                } else {
                    $('input[value="'+$(this).attr('nc_province')+'"]').attr('checked',false);
                }
            } else {
                CUR_COUNTY[$(this).val()] = undefined;
                count = 0;
                $('input[value="'+$(this).attr('nc_province')+'"]').attr('checked',false);
            }
            $('span[city_id="'+$(this).val()+'"]').html(count);
        });

        //弹出县编辑确认事件
        $('body').on('click','#county_submit',function(){
            cur_td = $('.dialog_content > table > tbody > tr > td');
            cur_checkbox = cur_td.find('input[type="checkbox"]');
            cur_checkbox.each(function(){
                if ($(this).attr('checked')) {
                    if (typeof CUR_COUNTY[cur_td.attr('city_id')] != 'object') {
                        CUR_COUNTY[cur_td.attr('city_id')] = new Array();
                    }
                    CUR_COUNTY[cur_td.attr('city_id')][$(this).val()] = true;
                } else {
                    if (typeof CUR_COUNTY[cur_td.attr('city_id')] == 'object') {
                        if (typeof CUR_COUNTY[cur_td.attr('city_id')][$(this).val()] != 'undefined') {
                            CUR_COUNTY[cur_td.attr('city_id')][$(this).val()] = undefined;
                        }
                    }
                }
            });
            cur_new_county = cur_td.find('input[type="checkbox"]:checked').size();
            $('span[city_id="'+cur_td.attr('city_id')+'"]').html(cur_new_county);
            if (cur_checkbox.size() == cur_new_county) {
                v = true;
            } else {
                v = false;
            }
            $('input[value="'+cur_td.attr('city_id')+'"]').attr('checked',v);

            if ($('input[nc_province="'+cur_td.attr('province_id')+'"]').size() == $('input[nc_province="'+cur_td.attr('province_id')+'"]:checked').size()) {
                $('input[value="'+cur_td.attr('province_id')+'"]').attr('checked',true);
            } else {
                $('input[value="'+cur_td.attr('province_id')+'"]').attr('checked',false);
            }

            DialogManager.close('select_county');
        });

        //表单提交事件
        $("#submitBtn").click(function(){
            var county_id_str = '';
            for(var city_id in CUR_COUNTY) {
                for(var county_d in CUR_COUNTY[city_id]) {
                    if (typeof(CUR_COUNTY[city_id][county_d]) != 'undefined') {
                        county_id_str += county_d + ',';
                    }
                }
            }
            $("#county").val(county_id_str.substring(0,county_id_str.length-1));
            $("#area_form").submit();
        });
    });
</script>
</@layout.body>