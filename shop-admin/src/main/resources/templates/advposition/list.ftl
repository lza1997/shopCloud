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
            <h3>广告位管理</h3>
	        <ul class="tab-base">
	            <li><a href="${base}/advPosition/list" class="current"><span>管理</span></a></li>
	            <li><a href="${base}/advPosition/forward?apId=0"><span>新增</span></a></li>
	        </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form method="post" name="formSearch" id="formSearch" action="${base}/advPosition/list">
        <input type="hidden" name="pageNo" value="${pager.pageNo}">
        <table class="tb-type1 noborder search">
            <tbody>
            <tr>
                <td>
                    是否启用:
                </td>
                <td> <select name="isUse" id="isUse">
                		<option value="">－请选择－</option>
	                	<option value="1">启用</option>
	                	<option value="0">停用</option>
	                </select></td>
                <td>
                    广告展示方式:
                </td>
                <td>
                    <select name="apDisplay" id="apDisplay">
                    	<option value="">－请选择－</option>
	                	<option value="0">幻灯片</option>
	                	<option value="1">多广告展示</option>
	                	<option value="2">单广告展示</option>
	                </select>
                </td>
               	<td>广告类别:</td>
                <td>
                    <select name="apClass" id="apClass">
                    	<option value="">－请选择－</option>
	                	<option value="0">图片</option>
	                	<option value="1">文字</option>
	                	<option value="2">Flash</option>
	                </select>
                </td>
                <td><a href="javascript:void(0);" id="ncsubmit" class="btn-search " title="查询">&nbsp;</a>
                    <a href="${base}/advPosition/list" class="btns "><span>撤销检索</span></a>
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
                <th class="align-center">ID</th>
                <th class="align-center">广告位置名</th>
                <th class="align-center">广告位简介</th>
                <th class="align-center">广告类别</th>
                <th class="align-center">广告展示方式</th>
                <th class="align-center">获取标记</th>
                <th class="align-center">是否启用</th>
                <th class="align-center">长度(px)</th>
                <th class="align-center">高度(px)</th>
               <th class="align-center">操作</th>
            </tr>
            <tbody>
                <#list pager.result as advPosition>
	                <tr class="hover member">
	                    <td class="w24"></td>
	                    <td class="align-center">${advPosition.apId}</td>
	                    <td class="align-center">${advPosition.apName}</td>
	                    <td class="align-center">${advPosition.apIntro}</td>
	                    <td class="align-center">
	                    <#if (advPosition.apClass=0)>图片<#elseif (advPosition.apClass=1)>文字<#elseif (advPosition.apClass=2)>Flash</#if>
						</td>
	                    <td class="align-center">
	                    <#if (advPosition.apDisplay=0)>幻灯片<#elseif (advPosition.apDisplay=1)>多广告展示<#elseif (advPosition.apDisplay=2)>单广告展示</#if></td>
	                    <td class="align-center">
	                    ${advPosition.apKey}
	                    </td>
	                    <td class="align-center">
	                    <#if (advPosition.isUse=0)>停用<#else>启用</#if>
	                    </td>
	                    <td class="align-center">${advPosition.apWidth}</td>
	                    <td class="align-center">${advPosition.apHeight}</td>
	                    <td class="align-center">
	                        <a href="${base}/adv/list?apId=${advPosition.apId}" title="查看子广告" >查看</a> | <a href="${base}/advPosition/forward?apId=${advPosition.apId}" title="编辑" >编辑</a> | 
	                        <a href="${base}/advPosition/delete?apid=${advPosition.apId}" title="删除" >删除</a>
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