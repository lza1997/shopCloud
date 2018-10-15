<@layout.head>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<link rel="stylesheet" type="text/css" href="${base}/res/js/dialog/dialog.css"  />
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/dialog/dialog.js" id="dialog_js"></script>
<script type="text/javascript" src="${base}/res/js/ajaxfileupload/ajaxfileupload.js"></script>
<script type="text/javascript" src="${base}/res/js/common_select.js"></script>
<script type="text/javascript" src="${base}/res/js/admincp.js"></script>
<script type="text/javascript">
    DialogManager.close = function(id) {
        __DIALOG_WRAPPER__[id].hide();
        ScreenLocker.unlock();
    }
    DialogManager.show = function(id) {
        if (__DIALOG_WRAPPER__[id]) {
            __DIALOG_WRAPPER__[id].show();
            ScreenLocker.lock();
            return true;
        }
        return false;
    }
    function show_dialog(id,title) {//弹出框
        if(DialogManager.show(id)) return;
        var d = DialogManager.create(id);//不存在时初始化(执行一次)
        var dialog_html = $("#"+id+"_dialog").html();
        $("#"+id+"_dialog").remove();
        d.setTitle(title);
        d.setContents('<div id="'+id+'_dialog" class="'+id+'_dialog">'+dialog_html+'</div>');
        d.setWidth(640);
        d.show('center',1);
        //update_dialog(id);
    }
</script>
</@layout.head>
<@layout.body>
<div class="page">
<div class="fixed-bar">
    <div class="item-title">
        <h3>首页管理</h3>
        <ul class="tab-base">
            <li><a href="${base}/website/index/list"><span>管理</span></a></li>
            <li><a href="JavaScript:void(0);" class="current"><span>新增</span></a></li>
            <#-- <li><a href="${base}/website/index/forwardBanner"><span>新增图片</span></a></li>
            <li><a href="${base}/website/index/getBrand"><span>新增品牌</span></a></li> -->
        </ul>
    </div>
</div>
<div class="fixed-empty"></div>
<form id="store_class_form" name="floorForm" method="post" action="${base}/website/index/save">
    <table class="table tb-type2">
        <tbody>
        <input type="hidden" name="gcId" id="gcId">
       <input type="hidden" name="type" value="${type}"/>
        <tr>
            <td colspan="2" class="required"><label for="sort">楼层主题分类：</label></td>
        </tr>
        <tr class="noborder">
            <td class="vatop rowform">
                <input type="button" value="编辑" onclick="show_dialog('category_list','楼层主题分类')"/>
                <div id="floorClassData"></div>
            </td>
            <td class="vatop tips"></td>
        </tr>
        <tr>
            <td colspan="2" class="required"><label for="sort">楼层主题图片：</label></td>
        </tr>
        <tr class="noborder">
        	<input type="hidden" name="floorImg" id="floorImg"/>
        	<input type="hidden" name="floorUrl"  id="floorUrl"/>
            <td class="vatop rowform">
                <img id="floorThemeImg" width="212px" src="${base}/res/images/nopic.png"/>
                <input type="button" value="编辑" onclick="show_dialog('upload_floorTheme','楼层主题图片')"/></td>
            <td class="vatop tips">请上传212×241像素GIF\JPG\PNG格式图片</td>
        </tr>
        <tr class="noborder">
            <td colspan="2" class="required"><label>楼层导航图片：</label></td>
        </tr>
        <tr class="noborder">
        	<input type="hidden" name="bannerImg" id="bannerImg"/>
        	<input type="hidden" name="bannerUrl" id="bannerUrl"/>
            <td class="vatop rowform">
                <img id="floorBannerImg" width="210px" src="${base}/res/images/noslide.png"/>
                <input type="button" value="编辑" onclick="show_dialog('upload_floorBanner','楼层导航图片');"/>
            </td>
            <td class="vatop tips">请上传210×40像素GIF\JPG\PNG格式图片</td>
        </tr>
        
        <tr>
            <td colspan="2" class="required"><label for="sort">楼层主题名称：</label></td>
        </tr>
        <tr class="noborder">
            <td class="vatop rowform"><input type="text"  class="txt" name="floorName" id="floorName"></td>
            <td class="vatop tips"></td>
        </tr>
        
        <tr>
            <td colspan="2" class="required"><label for="sort">楼层副名称：</label></td>
        </tr>
        <tr class="noborder">
            <td class="vatop rowform"><input type="text"  class="txt" name="subName" id="subName"></td>
            <td class="vatop tips"></td>
        </tr>
        
        <tr>
            <td colspan="2" class="required"><label for="sort">楼层商品列表：</label></td>
        </tr>
        <tr class="noborder">
            <td class="vatop rowform">
                <input type="button" value="编辑" onclick="show_dialog('recommend_list','楼层商品列表')"/>
                <div id="floorGoodsData"></div>
            </td>
            <td class="vatop tips"></td>
        </tr>
        <tr>
            <td colspan="2" class="required">楼层颜色: </td>
        </tr>
        <tr class="noborder">
             	<td>
	             	<select name="floorColor">
	             		<!-- <option value="">请选择</option> -->
	             		<option value="gray">浅色</option>
	             		<option value="pink">粉色</option>
	             		<option value="blue">蓝色</option>
	             		<option value="orange">橙色</option>
	             		<option value="red">红色</option>
	             		<option value="brown">棕色</option>
	             		<option value="green">绿色</option>
	             		<option value="purple">紫色</option>
	             	</select>
             	</td>
             	<td class="vatop tips"> </td>
         </tr>
         <tr>
            <td colspan="2" class="required">是否显示: </td>
        </tr>
        <tr class="noborder">
            <td class="vatop rowform onoff"><label for="isShow1" class="cb-enable selected"><span>是</span></label>
                <label for="isShow0" class="cb-disable"><span>否</span></label>
                <input id="isShow1" name="isShow"  value="1" type="radio" checked="true">
                <input id="isShow0" name="isShow" value="0" type="radio"></td>
            </td>
            <td class="vatop tips"></td>
        </tr>
        <tr>
            <td colspan="2" class="required">排序: </td>
        </tr>
        <tr class="noborder">
            <td class="vatop rowform"><input type="text" name="sort" class="txt" value="0">
            </td>
            <td class="vatop tips">数字范围为1~255，数字越小越靠前</td>
        </tr>
        </tbody>
        <tfoot>
        <tr class="tfoot">
            <td colspan="15"><a href="JavaScript:void(0);" class="btn" id="submitBtn" onclick="document.floorForm.submit()"><span>提交</span></a></td>
        </tr>
        </tfoot>
    </table>
