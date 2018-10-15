<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/ajaxfileupload/ajaxfileupload.js"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>分类管理</h3>
            <ul class="tab-base">
                <li><a href="${base}/goods/class/list"><span>管理</span></a></li>
                <li><a href="${base}/goods/class/forward?gcId=0"><span>新增</span></a></li>
                <li><a href="javascript:void(0)" class="current"><span>编辑</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <table class="table tb-type2" id="prompt">
        <tbody>
        <tr class="space odd">
            <th class="nobg" colspan="12"><div class="title"><h5>操作提示</h5><span class="arrow"></span></div></th>
        </tr>
        <tr>
            <td>
                <ul>
                    <li>"类型"关系到商品发布时商品规格的添加，没有类型的商品分类的将不能添加规格。</li>
                    <li>默认勾选"关联到子分类"将商品类型附加到子分类，如子分类不同于上级分类的类型，可以取消勾选并单独对子分类的特定类型进行编辑选择。</li>
                    <li>在编辑"类型"和勾选"关联到子分类"时，涉及分类下的商品将会被进行"违规下架"处理，商品在重新编辑后才能正常使用，<span color="color:#F30">请慎重操作</span></li>
                </ul></td>
        </tr>
        </tbody>
    </table>
    <form id="goods_class_form" name="goodsClassForm" action="${base}/goods/class/edit"  method="post">
        <input type="hidden" name="form_submit" value="ok" />
        <input type="hidden" name="gcId" value="${gc.gcId}" />
        <input type="hidden" name="gcParentId" id="gc_parent_id" value="${gc.gcParentId}" />
        <input type="hidden" name="old_type_id" value="${gc.typeId}">
        <table class="table tb-type2">
            <tbody>
            <tr class="noborder">
                <td colspan="2" class="required"><label class="gc_name validation" for="gcName">分类名称:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" maxlength="20" value="${gc.gcName}" name="gcName" id="gcName" class="txt"></td>
                <td class="vatop tips"></td>
            </tr>
            <tr>
                <td colspan="2" class="required">
	                <label class="gc_expenScale validation" for="expenScale">
	               		 佣金比例:
	               		<input type="checkbox" name="isRelate" value="1" <#if gc.isRelate==1>checked="checked"</#if>>关联到子分类
	                </label>
                </td>
            </tr>
            <tr>
                <td class="vatop rowform"><input type="text" maxlength="10" value="${gc.expenScale}" name="expenScale" id="expenScale" class="txt" style="width: 40px;">&#37;</td>
                <td class="vatop tips"></td>
            </tr>
            <tr>
		            <td colspan="2" class="required" id="gcategory">
		                <label for="gc_name">类型:</label>
		                <input id="typename" name="typename"  type="hidden" value="${gc.typename}">
		                <select class="class-select" name="typeId" id="typeId">
		                    <option value="0">请选择...</option>
		                    <#list typeList as goodstype>
		                        <option value="${goodstype.typeId}" <#if gc.typeId ??&& gc.typeId==goodstype.typeId>selected="selected"</#if>>&nbsp;&nbsp;${goodstype.typeName}</option>
		                    </#list>
		                </select>
		            </td>
            </tr>
            
            <tr>
                <td colspan="2" class="required">显示: </td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform onoff"><label for="brand_recommend1" class="cb-enable <#if gc.gcshow ??&& gc.gcshow==1>selected </#if>"><span>是</span></label>
                    <label for="brand_recommend0" class="cb-disable <#if gc.gcshow ??&& gc.gcshow==0>selected </#if>"><span>否</span></label>
                    <input id="brand_recommend1" name="gcshow"  value="1" type="radio" <#if gc.gcshow ??&& gc.gcshow==1>checked="checked" </#if>>
                    <input id="brand_recommend0" name="gcshow" value="0" type="radio" <#if gc.gcshow ??&& gc.gcshow==0>checked="checked" </#if>></td>
                    
                </td>
                <td class="vatop tips"></td>
            </tr>
            <tr>
                <td colspan="2" class="required">分类图标:</td>
            </tr>
            <tr class="noborder">
                  <td>
                        <div class="logo clf" > 
                              <a href="javascript:void(0);" class="btn-upload btng-s" style="background-color:#eee; color:#000; cursor:pointer;">
                                 <input type="file" class="file" name="files" id="myBlogImage0" onChange="ajaxFileUploads('myBlogImage0','busLicense','busLicense0');" />
                              </a>
                              <#if gc.gcpic ??&& gc.gcpic!=''>
                                   <img  src="${imgServer}${gc.gcpic}" width="100px" height="100px" id="busLicense" class="img">
                              <#else>
                                   <img  src="${base}/images/nopic.png" width="100px" height="100px" id="busLicense" class="img">
                              </#if>
			            </div>
			            <input type="hidden" id="busLicense0" id="businessLicenceNumberElectronic" name="gcpic" value="" />
                 </td>
                <td class="vatop tips">支持格式gif,jpg,jpeg,png</td>
            </tr>
            <tr>
                <td colspan="2" class="required"><label for="gcSort">排序:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" value="${gc.gcSort}" name="gcSort" id="gc_sort" class="txt"></td>
                <td class="vatop tips">数字范围为0~255，数字越小越靠前</td>
            </tr>
            </tbody>
            <tfoot>
            <tr class="tfoot"><td colspan="15" ><a href="JavaScript:void(0);" class="btn" id="submitBtn"><span>提交</span></a></td>
            </tr>
            </tfoot>
        </table>
    </form>
