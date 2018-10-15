<@layout.head>
<link href="${base}/res/css/member_store.css" rel="stylesheet" type="text/css">
<link href="${base}/res/css/member.css" rel="stylesheet" type="text/css">
<link href="${base}/res/css/base.css" rel="stylesheet" type="text/css">
<link href="${base }/res/css/transport.css" rel="stylesheet" type="text/css">
<link href="${base}/res/css/member_user.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="${base}/res/js/jquery.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery.validation.min.js"></script>
<script type="text/javascript" src="${base}/res/js/common.js"></script>
<script type="text/javascript" src="${base}/res/js/common_select.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/ajaxfileupload/ajaxfileupload.js"></script>
<script type="text/javascript" src="${base}/res/js/layer/layer.js"></script>
</@layout.head>

<@layout.body>
<div class="layout">
  <div class="right-content" style="width:860px; padding-right:210px;">
	       <div class="path" style="margin:0px; border-bottom:none">
	       <div>   
	                <a href="#">商家中心</a> <span>></span>
	                <a href="#"/>店铺分类管理 </a><span>></span>分类   
	       </div>
     </div>
    <div class="main">
<div class="wrap">
  <div class="tabmenu">
    <ul class="tab pngFix">
  <li class="active"><a  href="#?act=store&op=store_goods_class">店铺分类</a></li></ul>
    <a href="javascript:void(0)" class="ncu-btn3" nc_type="dialog" dialog_title="新增分类" dialog_id="my_category_add" dialog_width="480" onclick="addStoreclass();" title="新增分类">新增分类</a></div>
  <form method="post" id='form_list' action="${base}/storeGoodsClass/delete">
  <table class="ncu-table-style" id="my_category" server="" >
        <thead>
      <tr nc_type="table_header">
        <th class="w30"></th>
        <th coltype="editable" column="stc_name" checker="check_required" inputwidth="50%">分类名称</th>
        <th class="w60" coltype="editable" column="stc_sort" checker="check_max" inputwidth="30px">排序</th>
        <th class="w120" coltype="switchable" column="stc_state" checker="" onclass="showclass-ico-btn" offclass="noshowclass-ico-btn">显示</th>
        <th class="w90">操作</th>
      </tr>
      <tr>
        <td class="tc"><input id="all" type="checkbox" class="checkall" /></td>
        <td colspan="20"><label for="all">全选</label>
          <input type="button" name="class_ids"  class="ncu-btn1" nc_type="batchbutton"  value="删除"/>
        </td>
      </tr>
    </thead>
    <tbody id="treet1">
			   <#if storeGoodsClassListT?exists && storeGoodsClassListT?size gt 0>
					<#list storeGoodsClassListT as storeclass>
						 <#if storeclass.hasChild!=0 && storeclass.stcParentId==0>
						      <tr class="bd-line" nc_type="table_item" idvalue="${storeclass.stcId}" name="ids">
					            <td class="tc"><input type="checkbox" class="checkitem" name="storeclassid" value="${storeclass.stcId}"/></td>
					            <td class="tl">
					              <img style="display: inline;" src="${base}/res/images/treetable/tv-collapsable.gif" class="parimg" id="treet11">
					              <span class="ml5" nc_type="editobj" >${storeclass.stcName}</span>
					              <span class="add_ico_a"><a href="javascript:void(0)" nc_type="dialog" dialog_width="480" dialog_title="新增下级" dialog_id="my_category_add"  onclick="addStoreclass1(${storeclass.stcId});" >新增下级</a></span>
						         </td>
						        <td>
						               <span nc_type="editobj">${storeclass.stcSort}</span>
						        </td>
						        <td>
								         <#if storeclass.stcState>
						                      <a href="JavaScript:void(0);"  title="可编辑" name="onclik" pid="${storeclass.stcId}" pstate="false">
							                       <span nc_type="editobj"  class="showclass-ico-btn" status="on" >
										           </span>
						                      </a>
				                         <#else>
						                      <a href="JavaScript:void(0);"  title="可编辑" name="onclik" pid="${storeclass.stcId}" pstate="true">
							                         <span nc_type="editobj" class="noshowclass-ico-btn" status="off">
			                                         </span>
									          </a>
				                         </#if>
						        </td>
						        <td>
						           <p><a href="javascript:void(0)" nc_type="dialog" dialog_width="480" dialog_title="编辑分类" dialog_id="my_category_edit" onclick="editStoreclass(${storeclass.stcId});">编辑分类</a></p>
						           <p><a href="javascript:void(0)" onclick="deleteStoreclass(${storeclass.stcId});" class="ncu-btn2 mt5">删&nbsp;除</a></p>
						        </td>
				            <#list storeclass.classList as storeclass2>
					              <tr class="bd-line" nc_type="table_item" >
					                <td class="tc">
					                     <input type="checkbox" class="checkitem" name="storeclassid" value="${storeclass2.stcId}" name="ids"/>
					                </td>
					                <td class="tl">
					                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					                     <img src="${base}/images/treetable/tv-item.gif" class="ttimage" id="treet12" style="display: inline;">
					                     <span class="ml5" nc_type="editobj" >${storeclass2.stcName}</span>
					                </td>
					                <td>
					                     <span nc_type="editobj">${storeclass2.stcSort}</span>
					                </td>
							        <td>
								         <#if storeclass2.stcState>
						                      <a href="JavaScript:void(0);"  title="可编辑" name="onclik" pid="${storeclass2.stcId}" pstate="false">
							                       <span nc_type="editobj"  class="showclass-ico-btn" status="on" >
										           </span>
						                      </a>
				                         <#else>
						                      <a href="JavaScript:void(0);"  title="可编辑" name="onclik" pid="${storeclass2.stcId}" pstate="true">
							                         <span nc_type="editobj" class="noshowclass-ico-btn" status="off">
			                                         </span>
									          </a>
				                         </#if>
							        </td>
						           <td>
								       <p><a href="javascript:void(0)" nc_type="dialog" dialog_width="480" dialog_title="编辑分类" dialog_id="my_category_edit" onclick="editStoreclass(${storeclass2.stcId});">编辑分类</a></p>
						               <p><a href="javascript:void(0)" onclick="deleteStoreclass(${storeclass2.stcId});" class="ncu-btn2 mt5">删&nbsp;除</a></p>
								   </td>
					           </tr>
					           </td>
						    </#list>
						     </tr>
						 <#else>
						    <tr class="bd-line" nc_type="table_item" idvalue="${storeclass.stcId}" >
						        <td class="tc">
						                    <input type="checkbox" class="checkitem" value="${storeclass.stcId}" name="storeclassid"/>
						        </td>
						        <td class="tl">
						                    <span class="ml5" nc_type="editobj" >${storeclass.stcName}</span>
						                    <span class="add_ico_a"><a href="javascript:void(0)" nc_type="dialog" dialog_width="480" dialog_title="新增下级" dialog_id="my_category_add"  onclick="addStoreclass1(${storeclass.stcId});" >新增下级</a></span>
						        </td>
						        <td>
						           		 <span nc_type="editobj">${storeclass.stcSort}</span>
						        </td>
						        <td>
						                <#if storeclass.stcState>
						                      <a href="JavaScript:void(0);"  title="可编辑" name="onclik" pid="${storeclass.stcId}" pstate="false">
							                       <span nc_type="editobj"  class="showclass-ico-btn" status="on" >
										           </span>
						                      </a>
				                         <#else>
						                      <a href="JavaScript:void(0);"  title="可编辑" name="onclik" pid="${storeclass.stcId}" pstate="true">
							                         <span nc_type="editobj" class="noshowclass-ico-btn" status="off">
			                                         </span>
									          </a>
				                         </#if>
						        </td>
						        <td>
						            <p><a href="javascript:void(0)" nc_type="dialog" dialog_width="480" dialog_title="编辑分类" dialog_id="my_category_edit" onclick="editStoreclass(${storeclass.stcId});">编辑分类</a></p>
						            <p><a href="javascript:void(0)" onclick="deleteStoreclass(${storeclass.stcId});" class="ncu-btn2 mt5">删&nbsp;除</a></p>
					            </td>
					        </tr>
						 </#if>
					</#list>
			</#if>
          </tbody>
            <tfoot>
      <tr>
	        <td class="tc"><input id="all2" type="checkbox" class="checkall" /></td>
	        <td colspan="15"><label for="all2">全选</label>
	        <input type="button" name="class_ids"  class="ncu-btn1" value="删除"/>
	        </td>
      </tr>
    </tfoot>
   </table>
  </form>
