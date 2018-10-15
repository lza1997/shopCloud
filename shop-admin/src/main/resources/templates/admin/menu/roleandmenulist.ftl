<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/jquery.edit.js"></script>
<script type="text/javascript">
	
    function delClass(){
        var items = $("input[name='ids']:checked").length;
        var check = $("input[name='ids']:checked"); //得到所有被选中的checkbox  
        var str='';              //定义变量  
        check.each(function(i) {         //循环拼装被选中项的值  
            str += $(this).val() + ',';  
        });
        $("#menuids").val(str);
       if (items==0) {
            alert("请至少选择一个菜单的选项");
        }else{
            if(confirm('您确定要关联吗?')){
                $('#form_list').submit();
            }
        }
    }
   
     $(function(){
          loadmenu();
     });
    
    function loadmenu(){
      var sdt='${roleclassidstr}';
      //var sdt='16,17,18,19,20,21,22'
      var array;
      array=sdt.split(',');
      $.each(array,function(n,value) {  
      //var pr = $(this).parent('td').parent('tr16');
      var obj = $(this);
      var mid=array[n];
      $(this).attr('status','none');
      var pr ="tr"+array[n];
      $.ajax({
				url: APP_BASE+'/menu/class/child?id='+mid+'&level='+(Number(1)+1)+'&roleid='+'${roleid}',
				dataType: 'json',
				success: function(data){
					var src='';
					for(var i = 0; i < data.length; i++){
						 var tmp_vertline = "<img class='preimg' src='"+APP_BASE+"/res/images/vertline.gif'/>";
						src += "<tr id=tr"+data[i].mid+">";
						var pr2="tr"+data[i].mid;
						if(data[i].ischange == 1){
						  src += "<td class='w36'><input type='checkbox' name='ids' value='"+data[i].mid+"' class='checkitem' checked='true'>";
						}else{
						  src += "<td class='w36'><input type='checkbox' name='ids' value='"+data[i].mid+"' class='checkitem'>";
						}
						//图片
						if(data[i].hasChild != 0){
							src += " <img fieldid='"+data[i].mid+"' status='open' level="+(data[i].deep)+" nc_type='flex' src='"+APP_BASE+"/res/images/tv-collapsable.gif' />";
						}else{
							src += " <img fieldid='"+data[i].mid+"' status='none' nc_type='flex' src='"+APP_BASE+"/res/images/tv-item.gif' />";
						}
						src += "</td><td class='w48 sort'>";						
						//排序
						src += " <span title='' ajax_branch='goods_class_sort' datatype='number' fieldid='"+data[i].mid+"' fieldname='gc_sort' nc_type='inline_edit' class='editable tooltip'>"+data[i].msort+"</span></td>";
						//名称
						src += "<td class='w50pre name'>";
						
						
						for(var tmp_i=1; tmp_i < (data[i].deep-1); tmp_i++){  
							src += tmp_vertline;
						}
						if(data[i].hasChild != 0){
							src += " <img fieldid='"+data[i].mid+"' status='open' nc_type='flex' level="+(data[i].deep)+" src='"+APP_BASE+"/res/images/tv-item1.gif' />";
						}else{
							src += " <img fieldid='"+data[i].mid+"' status='none' nc_type='flex' src='"+APP_BASE+"/res/images/tv-expandable1.gif' />";
						}
						src += " <span title='' required='1' fieldid='"+data[i].mid+"' ajax_branch='goods_class_name' fieldname='gc_name' class='editable tooltip'>"+data[i].mname+"</span>";
						//新增下级
						
						src += "</td>";
						//类型
						src += "<td>"+data[i].murl+"</td>";
						//操作
						src += "</tr>";
						if(data[i].hasChild != 0 && data[i].deep == 2){
						   loadmenu2(pr2,data[i].mid);//加载第三级菜单
						}
					}
					//插入
					//alert(str);
					//$("#"+str).after(src);
					$("#"+pr).after(src);
					obj.attr('status','close');
					obj.attr('src',obj.attr('src'));
					$('img[nc_type="flex"]').unbind('click');
					$('span[nc_type="inline_edit"]').unbind('click');
					//重现初始化页面
                    $.getScript(APP_BASE+"/res/js/jquery.edit.js");
					//$.getScript(APP_BASE+"/res/js/jquery.roleandmenu_class.js");
					
					$.getScript(APP_BASE+"/res/js/admincp.js");
				}
				/* ,
				error: function(){
					alert('获取信息失败');
				} */
			});
		});  	
    }
    
    
    function loadmenu2(tr3,mid){
      $.ajax({
				url: APP_BASE+'/menu/class/child?id='+mid+'&level='+(Number(1)+1)+'&roleid='+'${roleid}',
				dataType: 'json',
				success: function(data){
					var src='';
					for(var i = 0; i < data.length; i++){
						 var tmp_vertline = "<img class='preimg' src='"+APP_BASE+"/res/images/vertline.gif'/>";
						src += "<tr>";
						if(data[i].ischange == 1){
						  src += "<td class='w36'><input type='checkbox' name='ids' value='"+data[i].mid+"' class='checkitem' checked='true'>";
						}else{
						  src += "<td class='w36'><input type='checkbox' name='ids' value='"+data[i].mid+"' class='checkitem'>";
						}
						//图片
						if(data[i].hasChild != 0){
							src += " <img fieldid='"+data[i].mid+"' status='open' level="+(data[i].deep)+" nc_type='flex' src='"+APP_BASE+"/res/images/tv-expandable.gif' />";
						}else{
							src += " <img fieldid='"+data[i].mid+"' status='none' nc_type='flex' src='"+APP_BASE+"/res/images/tv-item.gif' />";
						}
						src += "</td><td class='w48 sort'>";						
						//排序
						src += " <span title='' ajax_branch='goods_class_sort' datatype='number' fieldid='"+data[i].mid+"' fieldname='gc_sort' nc_type='inline_edit' class='editable tooltip'>"+data[i].msort+"</span></td>";
						//名称
						src += "<td class='w50pre name'>";
						
						
						for(var tmp_i=1; tmp_i < (data[i].deep-1); tmp_i++){  
							src += tmp_vertline;
						}
						if(data[i].hasChild != 0){
							src += "　<img fieldid='"+data[i].mid+"' status='open' nc_type='flex' level="+(data[i].deep)+" src='"+APP_BASE+"/res/images/tv-item1.gif' />";
						}else{
							src += "　<img fieldid='"+data[i].mid+"' status='none' nc_type='flex' src='"+APP_BASE+"/res/images/tv-expandable1.gif' />";
						}
						src += " <span title='' required='1' fieldid='"+data[i].mid+"' ajax_branch='goods_class_name' fieldname='gc_name' class='editable tooltip'>"+data[i].mname+"</span>";
						//新增下级
						
						src += "</td>";
						//类型
						src += "<td>"+data[i].murl+"</td>";
						//操作
						src += "</tr>";
					}
					//插入
					//alert(str);
					//$("#"+str).after(src);
					$("#"+tr3).after(src);
					obj.attr('status','close');
					obj.attr('src',obj.attr('src'));
					$('img[nc_type="flex"]').unbind('click');
					$('span[nc_type="inline_edit"]').unbind('click');
					//重现初始化页面
                    $.getScript(APP_BASE+"/res/js/jquery.edit.js");
					//$.getScript(APP_BASE+"/res/js/jquery.roleandmenu_class.js");
					
					$.getScript(APP_BASE+"/res/js/admincp.js");
				}
				/* ,
				error: function(){
					alert('获取信息失败');
				} */
			});
    }
