<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>会员管理</h3>
            <ul class="tab-base">
                <li><a href="${base}/member/list" ><span>管理</span></a></li>
                <li><a href="javascript:void(0);" class="current"><span>新增</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form id="user_form" enctype="multipart/form-data" method="post" action="${base}/member/saveOrUpdate">
        <input type="hidden" name="form_submit" value="ok" />
        <table class="table tb-type2">
            <tbody>
            <tr class="noborder">
                <td colspan="2" class="required"><label class="validation" for="memberName">会员:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text"  name="memberName" id="memberName" class="txt"></td>
                <td class="vatop tips"></td>
            </tr>
            <tr>
                <td colspan="2" class="required"><label class="validation" for="memberPasswd">密码:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="password" id="memberPasswd" name="memberPasswd"  class="txt"></td>
                <td class="vatop tips"></td>
            </tr>
            <tr>
                <td colspan="2" class="required"><label class="validation" for="password_confirm">确认密码:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="password" id="password_confirm" name="password_confirm"  class="txt"></td>
                <td class="vatop tips"></td>
            </tr>
            <tr>
                <td colspan="2" class="required"><label class="validation" for="memberEmail">电子邮箱:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" id="memberEmail" name="memberEmail" class="txt"></td>
                <td class="vatop tips"></td>
            </tr>
            <tr>
                <td colspan="2" class="required"><label for="memberTruename">真实姓名:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" id="memberTruename" name="memberTruename" class="txt"></td>
                <td class="vatop tips"></td>
            </tr>
            <tr>
                <td colspan="2" class="required"><label> 性别:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><ul>
                    <li>
                        <label><input type="radio" checked="checked" value="0" name="memberSex">保密</label>
                    </li>
                    <li>
                        <label><input type="radio" value="1" name="memberSex">男</label>
                    </li>
                    <li>
                        <label><input type="radio" value="2" name="memberSex">女</label>
                    </li>
                </ul></td>
                <td class="vatop tips"></td>
            </tr>
            <tr>
                <td colspan="2" class="required"><label for="memberQq">QQ:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" id="memberQq" name="memberQq" class="txt"></td>
                <td class="vatop tips"></td>
            </tr>
            <tr>
                <td colspan="2" class="required"><label class="memberWw">阿里旺旺:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" id="memberWw" name="memberWw" class="txt"></td>
                <td class="vatop tips"></td>
            </tr>
            <tr>
                <td colspan="2" class="required"><label>头像:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform">
            <span class="type-file-box">
              <input type='text' name='memberAvatar' id='memberAvatar' class='type-file-text' />
              <input type='button' name='button' id='button' value='' class='type-file-button' />
              <input name="imageFile" type="file" class="type-file-file" id="_pic" size="30" hidefocus="true" />
            </span>
                </td>
                <td class="vatop tips">支持格式gif,jpg,jpeg,png</td>
            </tr>
            </tbody>
            <tfoot>
            <tr class="tfoot">
                <td colspan="15"><a href="JavaScript:void(0);" class="btn" id="submitBtn"><span>提交</span></a></td>
            </tr>
            </tfoot>
        </table>
    </form>
</div>

<script type="text/javascript">

    $(function(){
        $('input[class="type-file-file"]').change(uploadChange);
        function uploadChange(){
            var filepatd=$(this).val();
            var extStart=filepatd.lastIndexOf(".");
            var ext=filepatd.substring(extStart,filepatd.length).toUpperCase();
            if(ext!=".PNG"&&ext!=".GIF"&&ext!=".JPG"&&ext!=".JPEG"){
                $(this).attr('value','');
                return false;
            }else{
                $("#memberAvatar").val($(this).val());
            }
            if ($(this).val() == '') return false;
        }
        //按钮先执行验证再提交表单
        $("#submitBtn").click(function(){
            if($("#user_form").valid()){
                $("#user_form").submit();
            }
        });
        $('#user_form').validate({
            errorPlacement: function(error, element){
                error.appendTo(element.parent().parent().prev().find('td:first'));
            },
            rules : {
                memberName: {
                    required : true,
                    minlength: 3,
                    maxlength: 20,
                    remote   : {
                        url : APP_BASE+'/member/validate',
                        type:'post',
                        data:{
                            memberName : function(){
                                return $('#memberName').val();
                            },
                            memberId : ''
                        }
                    }
                },
                memberPasswd: {
                    required : true,
                    maxlength: 20,
                    minlength: 6
                },
                password_confirm : {
                    required : true,
                    equalTo  : '#memberPasswd'
                },
                memberEmail   : {
                    required : true,
                    email : true,
                    remote   : {
                        url :APP_BASE+'/member/validate',
                        type:'post',
                        data:{
                            memberEmail : function(){
                                return $('#memberEmail').val();
                            },
                            memberId : ''
                        }
                    }
                },
                memberQq : {
                    digits: true,
                    minlength: 5,
                    maxlength: 11
                }
            },
            messages : {
                memberName: {
                    required : '会员名不能为空',
                    maxlength: '用户名必须在3-20字符之间',
                    minlength: '用户名必须在3-20字符之间',
                    remote   : '会员名有重复，请您换一个'
                },
                memberPasswd : {
                    required : '密码不能为空',
                    maxlength: '密码长度应在6-20个字符之间',
                    minlength: '密码长度应在6-20个字符之间'
                },
                password_confirm : {
                    required : '请再次输入您的密码',
                    equalTo  : '两次输入的密码不一致'
                },
                memberEmail  : {
                    required : '电子邮箱不能为空',
                    email   : '请您填写有效的电子邮箱',
                    remote : '邮件地址有重复，请您换一个'
                },
                memberQq : {
                    digits: '请输入正确的QQ号码',
                    minlength: '请输入正确的QQ号码',
                    maxlength: '请输入正确的QQ号码'
                }
            }
        });
    });
</script>
</@layout.body>