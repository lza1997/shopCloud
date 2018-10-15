<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/layer/layer.js" charset="utf-8"></script>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>设置</h3>
            <ul class="tab-base">
                <li><a href="JavaScript:void(0);" class="current"><span>积分设置</span></a></li>
                <li><a href="${base}/setting/site/siteSetting"><span>站点设置</span></a></li>
                <li><a href="${base}/setting/images/imagesSetting"><span>图片设置</span></a></li>
                <!--  <li><a href="${base}/dev/cache/setting"><span>缓存设置</span></a></li>-->
                <li><a href="${base}/setting/consult/setting"><span>咨询设置</span></a></li>
                <li><a href="${base}/setting/goodsApply/setting"><span>商品审核设置</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form action="${base}/setting/points/update" method="post" id="update_form">
	    <table class="table tb-type2">
	        <thead>
		        <tr class="thead">
		            <th class="w48"></th>
		            <th class="w96">类型</th>
		            <th class="w96">等级积分</th>
		            <th class="w96">消费积分</th>
		        </tr>
	        </thead>
	        <tbody id="treet1">
	            <tr class="hover edit">
	                <td>
	                </td>
	                <td class="sort">成功注册</td>
	                <td class="name"><input name="register_rank" class="editable" value="${map['register_rank']}"/></td>
	                <td class="name"><input name="register_cons" class="editable" value="${map['register_cons']}"/></td>
	            </tr>
	            <tr class="hover edit">
	                <td>
	                </td>
	                <td class="sort">完成邮箱验证</td>
	                <td class="name"><input name="email_rank" class="editable" value="${map['email_rank']}"/></td>
	                <td class="name"><input name="email_cons" class="editable" value="${map['email_cons']}"/></td>
	            </tr>
	            <tr class="hover edit">
	                <td>
	                </td>
	                <td class="sort">完善个人资料</td>
	                <td class="name"><input name="persdata_rank" class="editable" value="${map['persdata_rank']}"/></td>
	                <td class="name"><input name="persdata_cons" class="editable" value="${map['persdata_cons']}"/></td>
	            </tr>
	            <tr class="hover edit">
	                <td>
	                </td>
	                <td class="sort">登录</td>
	                <td class="name"><input name="login_rank" class="editable" value="${map['login_rank']}"/></td>
	                <td class="name"><input name="login_cons" class="editable" value="${map['login_cons']}"/></td>
	            </tr>
	            <tr class="hover edit">
	                <td>
	                </td>
	                <td class="sort">文字评论</td>
	                <td class="name"><input name="comment_rank" class="editable" value="${map['comment_rank']}"/></td>
	                <td class="name"><input name="comment_cons" class="editable" value="${map['comment_cons']}"/></td>
	            </tr>
	            <tr class="hover edit">
	                <td>
	                </td>
	                <td class="sort">上传图片评论</td>
	                <td class="name"><input name="uppiccom_rank" class="editable" value="${map['uppiccom_rank']}"/></td>
	                <td class="name"><input name="uppiccom_cons" class="editable" value="${map['uppiccom_cons']}"/></td>
	            </tr>
	            <tr class="hover edit">
	                <td>
	                </td>
	                <td class="sort">每个商品首次评论</td>
	                <td class="name"><input name="goodsfirstcom_rank" class="editable" value="${map['goodsfirstcom_rank']}"/></td>
	                <td class="name"><input name="goodsfirstcom_cons" class="editable" value="${map['goodsfirstcom_cons']}"/></td>
	            </tr>
	            <tr class="hover edit">
	                <td>
	                </td>
	                <td class="sort">购买商品(一元等于多少积分)</td>
	                <td class="name"><input name="buygoods_rank" class="editable" value="${map['buygoods_rank']}"/></td>
	                <td class="name"><input name="buygoods_cons" class="editable" value="${map['buygoods_cons']}"/></td>
	            </tr>
	            <tr class="hover edit">
	                <td>
	                </td>
	                <td class="sort">充值(一元等于多少积分)</td>
	                <td class="name"><input name="recharge_rank" class="editable" value="${map['recharge_rank']}"/></td>
	                <td class="name"><input name="recharge_cons" class="editable" value="${map['recharge_cons']}"/></td>
	            </tr>
	            <tr class="hover edit">
	                <td>
	                </td>
	                <td class="sort">选择网上支付</td>
	                <td class="name"><input name="onlinepay_rank" class="editable" value="${map['onlinepay_rank']}"/></td>
	                <td class="name"><input name="onlinepay_cons" class="editable" value="${map['onlinepay_cons']}"/></td>
	            </tr>
	            <tr class="hover edit">
	                <td>
	                </td>
	                <td class="sort">推荐好友</td>
	                <td class="name"><input name="recfriend_rank" class="editable" value="${map['recfriend_rank']}"/></td>
	                <td class="name"><input name="recfriend_cons" class="editable" value="${map['recfriend_cons']}"/></td>
	            </tr>
	            <tr class="hover edit">
	                <td>
	                </td>
	                <td class="sort">签到</td>
	                <td class="name"><input name="sign_rank" class="editable" value="${map['sign_rank']}"/></td>
	                <td class="name"><input name="sign_cons" class="editable" value="${map['sign_cons']}"/></td>
	            </tr>
	        </tbody>
	        <tfoot>
		        <tr>
		            <td colspan="16">
		                &nbsp;&nbsp;<a href="JavaScript:void(0);" class="btn" onclick="updateSett()"><span>修改</span></a></td>
		        </tr>
	        </tfoot>
	    </table>
    </form>
</div>
<script type="text/javascript">
var APP_BASE = '${base}';
$(function(){
	//给需要修改的位置添加修改行为
	$(".editable").change(function(){
		var value = $(this).val();
		var reg = /^[0-9]*[0-9][0-9]*$/;
		if(!reg.test(value)){
			$(this).val(0);
			layer.msg("请您输入不小于0的整数",{icon:2});
		}
	});
});

function updateSett(){
	$("#update_form").submit();
}
</script>
</@layout.body>