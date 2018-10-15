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
    <form id="user_form" enctype="multipart/form-data" method="post" action="${base}/feedback/saveOrUpdate">
        <input type="hidden" name="form_submit" value="ok" />
        <table class="table tb-type2">
            <tbody>
            <tr class="noborder">
                <td colspan="2" class="required"><label class="validation" for="title1">标题:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text"  name="title" id="title1" ></td>
            </tr>
            <tr>
                <td colspan="2" class="required"><label class="validation" for="content">内容:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" id="content" name="content" ></td>
            </tr>
            <tr>
                <td colspan="2" class="required"><label class="validation" for="phoneType">设备类型:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" id="phoneType" name="phoneType" value="1"></td>
                <td class="vatop tips"></td>
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