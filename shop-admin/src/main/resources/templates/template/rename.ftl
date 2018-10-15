<@layout.head>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript">
    $(function(){
      
    });
  </script>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>模板管理</h3>
            <ul class="tab-base">
            
                <li><a href="JavaScript:history.go(-1);" class="current"><span>返回</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form method="post" action="o_rename" id="jvForm">
	<table width="100%" class="table tb-type2" cellpadding="2" cellspacing="1" border="0">
	<tr>
	<td width="20%">原名称:</td><td width="80%">
	${origName}</td></tr>
	<tr>
	<td width="20%" ><span >*</span>新名称:</td><td width="80%"><input type="text" maxlength="100" value="${origName}" name="distName" class="required" size="40" maxlength="100"/></td></tr><tr><td colspan="2" class="pn-fbutton">
		<input type="hidden" name="origName" value="${origName}"/>
		<input type="hidden" name="root" value="${root}"/>
		<input type="submit" value="提交" class="submit" class="submit"/> &nbsp; <input type="reset" value="重置" class="reset" class="reset"/>
	</td></tr>
	</table>
</form>
    
     

    <div class="clear"></div>
</div>
</@layout.body>