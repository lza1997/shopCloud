<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>业务表</h3>
            <ul class="tab-base">
                <li><a href="${base}/genTable/list"><span>列表</span></a></li>
            <#if genTable.id?exists && genTable.id!=0>
            	<li><a href="${base}/genTable/form"><span>新增</span></a></li>
                <li><a href="javascript:void(0);" class="current"><span>修改</span></a></li>
            <#else>
                <li><a href="javascript:void(0);" class="current"><span>新增</span></a></li>
            </#if>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <#if genTable.name?exists && genTable.name!=''>
    <table class="table tb-type2" id="prompt">
        <tbody>
        <tr class="space odd">
            <th colspan="12"><div class="title"><h5>操作提示</h5><span class="arrow"></span></div></th>
        </tr>
        <tr style="display: none;">
            <td>
                <ul>
                    <li>XXX</li>
                </ul>
            </td>
        </tr>
        </tbody>
    </table>
    <form id="genTable_form" method="post" action="${base}/genTable/save">
    	<input type="hidden" value="${genTable.id}" name="id" id="id">
        <table class="table tb-type2">
            <tbody>
            	
            	<tr class="noborder">
		            <td width="120" style="text-align:right;"><label class="validation" for="name">表名:</label></td>
		            <td class="vatop rowform" style="width:auto;"><input type="text" style="width: 340px;" class="txt" value="${genTable.name}" readonly="readonly" name="name" id="name"></td>
		        </tr>
		        <tr class="noborder">
		            <td style="text-align:right;"><label class="validation" for="name">说明:</label></td>
		            <td class="vatop rowform" style="width:auto;">
		            	<input type="text" style="width: 340px;" class="txt" value="${genTable.comments}" name="comments" id="name">
		            	<span style="color:red;">注意：如果是子表说明会用于主表列表中</span>
	            	</td>
		        </tr>
		        <tr class="noborder">
		            <td style="text-align:right;"><label class="validation" for="name">类名:</label></td>
		            <td class="vatop rowform" style="width:auto;">
		            	<input type="text" style="width: 340px;" class="txt" value="${genTable.className}" name="className" id="name">
		            	<span style="color:red;">注意：如果有表前缀，请手动修改成自己需要的实体名</span>
		            </td>
		        </tr>
		        <tr class="noborder">
		        	<td style="text-align:right;"><label class="validation" for="name">父表表名:</label></td>
		            <td class="vatop rowform" style="width:auto;">
						<select id="parentTable" name="parentTable" style="width: 350px;">
							<option value="">请选择...</option>
							<#list tableList as table>
								<option <#if genTable.parentTable==table.name>selected="selected"</#if> value="${table.name}">${table.name!''} : ${table.comments!''}</option>
							</#list>
						</select>	
						&nbsp;当前表外键：	
						<select id="parentTableFk" name="parentTableFk" style="width: 300px;">
							<option value="">请选择...</option>
							<#list genTable.columnList as c>
								<option <#if genTable.parentTableFk==c.name>selected="selected"</#if> value="${c.name}">${c.name!''} : ${c.comments!''}</option>
							</#list>
						</select>
					</td>
		        </tr>
		        <tr>
		        	<td colspan="2">
    	<table class="table tb-type2">
            <thead>
            <tr class="thead">
                <th title="">列名</th>
                <th title="">说明</th>
                <th title="">物理类型</th>
                <th title="">Java类型</th>
                <th title="">Java属性名称</th>
                <th title="">主键</th>
                <th title="">可空</th>
                <th title="">插入</th>
                <th title="">编辑</th>
                <th title="">列表</th>
                <th title="">查询</th>
                <th title="">查询匹配方式</th>
                <th title="">显示表单类型</th>
                <#--
                <th title="">字典类型</th>
                -->
                <th title="">排序</th>
            </tr>
            </thead>
            <tbody>
            <#list genTable.columnList as column>
            <tr>
            	<td>
            		<input type="hidden" name="columnList[${column_index}].id" value="${column.id}"/>
					<input type="hidden" name="columnList[${column_index}].delFlag" value="${column.delFlag}"/>
					<input type="hidden" name="columnList[${column_index}].genTable.id" value="${column.genTable.id!'0'}"/>
					<input type="hidden" name="columnList[${column_index}].name" value="${column.name}"/>
					${column.name}
            	</td>
            	<td>
					<input type="text" name="columnList[${column_index}].comments" value="${column.comments}" maxlength="200" class="required" style="width:100px;"/>
				</td>
				<td>
					<input type="hidden" name="columnList[${column_index}].myBatisJdbcType" value="${column.myBatisJdbcType}"/>
					<input type="hidden" name="columnList[${column_index}].jdbcType" value="${column.jdbcType}"/>
					${column.jdbcType}
				</td>
				<td>
					<select name="columnList[${column_index}].javaType" class="required">
						<#list config.javaTypeList as dict>
							<option value="${dict.value}" <#if dict.value==column.javaType>selected</#if> title="${dict.description}">${dict.label}</option>
						</#list>
					</select>
				</td>
				<td>
					<input type="text" name="columnList[${column_index}].javaField" value="${column.javaField}" maxlength="200" class="required" style="width:100px;"/>
				</td>
				<td>
					<input type="checkbox" name="columnList[${column_index}].isPk" value="1" <#if column.isPk==1>checked</#if>/>
				</td>
				<td>
					<input type="checkbox" name="columnList[${column_index}].isNull" value="1" <#if column.isNull==1>checked</#if>/>
				</td>
				<td>
					<input type="checkbox" name="columnList[${column_index}].isInsert" value="1" <#if column.isInsert==1>checked</#if>/>
				</td>
				<td>
					<input type="checkbox" name="columnList[${column_index}].isEdit" value="1" <#if column.isEdit==1>checked</#if>/>
				</td>
				<td>
					<input type="checkbox" name="columnList[${column_index}].isList" value="1" <#if column.isList==1>checked</#if>/>
				</td>
				<td>
					<input type="checkbox" name="columnList[${column_index}].isQuery" value="1" <#if column.isQuery==1>checked</#if>/>
				</td>
				<td>
					<select name="columnList[${column_index}].queryType" class="required">
						<#list config.queryTypeList as dict>
							<option value="${dict.value}" <#if dict.value==column.queryType>selected</#if> title="${dict.description}">${dict.label}</option>
						</#list>
					</select>
				</td>
				<td>
					<select name="columnList[${column_index}].showType" class="required">
						<#list config.showTypeList as dict>
							<option value="${dict.value}" <#if dict.value==column.showType>selected</#if> title="${dict.description}">${dict.label}</option>
						</#list>
					</select>
				</td>
				<#--
				<td>
					<input type="text" name="columnList[${column_index}].dictType" value="${column.dictType}" maxlength="200" style="width:90px;"/>
				</td>
				-->
				<td>
					<input type="text" name="columnList[${column_index}].sort" value="${column.sort}" maxlength="200" class="required digits" style="width:30px;"/>
				</td>
			</tr>
            </#list>
            </tbody>
        </table>
		        	</td>
		        </tr>
	            
            </tbody>
            <tfoot>
	            <tr class="tfoot">
	            	<td></td>
	                <td>
	                	<a id="submitBtn" class="btn" href="JavaScript:void(0);"> <span>保存</span> </a>
	                	<a class="btns" href="javascript:history.go(-1);"> <span>返回</span> </a>
	                </td>
	            </tr>
            </tfoot>
        </table>
    </form>
    <#else>
    <form id="genTable_form" method="post" action="${base}/genTable/form">
        <table class="table tb-type2">
            <tbody>
		        <tr class="noborder">
		            <td class="required" width="120" style="text-align:right;"><label class="validation" for="classId">表名:</label></td>
		            <td class="vatop rowform" style="width:auto;">
						<select id="name" name="name" style="width: 350px;">
							<option value="">请选择...</option>
							<#list tableList as table>
								<option value="${table.name}">${table.name!''} : ${table.comments!''}</option>
							</#list>
						</select>		
					</td>
		            <td class="vatop tips"></td>
		        </tr>
	            
            </tbody>
            <tfoot>
	            <tr class="tfoot">
	            	<td></td>
	                <td>
	                	<a id="submitBtn" class="btn" href="JavaScript:void(0);"> <span>下一步</span> </a>
	                	<a class="btns" href="javascript:history.go(-1);"> <span>返回</span> </a>
	                </td>
	            </tr>
            </tfoot>
        </table>
    </form>
    </#if>
</div>
<script type="text/javascript">
    $(function(){

        //按钮先执行验证再提交表单
        $("#submitBtn").click(function(){
            $("#genTable_form").submit();
        });
    });

</script>
</@layout.body>