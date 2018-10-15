<script type="text/javascript">
	
	
	/* $('#pagesubmit').on('click', function(){
		var stcId=$("#stcId").val();
		var stcParentId = $("#stcParentId").val();
		var stcName = $("#stcName").val();
        if(stcName == ''){
            showLabel('分类名称不能为空',$("#stcName"));
            return false;
        }
		var stcSort = $("#stcSort").val();
		var stcState=$("input[name='stcState']:checked").val();
		var fmUrl = '${base}/storeGoodsClass/saveOrUpdate';
		$.ajax({
             type: "post",
             url: fmUrl,
             data: {stcParentId:stcParentId,stcName:stcName,stcSort:stcSort,stcState:stcState,stcId:stcId},
             dataType: "json",
			 async:false,
			 success:function(data) {
				if(data.success == "true"){
                    layer.msg(data.result, 3,9)
                    layer.close(layer.index);
                    window.parent.location.reload();
				}else{
                    layer.msg(data.result, 3,8)
				}
			}
         });
	});
    function showLabel(msg,obj){

        var label = $(obj).parent().find("label:last");
        label.html("<span>*</span><span>"+msg+"</span>");
        label.show();
        $(obj).focus();
    }
    $('#pagebtn').on('click', function(){
    	layer.close(layer.index);
        window.parent.location.reload();
    }); */
</script>

        <div class="pop-con">
            <div class="pop-form-mod">
            	<input type="hidden" name="stcId" id="stcId" value="${stcId}"/>
                <p class="item"><label class="tit">分类名称：</label>
                    <input type="text" class="text" name="stcName" id="stcName" value="${storeGoodsClass.stcName}"/><br/>
                    <span class="errorMsg" id="vat_stcName" style="color: red;font-size: 5;"></span>
                </p>
                <p class="item"><label class="tit">排序：</label>
                	<input type="text" class="text-s" name="stcSort" id="stcSort" value="${storeGoodsClass.stcSort!'0'}" style="margin-left: 32px;"
                		onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"
                		placeholder="只能输入数字">
                	<span class="errorMsg" id="vat_stcSort" style="color: red;font-size: 5;"></span>
                </p>
                <p class="item"><label class="tit">商品状态：</label>
                	<#if storeGoodsClass.stcState==true>
                		<input type="radio" name="stcState" id="stcState" value="true"  checked="checked">显示</input>
                		<input type="radio" name="stcState" id="stcState" value="false">不显示</input>
                	<#else>
                		<input type="radio" name="stcState" id="stcState" value="true" >显示</input>
                		<input type="radio" name="stcState" id="stcState" value="false" checked="checked">不显示</input>
                	</#if>
                </p>
               <!--  <p class="btnbox">
	                <button class="btnb" id="pagesubmit">提 交</button>
	                <button class="btng"  id="pagebtn">取 消</button>
            	</p> -->
            </div><!-- form-mod] -->
            
            
    	</div>

