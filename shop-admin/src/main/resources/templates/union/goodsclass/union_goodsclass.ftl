<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/admincp.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/ajaxfileupload/ajaxfileupload.js"></script>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>商品分类</h3>
            <ul class="tab-base">
                <li><a href="${base}/unionGoodsClass/list"><span>列表</span></a></li>
            <#if goodsClass.id?exists && goodsClass.id!=0>
            	<li><a href="${base}/unionGoodsClass/forward"><span>新增</span></a></li>
                <li><a href="javascript:void(0);" class="current"><span>修改</span></a></li>
            <#else>
                <li><a href="javascript:void(0);" class="current"><span>新增</span></a></li>
            </#if>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form id="goodsClass_form" method="post" action="${base}/unionGoodsClass/saveOrUpdate">
    	<#if goodsClass.id?exists && goodsClass.id!=''>
    		<input type="hidden" name="id" value="${goodsClass.id!''}" />
    	</#if>
        <table class="table tb-type2">
            <tbody>
	            <tr class="noborder">
	                <td class="required" colspan="2"><label class="validation" for="name">名称：</label></td>
	            </tr>
	            <tr class="noborder">
	                <td class="vatop rowform" style="width:330px;"><input type="text" class="txt" name="name" id="name"  value="${goodsClass.name!''}"/></td>
	                <td class="vatop tips">请填写商品分类名称。</td>
	            </tr>
	            <tr>
		            <td colspan="2" class="required"><label for="parent_id">上级分类:</label></td>
		        </tr>
	            <tr class="noborder">
		            <td class="vatop rowform">
		                <select name="pid" id="pid">
		                    <option value="0">请选择...</option>
		                    <#list goodsClasss as class>
		                    	<#if goodsClass.id!=class.id>
								<option <#if goodsClass.pid==class.id>selected="selected"</#if> value="${class.id}">&nbsp;&nbsp;${class.name}</option>
								<#list class.classList as c>
								<#if goodsClass.id!=c.id>
	                                	<option <#if goodsClass.pid==c.id>selected="selected"</#if> value="${c.id}">&nbsp;&nbsp;&nbsp;&nbsp;${c.name}</option>
	                            </#if>
		                        </#list>
		                        </#if>
							</#list>
		                </select>
		            </td>
		            <td class="vatop tips">如果选择上级分类，那么新增的分类则为被选择上级分类的子分类</td>
		        </tr>
	            
             	<tr>
	                <td colspan="2" class="required">图标:
	                </td>
	            </tr>
	            <tr class="noborder">
	                <td class="vatop rowform">
	                	<input type='hidden' name='icon' id="icon" value="${goodsClass.icon!''}" class='type-file-text' />
		               	<input name="myfiles" id="myfiles" type="file" multiple="multiple" onChange="ajaxFileUploads('myfiles','icon');" />
		               	<a class="btn icon_clear" style="padding:0px 10px;<#if !goodsClass.icon?exists || goodsClass.icon==''>display:none;</#if>" href="JavaScript:reMove('icon');"><span>清除图片</span></a>
	               	<#if (goodsClass.icon != '')>
	               		<img class="icon" style="max-width:600px;" src="${imgServer}${goodsClass.icon!''}">
	               	<#else>
	               		<img class="icon" name="resUrl" style="max-width:600px;" src="${base}/res/images/nopic.png">
	               	</#if>
		            </td>
	                <td class="vatop tips">商品分类图标尺寸要求宽度为44像素，高度为44像素、比例为1:1的图片；支持格式gif,jpg,png</td>
	            </tr>
	            
	            <tr>
	                <td class="required" colspan="2"><label class="validation" for="status">状态：</label></td>
	            </tr>
	            <tr class="noborder">
	                <td class="vatop rowform onoff">
		                <label for="showFlag1" class="cb-enable <#if !goodsClass.showFlag?exists ||goodsClass.showFlag == 1>selected</#if>" title="显示"><span>显示</span></label>
	                    <label for="showFlag0" class="cb-disable <#if goodsClass.showFlag == 0>selected</#if>" title="不显示"><span>不显示</span></label>
	                    <input id="showFlag1" name="showFlag" <#if !goodsClass.showFlag?exists ||goodsClass.showFlag == 1>checked="checked"</#if>  value="1" type="radio">
	                    <input id="showFlag0" name="showFlag" <#if goodsClass.showFlag == 0>checked="checked" </#if> value="0" type="radio">
	                </td>
	                <td class="vatop tips">控制前台是否显示。</td>
	            </tr>
	            
	            <tr>
	                <td class="required" colspan="2"><label class="validation" for="sort">排序：</label></td>
	            </tr>
	            <tr class="noborder sort">
	                <td class="vatop rowform"><input type="text" name="sort" id="sort" value="${goodsClass.sort!'1'}"/></td>
	                <td class="vatop tips">请填写自然数。列表将会根据排序进行由大到小排列显示。</td>
	            </tr>
            
            </tbody>
            <tfoot>
	            <tr class="tfoot">
	                <td colspan="15"><a id="submitBtn" class="btn" href="JavaScript:void(0);"> <span>提交</span> </a></td>
	            </tr>
            </tfoot>
        </table>
    </form>
</div>
<script type="text/javascript">
    $(function(){
        //表单验证
        $("#goodsClass_form").validate({
            errorPlacement: function(error, element){
                error.appendTo(element.parent().parent().prev().find('td:first'));
            },
            success: function(label){
                label.addClass('valid');
            },
            rules : {
                name : {
                    required : true,
                },
                sort : {
                    number   : true
                }
            },
            messages : {
                name : {
                    required : '分类名称不能为空',
                },
                sort  : {
                    number   : '排序仅可以为数字'
                }
            }
        });

        //按钮先执行验证再提交表单
        $("#submitBtn").click(function(){
            if($("#goodsClass_form").valid()){
                $("#goodsClass_form").submit();
            }
        });
        
    });
    
    //上传图片
    function ajaxFileUploads(myfiles,icon){
	   $.ajaxFileUpload({
	        //处理文件上传操作的服务器端地址
	        url:"${base}/unionGoodsClass/uploadImage",
	        secureuri:false,                       //是否启用安全提交,默认为false
	        fileElementId:myfiles,           //文件选择框的id属性
	        dataType:'json',                       //服务器返回的格式,可以是json或xml等
	        success:function(data, status){//服务器响应成功时的处理函数
	            if(data.success == true ){     //true表示上传成功(后跟上传后的文件路径),false表示失败(后跟失败描述)
	            	$("img[class='"+icon+"']").attr("src", "${imgServer}/"+data.result);
	            	$("#"+icon).val(data.result);
	            	$("."+(icon+"_clear")).show();
	            }else{
	            	alert(data.result);
	            }
	        },
	        error:function(data, status, e){//服务器响应失败时的处理函数
	             alert('图片上传失败，请重试！！');
	        }
	    });
	}
	
	//删除
	function reMove(icon){
		$("img[class='"+icon+"']").attr("src", "${base}/res/images/nopic.png");
    	$("#"+icon).val("");
    	$("."+icon+"_clear").hide();
	}

</script>
</@layout.body>