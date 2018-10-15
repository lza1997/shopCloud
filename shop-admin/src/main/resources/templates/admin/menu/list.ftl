<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/jquery.edit.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery.menu_class.js"></script>

<script type="text/javascript">
    var vadate=false;

    function delClass(){
        var items = $("input[name='ids']:checked").length;
        if (items==0) {
            alert("请至少选择一个要删除的项目");
        }else{
            if(confirm('您确定要删除吗?')){
                $('#form_list').submit();
            }
        }
    }
    
    function delClassid(classid){
           //校验菜单底线是否含有子菜单
           valicountparent(classid);
           if(vadate){
	           if(confirm('您确定要删除吗?')){
	           var url = "${base}/menu/class/deleteid";
			   var para = {"classid":classid};
			   $.ajax({
		             type: "post",
		             url: url,
		             data: para,
		             dataType: "json",
					 async:false,
					 success:function(data) {
						if(data.success == "true"){
						     alert(data.result);
						     window.location = '${base}/menu/class/list'
						}else{
							  alert(data.result);
						}
					}	
		         });
		       }
		     }else{
		         alert("请删除子菜单后再进行删除！");
		     }  
        }
 function valicountparent(classid){
       var url = "${base}/menu/class/validateparentid";
	   var para = {"id":classid};
	   var va=
       $.ajax({
	             type: "post",
	             url: url,
	             data: para,
	             dataType: "json",
				 async:false,
				 success:function(data) {
					if(data){
					    vadate=true;
					    return true;
					}else{
					    vadate=false;
						return false;
					}
				}	
	         });
       }  
    
   
</script>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>菜单管理</h3>
            <ul class="tab-base">
                <li><a href="${base}/menu/class/list" class="current"><span>管理</span></a></li>
                <li><a href="${base}/menu/class/forward?mid=0&mparentid=0"><span>新增</span></a></li>
                <#--<li><a href="javaScript:;"><span>TAG管理</span></a></li>-->
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <table class="table tb-type2" id="prompt">
        <tbody>
        <tr style="background: none repeat scroll 0% 0% rgb(255, 255, 255);" class="space odd">
            <th colspan="12"><div class="title">
                <h5>操作提示</h5>
                <span class="arrow"></span></div></th>
        </tr>
        <tr style="background: none repeat scroll 0% 0% rgb(255, 255, 255);" class="odd">
            <td><ul>
               <#-- <li>当店主添加商品时可选择商品分类，用户可根据分类查询物资列表</li>
                <li>点击分类名前“+”符号，显示当前分类的下级分类</li>-->
            </ul></td>
        </tr>
        </tbody>
    </table>
    <form method="post" id='form_list' action="${base}/menu/class/delete">
    <table class="table tb-type2" id="acct_grid">
        <thead>
        <tr class="thead">
            <th></th>
            <th>排序</th>
            <th>菜单名称</th>
            <th>链接</th>
            <th>可见</th>
            <th>权限标识</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <#list list as class>
        <tr class="hover edit">
            <td class="w48"><input type="checkbox" name="ids" value="${class.mid}" class="checkitem">
                <#if class.hasChild != 0>
                    <img fieldid="${class.mid}" status="open" nc_type="flex" level="1" src="${base}/res/images/tv-expandable.gif">
                <#else>
                    <img fieldid="${class.mid}" status="close" nc_type="flex" src="${base}/res/images/tv-item.gif">
                </#if></td>
            <td class="w48 sort">
            	<span title="可编辑" datatype="number" modUrl="${base}/menu/class/modifySort"
                  fieldid="${class.mid}" fieldname="gcSort" nc_type="inline_edit" class="editable ">
            		${class.msort}</span>
            </td>
            <td class="w50pre name">
            <#--<span title="可编辑" required="1" fieldid="${class.mid}" modUrl="${base}/menu/class/modifyName"
                  fieldname="gcName" nc_type="inline_edit" class="editable ">${class.mname}</span>-->
                  ${class.mname}
                <a class="btn-add-nofloat marginleft" href="${base}/menu/class/forward?mid=0&mparentid=${class.mid}"><span>
                新增下级</span></a>
            </td>
            <td>${class.murl}</td>
            <td>${class.isshow}</td>
            <td>${class.permission}</td>
            <td class="w84">
                <a href="${base}/menu/class/forward?mid=${class.mid}&mparentid=${class.mparentid}">编辑</a> |
                <a href="javascript:;" onclick="delClassid('${class.mid}');" > 删除</a>
            </td>
        </#list>

        </tbody>
        <tfoot>
        <tr class="tfoot">
            <td><input type="checkbox" class="checkall" id="checkall_2"></td>
            <td id="batchAction" colspan="15"><span class="all_checkbox">
            <label for="checkall_2">全选</label>
            </span>&nbsp;&nbsp;<a href="JavaScript:void(0);" class="btn"
                                  onclick="delClass()">
                <span>删除</span></a>
            </td>
        </tr>
        </tfoot>
    </table>
    </form>
</div>

<!-- content] -->
</@layout.body>