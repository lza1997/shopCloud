<@layout.head>

</@layout.head>
<@layout.body>
<div class="page">
    <form id="admin_form" method="post" action='${base}/changePwdSave' name="adminForm">
        <input type="hidden" name="form_submit" value="ok" />
        <table class="table tb-type2">
            <tbody>
            <tr class="noborder">
                <td colspan="2" class="required"><label class="validation" for="old_pw">原密码<!-- 原密码 -->:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input id="old_pw" name="old_pw" class="infoTableInput" type="password"></td>
                <td class="vatop tips"></td>
            </tr>
            <tr>
                <td colspan="2" class="required"><label class="validation" for="new_pw">新密码<!-- 新密码 -->:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input id="new_pw" name="new_pw" class="infoTableInput" type="password"></td>
                <td class="vatop tips"></td>
            </tr>
            <tr>
                <td colspan="2" class="required"><label class="validation" for="new_pw2">确认密码<!-- 确认密码-->:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input id="new_pw2" name="new_pw2" class="infoTableInput" type="password"></td>
                <td class="vatop tips"></td>
            </tr>
            </tbody>
            <tfoot>
            <tr class="tfoot">
                <td colspan="2" ><a href="JavaScript:void(0);" class="btn" id="submitBtn"><span>提交</span></a></td>
            </tr>
            </tfoot>
        </table>
    </form>
</div>
<script>
    //按钮先执行验证再提交表单
    $(function(){$("#submitBtn").click(function(){
        if($("#admin_form").valid()){
            $("#admin_form").submit();
        }
    });
    });
    //
    $(document).ready(function(){
        $("#admin_form").validate({
            errorPlacement: function(error, element){
                error.appendTo(element.parent().parent().prev().find('td:first'));
            },
            rules : {
                old_pw : {
                    required : true
                },
                new_pw : {
                    required : true,
                    minlength: 6,
                    maxlength: 20
                },
                new_pw2 : {
                    required : true,
                    minlength: 6,
                    maxlength: 20,
                    equalTo: '#new_pw'
                }
            },
            messages : {
                old_pw : {
                    required : '密码不能为空'
                },
                new_pw : {
                    required : '密码不能为空',
                    minlength: '密码长度为6-20',
                    maxlength: '密码长度为6-20'
                },
                new_pw2 : {
                    required : '密码不能为空',
                    minlength: '密码长度为6-20',
                    maxlength: '密码长度为6-20',
                    equalTo:   '两次输入的密码不一致，请重新输入'
                }
            }
        });
    });
</script>
</@layout.body>