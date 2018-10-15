<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript">
    $(function(){
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
            <h3>咨询管理</h3>
            <ul class="tab-base">
                <li><a href="JavaScript:void(0);" class="current"><span>管理</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form method="post" name="formSearch" action="${base}/trade/consult/list">
        <input type="hidden" name="pageNo" value="${pager.pageNo}">
        <table class="tb-type1 noborder search">
            <tbody>
            <tr>
                <th><label for="cmemberName">咨询人</label></th>
                <td><input class="txt" type="text" name="cmemberName" id="member_name" value="${consult.cmemberName}" /></td>
                <th><label for="consultContent">  咨询内容</label></th>
                <td><input class="txt" type="text" name="consultContent" id="consult_content" value="${consult.consultContent}" /></td>
                <td><a href="javascript:document.formSearch.submit();" class="btn-search " title="查询">&nbsp;</a>
                    <#if (consult.cmemberName != null && consult.cmemberName != '') || (consult.consultContent != null && consult.consultContent != '')>
                        <a class="btns " href="${base}/trade/consult/list" title="撤销检索"><span>撤销检索</span></a>
                    </#if>
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
                    <li>会员可在商品信息页对商品进行咨询，系统设置处可设置游客是否能够咨询</li>
                </ul></td>
        </tr>
        </tbody>
    </table>
    <form method="POST" action="${base}/trade/consult/delete" onsubmit="return checkForm() && confirm('您确定要删除吗?');" name="form1">
        <table class="table tb-type2">
            <tbody>
            <#list pager.result as c>
                <tr class="space">
                    <th class="w24"><input type="checkbox" class="checkitem" name="ids" value="${c.consultId}" /></th>
                    <th>
                        <strong>咨询对象:&nbsp;</strong>
                        <span><a target="_blank" href="${frontServer}/product/detail?id=${c.goodsId}">${c.cgoodsName}</a></span>
                    </th>
                    <th><strong>店铺名称:</strong>&nbsp;<a href="${frontServer}/store/shop?storeId=${c.storeId}" target="_blank" class="normal" >${c.storeName}</a></th>
                    <th><strong>操作:</strong>&nbsp;<a href="javascript:if(confirm('您确定要删除吗?')){location.href=APP_BASE+'/trade/consult/delete?ids=${c.consultId}';}" class="normal" >删除</a></th>
                </tr>
                <tr>
                    <td colspan="12"><fieldset class="w mtn">
                        <legend><span><strong>咨询人:</strong>&nbsp;
                            <#if c.cmemberName == null || c.cmemberName == ''>游客<#else>${c.cmemberName}</#if>
                  </span>&nbsp;&nbsp;&nbsp;&nbsp;<span><strong>
                            咨询时间:</strong>&nbsp;${c.consultAddtimeStr}
                        </span></legend>
                        <div class="formelement" id="hutia_${c_index}">${c.consultContent}</div>
                    </fieldset>
                        <fieldset class="d mtm mbw">
                            <legend><strong>店主回复:</strong></legend>
                            <div class="formelement" id="hutia2_${c_index}">
                                <#if c.consultReply != null && c.consultReply != ''>
                                    ${c.consultReply}
                                <#else>
                                    暂无回复
                                </#if>
                            </div>
                        </fieldset>
                    </td>
                </tr>
            </#list>
            </tbody>
            <tfoot>
            <tr class="tfoot">
                <td><input type="checkbox" class="checkall" id="checkallBottom"></td>
                <td colspan="16"><label for="checkallBottom">全选</label>
                    &nbsp;&nbsp;<a href="JavaScript:void(0);" class="btn" onclick="document.form1.submit()"><span>删除</span></a>
                    <@layout.pager pager/>
                </td>
            </tr>
            </tfoot>
        </table>
    </form>
</div>
<script type="text/javascript">
    function checkForm(){
        flag = false;
        $.each($("input[name='consult_id[]']"),function(i,n){
            if($(n).attr('checked')){
                flag = true;
                return false;
            }
        });
        if(!flag)alert('');
        return flag;
    }
</script>
<script>
    (function(){
        $('.w').each(function(i){
            var o = document.getElementById("hutia_"+i);
            var s = o.innerHTML;
            var p = document.createElement("span");
            var n = document.createElement("a");
            p.innerHTML = s.substring(0,50);
            n.innerHTML = s.length > 50 ? "... 【展开】" : "";
            n.href = "###";
            n.onclick = function(){
                if (n.innerHTML == "... 【展开】"){
                    n.innerHTML = " 【收起】";
                    p.innerHTML = s;
                }else{
                    n.innerHTML = "... 【展开】";
                    p.innerHTML = s.substring(0,50);
                }
            }
            o.innerHTML = "";
            o.appendChild(p);
            o.appendChild(n);
        });
    })();
    (function(){
        $('.d').each(function(i){
            var o = document.getElementById("hutia2_"+i);
            var s = o.innerHTML;
            var p = document.createElement("span");
            var n = document.createElement("a");
            p.innerHTML = s.substring(0,50);
            n.innerHTML = s.length > 50 ? "... 【展开】" : "";
            n.href = "###";
            n.onclick = function(){
                if (n.innerHTML == "... 【展开】"){
                    n.innerHTML = " 【收起】";
                    p.innerHTML = s;
                }else{
                    n.innerHTML = "... 【展开】";
                    p.innerHTML = s.substring(0,50);
                }
            }
            o.innerHTML = "";
            o.appendChild(p);
            o.appendChild(n);
        });
    })();

</script>
</@layout.body>