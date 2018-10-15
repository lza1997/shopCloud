<script type="text/javascript">
	
</script>

        <div class="pop-con">
            <div class="pop-form-mod">
                <p class="item">
                	<label class="tit">所属上级：</label>
                    <select name="stcParentId" class="select mr" id="stcParentId">
                    	<option value="0">选择分类</option>
                    	<#list datas as str>
							<#if selectId==str.stcId>
								<option value="${str.stcId}"  selected="selected">${str.stcName}</option>
							<#else>
								<option value="${str.stcId}" >${str.stcName}</option>
							</#if>								
                      	</#list>
                    </select>
                    <span class="note">选择分类代表一级分类</span>
                </p>
                <p class="item"><label class="tit">分类名称：</label>
                    <input type="text" class="text" name="stcName" id="stcName" value=""/><br/>
                     <span class="errorMsg" id="vat_stcName" style="color: red;font-size: 5;"></span>
                </p>
                <p class="item"><label class="tit">排序：</label>
                	<input type="text" class="text-s" name="stcSort" id="stcSort" value="" style="margin-left: 32px;"
                		onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"
                		placeholder="只能输入数字">
                	<span class="errorMsg" id="vat_stcSort" style="color: red;font-size: 5;"></span>
                </p>
                <p class="item"><label class="tit">商品状态：</label>
                		<input type="radio" name="stcState" id="stcState" value="true"  checked="checked">显示</input>
                		<input type="radio" name="stcState" id="stcState" value="false">不显示</input>
                </p>
            </div><!-- form-mod] -->
            
            
    	</div>