</script>
</@layout.head>
<@layout.body>
<div class="page">
   
    <table class="table tb-type2" id="prompt">
        <tbody>
        <tr style="background: none repeat scroll 0% 0% rgb(255, 255, 255);" class="space odd">
            <th colspan="12"><div class="title">
                <h5>操作提示</h5>
                <span class="arrow"></span></div></th>
        </tr>
       
        </tbody>
    </table>
    <form method="post" id='form_list' action="${base}/roleMenu/saveOrUpdate">
    <table class="table tb-type2" id="acct_grid">
        <thead>
        <tr class="thead">
            <th></th>
            <th>排序</th>
            <th>菜单名称</th>
            <th>菜单地址</th>
        </tr>
        </thead>
        <tbody>
        <#list list as class>
        <tr class="hover edit" id="tr${class.mid}">
            <td class="w48"><input type="checkbox" name="ids" value="${class.mid}" class="checkitem" <#list rolemenulist as rolemenu><#if rolemenu.menuId == class.mid>checked</#if></#list>>
                <#if class.hasChild != 0>
                    <img fieldid="${class.mid}" status="open" nc_type="flex" level="1" src="${base}/res/images/tv-collapsable.gif">
                <#else>
                    <img fieldid="${class.mid}" status="open" nc_type="flex" src="${base}/res/images/tv-item.gif">
                </#if></td>
                <font id="dff"></font>
            <td class="w48 sort">
            <span title="" datatype="number" modUrl="${base}/menu/class/modifySort"
                  fieldid="${class.mid}" fieldname="gcSort" nc_type="inline_edit" class="editable ">
            ${class.msort}</span></td>
            <td class="w50pre name">
            <span title="" required="1" fieldid="${class.mid}" modUrl="${base}/menu/class/modifyName"
                  fieldname="gcName" class="editable ">${class.mname}</span>
            </td>
             <td>${class.murl}</td>
           
        </#list>

        </tbody>
        <tfoot>
        <tr class="tfoot">
            <td><input type="checkbox" class="checkall" id="checkall_2"><input type="hidden" name="roleid" id="roleid" value="${roleid}" /><input type="hidden" name="menuids" id="menuids" value="" /></td>
            <td id="batchAction" colspan="15"><span class="all_checkbox">
            <label for="checkall_2">全选</label>
             </span>&nbsp;&nbsp;<a href="JavaScript:void(0);" class="btn"
                                  onclick="delClass()">
                <span>保存</span></a>
            </td>
        </tr>
        </tfoot>
    </table>
    </form>
</div>

<!-- content] -->
</@layout.body>