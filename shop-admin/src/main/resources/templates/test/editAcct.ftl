<@p.header title="会员管理">
</@p.header>
<body>
<div class="iframebox">
    <h3 class="cont-tit">新增/修改会员</h3>

    <form id="acct-form" method="post" action="${base}/test/saveOrUpdate">
        <div class="form-mod">
            <input type="hidden" name="id" value="${account.id}"/>
            <input type="hidden" id = "div" value="${div}"/>
            <p class="item"><label class="tit"><i class="must">*</i>会员名：</label>
                <input type="text" class="text" name="loginName" value="${account.loginName}"/>
            </p>
            <#if account.id != null>
                <p class="item"><label class="tit">原密码：</label>
                    <input type="text" class="password" name="oldpassword" value=""/>
                </p>
                <p class="item"><label class="tit">新密码：</label>
                    <input type="text" class="password" name="password" value=""/>
                </p>
                <p class="item"><label class="tit">确认密码：</label>
                    <input type="text" class="password" value=""/>
                </p>
            <#else>
                <p class="item"><label class="tit"><i class="must">*</i>密码：</label>
                    <input type="text" class="password" name="password" value=""/>
                </p>
                <p class="item"><label class="tit"><i class="must">*</i>确认密码：</label>
                    <input type="text" class="password" value=""/>
                </p>
            </#if>
            <p class="item"><label class="tit">性别：</label>
                <label class="mr">
                    <input class="radio" type="radio" name="gender" checked="checked" value="0"/>男
                </label>
                <label>
                        <input class="radio" type="radio" name="gender" value="1"/>女
                </label>
            </p>

            <p class="item"><label class="tit">昵称：</label>
                <input type="text" class="text" name="realName" value="${account.realName}"/>
            </p>

            <p class="item"><label class="tit">手机号：</label>
                <input type="text" class="text" name="cellPhone" value="${account.cellPhone}"/>
            </p>

            <p class="item"><label class="tit">QQ：</label>
                <input type="text" class="text" name="qq" value="${account.qq}"/>
            </p>

            <p class="item"><label class="tit"><i class="must">*</i>邮箱：</label>
                <input type="text" class="text" name="email" value="${account.email}"/>
            </p>

            <p class="item-btn">
                <button type="button" class="btna" onclick="javascript:saveUpdate();">保存</button>
                <input type="button" class="btna"
                        onclick="closeWin();" value="取消">
            </p>
        </div>
    </form>
</div>
</body>
</html>

<script type="text/javascript">
	/**修改数据*/
	function saveUpdate(){
		/*首先验证表单是否合法*/
		var opFm = $("#acct-form")[0];
		var fmUrl = opFm.action;
		$.ajax({
             type: "post",
             url: fmUrl,
             data: $(opFm).serialize(),
             dataType: "json",
			 async:false,
			 success:function(data) {
				if(data.success == "true"){
					alert("操作成功");	
					frameElement.api.opener.initDataList();
					frameElement.api.close();
				}else{
					alert(data.msg);
				}
			}
         });
	}
	
	
	function closeWin(){
		frameElement.api.close();
	}
</script>