</div>
<script type="text/javascript" src="${base}/res/js/common_select.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery.mousewheel.js"></script>
<script>
     //上传图片
	function ajaxFileUploads(myBlogImage,imgId,img){
	    $.ajaxFileUpload({
	        //处理文件上传操作的服务器端地址(可以传参数,已亲测可用)
	        url:'${base}/upload/fileUpload',
	        secureuri:false,                       //是否启用安全提交,默认为false
	        fileElementId:myBlogImage,           //文件选择框的id属性
	        dataType:'json',                       //服务器返回的格式,可以是json或xml等
	        fileSize:5120000,
	        allowType:'jpg,jpeg,png,JPG,JPEG,PNG',
	        success:function(data, status){        //服务器响应成功时的处理函数
	            if( true == data.success){     //0表示上传成功(后跟上传后的文件路径),1表示失败(后跟失败描述)
	            	//alert(data.result);
	               $("img[id='"+imgId+"']").attr("src", "${imgServer}"+data.result);
	               $("#"+img).val(data.result);
	            }
	        },
	        error:function(data, status, e){ //服务器响应失败时的处理函数
	        	layer.msg('图片上传失败，请重试！！', 1, 8);
	            //$('#result').html('图片上传失败，请重试！！');
	        }
	    });
	}


    $(document).ready(function(){
        $('#type_div').perfectScrollbar();
        //按钮先执行验证再提交表单
        $("#submitBtn").click(function(){
            if($("#goods_class_form").valid()){
                $("#goods_class_form").submit();
            }
        });

        $("#pic").change(function(){
            $("#textfield1").val($(this).val());
        });
      /*   $('input[type="radio"][name="typeId"]').change(function(){
            // 标记类型时候修改 修改为ok
            var t_id = '${gc.typeId}';
            if(t_id != $(this).val()){
                $('#t_sign').val('ok');
            }else{
                $('#t_sign').val('');
            }

            if($(this).val() == '0'){
                $('#t_name').val('');
            }else{
                $('#t_name').val($(this).next('span').html());
            }
        }); */

        $('#goods_class_form').validate({
            errorPlacement: function(error, element){
                error.appendTo(element.parent().parent().prev().find('td:first'));
            },
            rules : {
                gcName : {
                    required : true,
                    remote   : {
                        url :APP_BASE+'/goods/class/validate',
                        type:'get',
                        data:{
                            gcName : function(){
                                return $('#gcName').val();
                            },
                            gcParentId : function() {
                                return $('#gc_parent_id').val();
                            },
                            gcId : '${gc.gcId}'
                        }
                    }
                },
                gcSort : {
                    number   : true,
                    max : 255,
                    min : 0
                },
                expenScale:{
                    required: true,
                    number   : true,
                    max : 100,
                    min : 0.01
                }
            },
            messages : {
                gcName : {
                    required : '分类名称不能为空',
                    remote   : '该分类名称已经存在了，请您换一个'
                },
                gcSort  : {
                    number   : '分类排序仅能为数字',
                    max : '最大值为255',
                    min : '最小值为0'
                },
                expenScale:{
                    required: '费用比例不能为空',
                    number   : '费用比例仅能为数字',
                    max : '最大值为100',
                    min : '最小值为0.1'
                }
            }
        });

        // 类型搜索
       /*  $("#gcategory > select").live('change',function(){
            type_scroll($(this));
        }); */
        
        
          $("#typeId").change( function() {
              var sel=$("#typeId").find("option:selected").text()
              $("#typename").val($.trim(sel)); 
          });
    });
  /*   var typeScroll = 0;
    function type_scroll(o){
        var id = o.val();
        if(!$('#type_dt_'+id).is('dt')){
            return false;
        }
        $('#type_div').scrollTop(-typeScroll);
        var sp_top = $('#type_dt_'+id).offset().top;
        var div_top = $('#type_div').offset().top;
        $('#type_div').scrollTop(sp_top-div_top);
        typeScroll = sp_top-div_top;
    } */
   /*  gcategoryInit('gcategory'); */
</script>
</@layout.body>