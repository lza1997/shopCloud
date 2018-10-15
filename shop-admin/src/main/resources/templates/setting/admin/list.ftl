<@p.header title="admin">
<script type="text/javascript" src="${base}/res/js/jquery.js"></script>
<script type="text/javascript" src="${base}/res/js/common.js" charset="utf-8"></script>

<script type="text/javascript">
 function deleteadmin(){
  		var items = $("input[name='ids']:checked").length;
  		 alert(items);
        if (items==0) {
            alert("你还没有选择要删除的对象");
        }else{
            if(confirm('您确定要删除吗?')){              		
                $("#form_list").attr("action",APP_BASE+"/setting/admin/delete");
                $('#form_list').submit();
            }
        }
    }
    
      function delClassid(adminid){
              //校验菜单底线是否含有子菜单
	           if(confirm('您确定要删除吗?')){
	           var url = "${base}/setting/admin/deleteid";
			   var para = {"adminid":adminid};
			   $.ajax({
		             type: "post",
		             url: url,
		             data: para,
		             dataType: "json",
					 async:false,
					 success:function(data) {
						if(data.success == "true"){
						     alert(data.result);
						     window.location = '${base}/setting/admin/list'
						}else{
							  alert(data.result);
						}
					}	
		         });
		       }
        }   
</script>
</@p.header>
<!-- 分页查询表单 -->
<@layout.body>
<div class="page">
 
  <div class="fixed-bar">
        <div class="item-title">
            <h3>管理员管理</h3>
            <ul class="tab-base">
                <li><a href="${base}/setting/admin/index" class="current"><span>管理员</span></a></li>
                <li><a href="${base}/setting/admin/add" ><span>添加管理员</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
   <form action="${base}/setting/admin/list" class="" id="listDataFm" target="#dataListDiv">		
	<!-- 数据列表 -->
	<table class="table tb-type2">
      <thead>
        <tr class="space">
          <th colspan="15" class="nobg">列表</th>
        </tr>
        <tr class="thead">
          <th><input class="checkall" id="checkallBottom" name="chkVal" type="checkbox"></th>
          <th>登录名</th>
          <th class="align-center">上次登录</th>
          <th class="align-center">登录次数</th>
          <th class="align-center">权限组</th>
          <th class="align-center">操作</th>
        </tr>
      </thead>
      <tbody>
     
       <#if datas??>
		  <#list datas as adminVo>
		  	<tr style="background: none repeat scroll 0% 0% rgb(255, 255, 255);" class="hover">
	          <td class="w24">
	         <#-- <input onclick="javascript:chkRow(this);" name="ids"  value="${adminVo.adminId}" <#if adminVo.adminIsSuper==1>disabled="disabled" </#if> <#if adminVo.adminIsSuper!=1>class="checkitem"</#if> type="checkbox"></td>-->
	          <input  name="ids"  value="${adminVo.adminId}" <#if adminVo.adminIsSuper==1>disabled="disabled" </#if> <#if adminVo.adminIsSuper!=1>class="checkitem"</#if> type="checkbox"></td>
	          <td>${adminVo.adminName}</td>
	          <td class="align-center">
	          <#if adminVo.adminLoginTime==null>此管理员未登录过</#if>
	          <#if adminVo.adminLoginTime!=null>${adminVo.adminLoginTimeStr?string('yyyy-MM-dd HH:mm:ss')}</#if>
	          </td>
	          <td class="align-center">${adminVo.adminLoginNum}</td>
	          <td class="align-center">${adminVo.gname}</td>
	          <td class="w150 align-center">
	          	<#if adminVo.adminIsSuper==1>超级管理员不可编辑</#if>
	          	<#if adminVo.adminIsSuper!=1>
	          		<#--<a href="javascript:void(0)" onclick="if(confirm('您确定要删除吗?')){location.href='${base}/setting/admin/delete?ids=${adminVo.adminId}'}">删除</a>--> 
	          		<a href="javascript:void(0)" onclick="delClassid('${adminVo.adminId}');" > 删除</a> |
	          		<a href="${base}/setting/admin/findById?id=${adminVo.adminId}">编辑</a>
	          		<#--<a href="${base}/role/memberrolelist?adminid=${adminVo.adminId}&roleids=${adminVo.roleid}">权限设置</a> -->
	          	</#if>
	          </td>
        	</tr>
		  </#list>
		</#if>
      
      </tbody>
      <tfoot>
          <tr class="tfoot">
          <td><input class="checkall" id="checkallBottom" name="chkVal" type="checkbox"></td>
          <td colspan="16"><label for="checkallBottom">全选</label>
           &nbsp;&nbsp;
           <#--<a href="javascript:void(0);" class="btn" onclick="if(confirm('您确定要删除吗?')){$('#form_admin').submit();}"><span>删除</span></a>-->
           <a href="javascript:void(0);" class="btn" onclick="deleteadmin()"><span>删除</span></a>
          <div class="pagination"> <ul><li><span>首页</span></li><li><span>上一页</span></li><li><span class="currentpage">1</span></li><li><span>下一页</span></li><li><span>末页</span></li></ul> </div></td>
        </tr>
      </tfoot>
    </table>
        </form>
</div>

</@layout.body>
	<script type="text/javascript">
	/*初始化结果界面*/
	//$(function(){frameOperate.initQueryPage("#listDataTab");});

	
	
</script>