</div>


<script type="text/javascript">
                var va=0;//全局变量校验父子节点
			     /*界面初始化*/
			    /*初始化*/
			    function initDataList(){
			        setTimeout("window.location = '${base}/storeGoodsClass/index'" , 1200);
			    }
	            /*添加品牌*/
			    function addStoreclass1(stclassid){
			         layer.open({
			            type:2,
			            move: false,
			            shade: false,
			            title: '新增店铺分类',
			            content:['${base}/storeGoodsClass/addIndex?stcParentId='+stclassid,'no'],
			            area: ['550px', '400px'],
			            btns: 2,
			            btn: ['确定','取消'],
			            yes: function (index) {
			                var stcName = layer.getChildFrame('#stcName').val(); //分类名称
			                var stcSort = layer.getChildFrame('#stcSort').val(); //分类排序
			                var stcState = layer.getChildFrame('input:radio:checked').val(); //是否显示
			                if(""==stcName){
			                	layer.getChildFrame('#vat_stcName').html('店铺分类名不能为空');
			                	return false;
			                }
							if(""==stcSort){
								layer.getChildFrame('#vat_stcSort').html('店铺排序不能为空');
								return false;
			                }
			                var stcParentId="";
			                 $.ajax({
			                    url:'${base}/storeGoodsClass/saveOrUpdate',
			                    type:'post',
			                    data :{stcParentId:stclassid,stcName:stcName,stcSort:stcSort,stcState:stcState},
			                    dataType:'json',
			                    success:function(data){
			                        if(data.success){
			                             layer.msg('新增成功', {icon:1},initDataList());
			                        }else{
			                            layer.msg('新增失败', {icon:2});
			                        }
			                    },error:function(data){
			                         layer.msg('通信失败', {icon:2});
			                    }
			                });
			                layer.close(index); //一般设定yes回调，必须进行手工关闭
			            },
			            cancel: function(index){
			                layer.close(index);
			            }
			        });
			    }
			    
			    function addStoreclass(){
			        layer.open({
			            type:2,
			            move: false,
			            shade: false,
			            title: '新增店铺分类',
			            content:['${base}/storeGoodsClass/addIndex','no'],
			            area: ['550px', '400px'],
			            btns: 2,
			            btn: ['确定','取消'],
			            yes: function (index) {
			                var stcName = layer.getChildFrame('#stcName').val(); //分类名称
			                var stcSort = layer.getChildFrame('#stcSort').val(); //分类排序
			                var stcState = layer.getChildFrame('input:radio:checked').val(); //是否显示
			                if(""==stcName){
			                	layer.getChildFrame('#vat_stcName').html('店铺分类名不能为空');
			                	return false;
			                }
							if(""==stcSort){
								layer.getChildFrame('#vat_stcSort').html('店铺排序不能为空');
								return false;
			                }
			                var stcParentId= layer.getChildFrame('#stcParentId').val(); //父id
			                 $.ajax({
			                    url:'${base}/storeGoodsClass/saveOrUpdate',
			                    type:'post',
			                    data : {stcName:stcName, stcSort:stcSort, stcState:stcState,stcParentId:stcParentId},
			                    dataType:'json',
			                    success:function(data){
			                        if(data.success){
			                             layer.msg('新增成功', {icon: 1},initDataList());
			                        }else{
			                            layer.msg('新增失败', {icon: 2});
			                        }
			                    },error:function(data){
			                         layer.msg('通信失败', {icon: 2});
			                    }
			                });
			                layer.close(index); //一般设定yes回调，必须进行手工关闭
			            },
			            cancel: function(index){
			                layer.close(index);
			            }
			        });
			    }
			    
			     function editStoreclass(sclassid){
			        layer.open({
			            type:2,
			            move: false,
			            shade: false,
			            title: '编辑店铺分类',
			            content:['${base}/storeGoodsClass/editIndex?stcId='+sclassid,'no'],
			            area: ['550px', '400px'],
			            btns: 2,
			            btn: ['确定','取消'],
			            yes: function (index) {
			                var stcName = layer.getChildFrame('#stcName').val(); //分类名称
			                var stcSort = layer.getChildFrame('#stcSort').val(); //分类排序
			                var stcState = layer.getChildFrame('input:radio:checked').val(); //是否显示
			                if(""==stcName){
			                	layer.getChildFrame('#vat_stcName').html('店铺分类名不能为空');
			                	return false;
			                }
							if(""==stcSort){
								layer.getChildFrame('#vat_stcSort').html('店铺排序不能为空');
								return false;
			                }
			                var stcId="";
			                 $.ajax({
			                    url:'${base}/storeGoodsClass/saveOrUpdate',
			                    type:'post',
			                    data : {stcName:stcName,stcSort:stcSort,stcState:stcState,stcId:sclassid},
			                    dataType:'json',
			                    success:function(data){
			                        if(data.success){
			                             layer.msg('新增成功', {icon: 1},initDataList());
			                        }else{
			                            layer.msg('新增失败', {icon: 2});
			                        }
			                    },error:function(data){
			                         layer.msg('通信失败', {icon: 2});
			                    }
			                });
			                layer.close(index); //一般设定yes回调，必须进行手工关闭
			            },
			            cancel: function(index){
			                layer.close(index);
			            }
			        });
			    }
			    
    //准备删除
    function deleteStoreclass(id){
        var url = '${base}/storeGoodsClass/delete?ids='+id;
	        layer.confirm('确定删除?', function(){
	            $.ajax({
	                type: "post",
	                url: url,
	                data: null,
	                dataType: "json",
	                async:false,
	                success:function(data) {
	                    if(data.message =="true"){
	                         layer.msg(data.result,{icon:1},initDataList());
	                    }else{
	                         layer.msg(data.result,{icon:2});
	                    }
	                }
	            });
	        });
    }
    
     function validatebyname(id){
        var url = '${base}/storeGoodsClass/validebyparentid?stid='+id;
            $.ajax({
                type: "post",
                url: url,
                data: null,
                dataType: "json",
                async:false,
                success:function(data) {
                    if(data){
                       va=1;
                    }else{
                        layer.msg('请删除子节点后，再进行删除',{icon:2});
                    }
                }
            });
    }
    
    //修改是否显示状态
    $("[name=onclik]").live("click",function(){
            var id = $(this).attr("pid");
            var value=$(this).attr("pstate");
            var sdf=$(this).find('span:first');
            var url = '${base}/storeGoodsClass/reupdatestate?stcId='+id+'&value='+value;
            $.ajax({
                type: "post",
                url: url,
                data: null,
                dataType: "json",
                async:false,
                success:function(data) {
                    if(data){
                         if(sdf.attr("class")=='noshowclass-ico-btn'){
				              sdf.attr("class","showclass-ico-btn");
				            }else{
				              sdf.attr("class","noshowclass-ico-btn");
				            }
                    }else{
                         layer.msg("修改失败",{icon:2});
                    }
                }
            }); 
       });
       //批量删除
       $("[name=class_ids]").live("click",function(){
			var items = $("input[name='storeclassid']:checked").length;
			var str="";
            $("input[name='storeclassid']:checked").each(function(){ 
                if($(this).attr("checked")){
                    str += $(this).val()+","
                }
            })
			if (items == 0) {
			    layer.msg("请至少选择一项",{icon:2});
			} else {
				deleteStoreclass(str);
			}
	});
</script>
</body>
</html>
</@layout.body>