</form>
<#-- 分类==============开始 -->
<div id="category_list_dialog" style="display:none;">
    <div class="dialog-handle">
        <h4 class="dialog-handle-title">楼层主题分类></h4>
        <p><span class="handle">
      <select name="gc_parent_id" id="gc_parent_id" class=" w200" onchange="get_goods_class();">
          <option value="0">-请选择-</option>
          <#list classList as gc>
              <option value="${gc.gcId}">&nbsp;&nbsp;${gc.gcName}</option>
              <#list gc.classList as c>
                  <option value="${c.gcId}">&nbsp;&nbsp;&nbsp;&nbsp;${c.gcName}</option>
              </#list>
          </#list>
      </select>
      </span> <span class="note">从分类下拉菜单中选择该板块要推荐的分类，选择父级分类将包含字分类。</span></p>
    </div>
    <div class="s-tips"><i></i>小提示：双击分类名称可删除不想显示的分类</div>
    <div class="category-list category-list-edit">
        <dl>
        </dl>
    </div>
    <a href="JavaScript:void(0);" onclick="update_category();" class="btn ml30"><span>确定</span></a>
    <script type="text/javascript">
        //分类相关
        function get_goods_class() {//查询子分类
            var gc_id = $("#gc_parent_id").val();
            $("#gcId").val(gc_id);
            if (gc_id>0) {
                $.get(APP_BASE+'/goods/class/child?id='+gc_id+'&level=0', function(data) {
                    $.each(data, function(i, item) {
                        var temp='<dd gc_id="'+item.gcId+'" title="'+item.gcName+'" ondblclick="del_goods_class('+item.gcId+');">'+
                                '<i onclick="del_goods_class('+item.gcId+');"></i>'+item.gcName+
                                '</dd>';
                        var ddlist = $(".category-list dl").find("dd");
                        if(typeof($(ddlist).html())!="undefined"){
                    	    var flag = 0;
                        	$(ddlist).each(function(){
                            	if($(this).attr("gc_id")==item.gcId){
                            		flag=1;
                            	}
                            });	
                        	if(flag==0){
                        		$(".category-list dl").append(temp);
                        	}
                         }else{
                        	$(".category-list dl").append(temp);
                       	 }
                    });
                });
            }
        }
        function del_goods_class(gc_id) {//删除已选分类
            var obj = $("dd[gc_id='"+gc_id+"']");
            obj.remove();
        }
        function update_category(){
            $("#floorClassData").empty();
            $(".category-list dl").find("dd").each(function(i){
                $("#floorClassData").append("<input type='hidden' name='goodsClassList["+i+"].gcId' value='"+$(this).attr("gc_id")+"'/>");
                $("#floorClassData").append("<input type='text' readonly='true' name='goodsClassList["+i+"].gcName' value='"+$(this).attr("title")+"' style='border-left:0px;border-top:0px;border-right:0px;border-bottom:1px '/>");
            });
            DialogManager.close("category_list");
            initGoodsClass();
        }
        
        //选择分类后 初始化这个分类的图片 ，访问路径等
        function initGoodsClass(){
        	var gc_id = $("#gcId").val();
	        if (gc_id>0) {
	            $.get(APP_BASE+'/goods/class/getGoodsClass?gcId='+gc_id, function(data) {
	            	/* alert(data.gcpic); */
		            if(data){
		            	$("#floorClass").html(data.gcName);//显示标题名称
		            	$("#floorThemeImg").attr("src", '${imgServer}'+data.gcpic);//显示分类图片
		            	$("#floorImg").val(data.gcpic);//设置分类图片
	           			$("#floorName").val(data.gcName);//设置分类名称
	           			$("#subName").val(data.gcName);//设置副标题名称
		            }
	             });
            }
        }
    </script>
