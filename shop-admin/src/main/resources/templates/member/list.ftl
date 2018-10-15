<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/layer/layer.js"></script>
<script type="text/javascript">
    $(function(){
        $('#formSearch').attr("action","");
        $('#ncsubmit').click(function(){
            $('#formSearch').submit();
        });
    });
    //重置密码
    function resetPass(id){
        var url = "${base}/member/resetPass?id="+id;
        layer.confirm('您确定要重置密码吗?重置后密码将变为初始密码', function(){
            $.ajax({
                type: "post",
                url: url,
                data: null,
                dataType: "json",
                async:false,
                success:function(data) {
                    if(data.success == "true"){
                        layer.msg('重置成功', {icon: 1});
                    }else{
                        layer.msg('重置失败', {icon: 2});
                    }
                }
            });
        });
    }
</script>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>会员管理</h3>
            <ul class="tab-base">
                <li><a href="javaScript:;" class="current"><span>管理</span></a></li>
                <li><a href="${base}/member/add"><span>新增</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form method="post" name="formSearch" id="formSearch" action="${base}/member/list">
        <input type="hidden" name="pageNo" value="${pager.pageNo}">
        <table class="tb-type1 noborder search">
            <tbody>
            <tr>
                <td>
                    <select name="queryType">
                        <option value="1" <#if queryType == 1>selected</#if>>会员</option>
                        <option value="2" <#if queryType == 2>selected</#if>>电子邮箱</option>
                        <option value="3" <#if queryType == 3>selected</#if>>真实姓名</option>
                    </select>
                </td>
                <td><input type="text" value="${memberName}" name="memberNameflag" class="txt"></td>
                <td>
                    <select name="orderString">
                        <option value=""  <#if member.orderString == null>selected</#if>>排序</option>
                        <option value="1" <#if member.orderString == 1>selected</#if>>最后登录</option>
                        <option value="2" <#if member.orderString == 2>selected</#if>>登录次数</option>
                    </select>
                </td>
                <td>
                    <select name="status" >
                        <option value=""  <#if member.status==null>selected</#if>>会员状态</option>
                        <option value="1" <#if member.status==1>selected</#if>>禁止举报</option>
                        <option value="2" <#if member.status==2>selected</#if>>禁止购买</option>
                        <option value="3" <#if member.status==3>selected</#if>>禁止发表言论</option>
                        <option value="4" <#if member.status==4>selected</#if>>禁止登录</option>
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
    <table class="table tb-type2" id="prompt">
        <tbody>
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
        </tbody>
    </table>
    <form method="post" id="form_member">
        <input type="hidden" name="form_submit" value="ok" />
        <table class="table tb-type2 nobdb">
            <thead>
            <tr class="thead">
                <th>&nbsp;</th>
                <th colspan="2">会员</th>
                <th class="align-center"><span fieldname="logins" nc_type="order_by">登录次数</span></th>
                <th class="align-center"><span fieldname="last_login" nc_type="order_by">最后登录时间</span></th>
                <th class="align-center">积分</th>
                <th class="align-center">预存款</th>
                <th class="align-center">登录</th>
                <th class="align-center">操作</th>
            </tr>
            <tbody>
                <#list pager.result as member>
                <tr class="hover member">
                    <td class="w24"></td>
                    <td class="w48 picture" style="text-align:right"><div class="size-44x44"><span class="thumb size-44x44"><i></i><img src="${imgServer}${member.memberAvatar}" onload="javascript:DrawImage(this,44,44);" height="44" width="44"></td>
                    <td style="text-align:left">
                        <p class="name"><strong>${member.memberName}</strong>(真实姓名: ${member.memberTruename})</p>
                        <p class="smallfont">注册时间:&nbsp;
                        <#if member.createTimeStr??>
                      		 ${member.createTimeStr?string("yyyy-MM-dd  HH:mm:ss")}
                        </#if>
                        </p>
                        <div class="im">
	                        <span class="email">
		                        <a href="mailto:${member.memberemail}" class="yes" title="电子邮箱:${member.memberemail}">
		                        </a>
		                        ${member.memberEmail}
	                        </span>
                        </div>
                    </td>
                    <td class="align-center">${member.memberLoginNum}</td>
                    <td class="w150 align-center">
                       <#if member.memberOldLoginTimestr??>
                      		 ${member.memberOldLoginTimestr?string("yyyy-MM-dd  HH:mm:ss")}
                        </#if>
                    </td>
                    <td class="align-center">${member.memberRankPoints}</td>
                    <td class="align-center">
                        <p>可用:&nbsp;<strong class="red">${member.availablePredeposit}</strong>&nbsp;元</p>
                        <p>冻结:&nbsp;<strong class="red">${member.freezePredeposit}</strong>&nbsp;元</p>
                    </td>
                    <td class="align-center">
                        <#if member.memberState == 1>允许</#if>
                        <#if member.memberState == 0>禁止</#if>
                    </td>
                    <td class="align-center">
                        <a href="${base}/member/findById?id=${member.memberId}" title="编辑" >编辑</a>
                         &nbsp;|&nbsp;
	                    <a onclick="resetPass('${member.memberId}')">重置</a>
                        
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