</div>
<#--分类 结束-->

<#--楼层主题图片 开始-->
<div id="upload_floorTheme_dialog" style="display:none;">
    <table class="table tb-type2">
        <tbody>
        <tr>
            <td><ul>
                <li>请按照操作注释要求，上传设置楼层主题图片。</li>
            </ul></td>
        </tr>
        </tbody>
    </table>
    <table id="upload_tit_type_pic" class="table tb-type2">
        <tbody>
        <tr>
            <td colspan="2" class="required">楼层主题上传：</td>
        </tr>
        <tr class="noborder">
            <td class="vatop rowform"><span class="type-file-box">
            <input type='text' name='textfield' id='textfield2' class='type-file-text' />
            <input type='button' name='button' id='button1' value='' class='type-file-button' />
            <input name="pic" id="pic1" type="file" class="type-file-file" size="30">
            </span></td>
            <td class="vatop tips">建议上传212×241像素GIF\JPG\PNG格式图片。</td>
        </tr>
        </tbody>
    </table>
    <table id="upload_tit_type_txt" class="table tb-type2">
        <tbody>
        <tr>
            <td colspan="2" class="required">楼层主题链接</td>
        </tr>
        <tr class="noborder">
            <td class="vatop rowform">
                <input class="txt" type="text" id="themeUrl">
            </td>
            <td class="vatop tips"></td>
        </tr>
        </tbody>
    </table>
    <a href="JavaScript:void(0);" onclick="themeImgCommit()" class="btn"><span>确定</span></a>
    <script type="text/javascript">
        $("#pic1").change(function(){
            $("#textfield2").val($(this).val());
        });
        function themeImgCommit(){
            $.ajaxFileUpload({
                //处理文件上传操作的服务器端地址(可以传参数,已亲测可用)
                url:'${base}/website/index/upload',
                secureuri:false,                       //是否启用安全提交,默认为false
                fileElementId:'pic1',           //文件选择框的id属性
                dataType:'json',                       //服务器返回的格式,可以是json或xml等
                success:function(data, status){        //服务器响应成功时的处理函数
                    if(data.success){     //0表示上传成功(后跟上传后的文件路径),1表示失败(后跟失败描述)
                    	//设置显示图片
                        $("#floorThemeImg").attr("src", '${imgServer}'+data.result);
                    		//隐藏值
                       // var input = '<input type="hidden" name="floorImg" value="'+data.result+'"/>' +
                       //        '<input type="hidden" name="floorUrl" value="'+$("#themeUrl").val()+'"/>';
                       // $("#floorThemeImg").parent("td").append(input);
                        
		            	$("#floorImg").val(data.result);//设置分类图片
		            	$("#floorUrl").val($("#themeUrl").val());
		            	//设置跳转路径
		            	//var input = '<input type="hidden" name="floorUrl" value="'+$("#themeUrl").val()+'"/>';
                        
                        DialogManager.close("upload_floorTheme");
                    }
                },
                error:function(data, status, e){ //服务器响应失败时的处理函数
                    alert('图片上传失败，请重试！！');
                }
            });
        }
    </script>
</div>
<#--楼层主题图片 结束-->

<#--导航图片 开始-->
<div id="upload_floorBanner_dialog" style="display:none;">
    <table class="table tb-type2">
        <tbody>
        <tr>
            <td><ul>
                <li>请按照操作注释要求，上传设置楼层导航图片。</li>
            </ul></td>
        </tr>
        </tbody>
    </table>
    <table id="upload_tit_type_pic" class="table tb-type2">
        <tbody>
        <tr>
            <td colspan="2" class="required">导航图片上传：</td>
        </tr>
        <tr class="noborder">
            <td class="vatop rowform"><span class="type-file-box">
            <input type='text' name='textfield' id='textfield1' class='type-file-text' />
            <input type='button' name='button' id='button1' value='' class='type-file-button' />
            <input name="pic" id="pic" type="file" class="type-file-file" size="30">
            </span></td>
            <td class="vatop tips">建议上传210×40像素GIF\JPG\PNG格式图片。</td>
        </tr>
        </tbody>
    </table>
    <table id="upload_tit_type_txt" class="table tb-type2">
        <tbody>
        <tr>
            <td colspan="2" class="required">导航图片链接</td>
        </tr>
        <tr class="noborder">
            <td class="vatop rowform">
                <input class="txt" type="text" id="bannerUrl">
            </td>
            <td class="vatop tips"></td>
        </tr>
        </tbody>
    </table>
    <a href="JavaScript:void(0);" onclick="bannerImgCommit()" class="btn"><span>确定</span></a>
    <script type="text/javascript">
        $("#pic").change(function(){
            $("#textfield1").val($(this).val());
        });
        function bannerImgCommit(){
            $.ajaxFileUpload({
                //处理文件上传操作的服务器端地址(可以传参数,已亲测可用)
                url:'${base}/website/index/upload',
                secureuri:false,                       //是否启用安全提交,默认为false
                fileElementId:'pic',           //文件选择框的id属性
                dataType:'json',                       //服务器返回的格式,可以是json或xml等
                success:function(data, status){        //服务器响应成功时的处理函数
                    if(data.success){     //0表示上传成功(后跟上传后的文件路径),1表示失败(后跟失败描述)
                        $("#floorBannerImg").attr("src", '${imgServer}'+data.result);
                    
                        //var input = '<input type="hidden" name="bannerImg" value="'+data.result+'"/>' +
                        //        '<input type="hidden" name="bannerUrl" value="'+$("#bannerUrl").val()+'"/>';
                        //$("#floorBannerImg").parent("td").append(input);
                        
                        $("#bannerImg").val(data.result);//设置分类图片
		            	$("#bannerUrl").val($("#bannerUrl").val());
                        
                        DialogManager.close("upload_floorBanner");
                    }
                },
                error:function(data, status, e){ //服务器响应失败时的处理函数
                    alert('图片上传失败，请重试！！');
                }
            });
        }
    </script>
</div>
<#--导航图片 结束-->

<#--商品列表 开始-->
<div id="recommend_list_dialog" style="display:none;">
    <div id="recommend_input_list" style="display:none;"><!-- 推荐拖动排序 --></div>
    <dl>
        <dd>
            <h4 class="dialog-handle-title">请选择要展示的推荐商品</h4>
            <div class="s-tips"><i></i>小提示：单击查询出的商品选中，双击已选择的可以删除，最多9个，保存后生效。</div>
            <ul class="dialog-goodslist-s1 goods-list">
            </ul>
        </dd>
    </dl>
    <div id="add_recommend_list" style="display:none;"></div>
    <div class="dialog-show-box">
        <form name="queryListForm" id="queryListForm" method="post">
            <input type="hidden" id="div" name="div" value = "#show_recommend_goods_list"/>
       		
        <table class="tb-type1 noborder search">
            <tbody>
            <tr>
                <th><label>选择分类</label></th>
                <td class="dialog-select-bar" id="recommend_gcategory">
                    <select>
                        <option value="0">-请选择-</option>
                        <#list classList as gc>
                            <option value="${gc.gcId}">&nbsp;&nbsp;${gc.gcName}</option>
                        </#list>
                    </select>
                </td>
            </tr>
            <tr>
                <th><label for="recommend_goods_name">商品名称</label></th>
                <td><input type="text" value="" name="recommend_goods_name" id="recommend_goods_name" class="txt">
                    <a href="JavaScript:void(0);" onclick="get_recommend_goods();" class="btn-search " title="查询"></a>
                </td>
            </tr>
            </tbody>
        </table>
        <div id="show_recommend_goods_list" class="show-recommend-goods-list"></div>
         </form>
        <div class="clear"></div>
    </div>
    <div class="clear"></div>
    <a href="JavaScript:void(0);" onclick="update_recommend();" class="btn"><span>确定</span></a>
    <script type="text/javascript">
        gcategoryInit("recommend_gcategory");
        $("#recommend_list_form dl dd ul").sortable({ items: 'li' });
        function get_recommend_goods() {//查询商品
            var gc_id = 0;
            $('#recommend_gcategory > select').each(function() {
                if ($(this).val()>0) gc_id = $(this).val();
            });
            var goods_name = $.trim($('#recommend_goods_name').val());
            if (gc_id>0 || goods_name!='') {
                var div = '#show_recommend_goods_list';
                /* $("#gcId").val(gc_id);
                $("#goodsName").val(goods_name) */
                $.ajax({
                    url:"${base}/goods/goods/list",//默认加载list 页面
                    data:{div:div,gcId:gc_id,goodsName:goods_name,goodsShow:"1",goodsState:"30"},
                    error:function(){frameControl.lhDgFalInfo("通讯失败!");},
                    dataType:'html',
                    type: "POST",
                    contentType:"application/x-www-form-urlencoded; charset=utf-8",
                    success: function(data){
                        $(div).empty();
                        $(div).html(data);
                        $(div).hide();
                        $(div).fadeIn(300);
                    }
                });
            }
        }
        function select_recommend_goods(goods_id) {//商品选择
            var id = 'recommend_show';
            var goods_max = 9;//商品数
            var obj = $("dl");
            if(obj.find("img[select_goods_id='"+goods_id+"']").size()>0) return;//避免重复
            if(obj.find("img[select_goods_id]").size()>=goods_max) return;
            var goods = $("#show_recommend_goods_list img[goods_id='"+goods_id+"']");
            var text_append = '';
            var goods_pic = goods.attr("src");
            var goods_name = goods.attr("title");
            var goods_price = goods.attr("goods_price");
            var market_price = goods.attr("market_price");
            text_append += '<div ondblclick="del_recommend_goods('+goods_id+');" class="goods-pic">';
            text_append += '<span class="ac-ico" onclick="del_recommend_goods('+goods_id+');"></span>';
            text_append += '<span class="thumb size-72x72">';
            text_append += '<i></i>';
            text_append += '<img select_goods_id="'+goods_id+'" title="'+goods_name+'" src="'+goods_pic+'" onload="javascript:DrawImage(this,72,72);" />';
            text_append += '</span></div>';
            text_append += '<div class="goods-name">';
            text_append += '<a href="${frontServer}/product/detail?id='+goods_id+'" target="_blank">';
            text_append += goods_name+'</a>';
            text_append += '</div>';
            text_append += '<input id="goodsId" value="'+goods_id+'" type="hidden">';
            text_append += '<input id="goodsMarketprice" value="'+market_price+'" type="hidden">';
            text_append += '<input id="goodsName1" value="'+goods_name+'" type="hidden">';
            text_append += '<input id="goodsPrice" value="'+goods_price+'" type="hidden">';
            text_append += '<input id="goodPic" value="'+goods_pic.replace('${imgServer}',"")+'" type="hidden">';
            obj.find("ul").append('<li id="select_recommend_'+id+'_goods_'+goods_id+'">'+text_append+'</li>');
        }
        function del_recommend_goods(goods_id) {//删除已选商品
            var id = 'recommend_show';
            var obj = $("dl");
            obj.find("img[select_goods_id='"+goods_id+"']").parent().parent().parent().remove();
        }
        function update_recommend(){
        	$("#floorGoodsData").empty();
            $("dl>dd>ul>li").each(function(i){
                $("#floorGoodsData").append("<input type='hidden' name='goodsList["+i+"].goodsId' value='"+$(this).find("#goodsId").val()+"'/>");
                $("#floorGoodsData").append("<input type='hidden' name='goodsList["+i+"].goodsName' value='"+$(this).find("#goodsName1").val()+"'/>");
                $("#floorGoodsData").append("<input type='hidden' name='goodsList["+i+"].goodsMarketprice' value='"+$(this).find("#goodsMarketprice").val()+"'/>");
                $("#floorGoodsData").append("<input type='hidden' name='goodsList["+i+"].goodsPrice' value='"+$(this).find("#goodsPrice").val()+"'/>");
                $("#floorGoodsData").append("<input type='hidden' name='goodsList["+i+"].goodsImage' value='"+$(this).find("#goodPic").val()+"'/>");
            });
            DialogManager.close("recommend_list");
        }
    </script>
</div>
<#--商品列表 结束-->

</div>
</@layout.body>

