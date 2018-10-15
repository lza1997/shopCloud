<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/admincp.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/common_select.js" charset="utf-8"></script>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>品牌</h3>
            <ul class="tab-base">
                <li><a href="${base}/website/index/list"><span>管理</span></a></li>
                <li><a href="${base}/website/index/forward?id=0"><span>新增楼层</span></a></li>
                <li><a href="javascript:;" class="current"><span>新增图片</span></a></li>
                <li><a href="${base}/website/index/getBrand"><span>新增品牌</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form id="banner_form" enctype="multipart/form-data" method="post" action="${base}/website/index/saveBanner">
        <input type="hidden" name="form_submit" value="ok" />
        <table class="table tb-type2 nobdb">
            <tbody>
            <tr>
                <td class="required">轮播图片1:  </td>
                <td class="vatop rowform">
                    <span class="type-file-box">
                        <input type='text' name='textfield' class='type-file-text' />
                        <input type='button' name='button' value='' class='type-file-button' />
                        <input name="bannerFiles" type="file" class="type-file-file" size="30" hidefocus="true" nc_type="change_pic">
                    </span>
                </td>
                <td class="required">URL:  </td>
                <td class="vatop rowform">
                    <input type='text' name='bannerUrl'  class='txt' />
                </td>
            </tr>
            <tr>
                <td class="required">轮播图片2:  </td>
                <td class="vatop rowform">
                    <span class="type-file-box">
                        <input type='text' name='textfield' class='type-file-text' />
                        <input type='button' name='button' value='' class='type-file-button' />
                        <input name="bannerFiles" type="file" class="type-file-file" size="30" hidefocus="true" nc_type="change_pic">
                    </span>
                </td>
                <td class="required">URL:  </td>
                <td class="vatop rowform">
                    <input type='text' name='bannerUrl'  class='txt' />
                </td>
            </tr>
            <tr>
                <td class="required">轮播图片3:  </td>
                <td class="vatop rowform">
                    <span class="type-file-box">
                        <input type='text' name='textfield' class='type-file-text' />
                        <input type='button' name='button' value='' class='type-file-button' />
                        <input name="bannerFiles" type="file" class="type-file-file" size="30" hidefocus="true" nc_type="change_pic">
                    </span>
                </td>
                <td class="required">URL:  </td>
                <td class="vatop rowform">
                    <input type='text' name='bannerUrl'  class='txt' />
                </td>
            </tr>
            <tr>
                <td class="required">轮播图片4:  </td>
                <td class="vatop rowform">
                    <span class="type-file-box">
                        <input type='text' name='textfield' class='type-file-text' />
                        <input type='button' name='button' value='' class='type-file-button' />
                        <input name="bannerFiles" type="file" class="type-file-file" size="30" hidefocus="true" nc_type="change_pic">
                    </span>
                </td>
                <td class="required">URL:  </td>
                <td class="vatop rowform">
                    <input type='text' name='bannerUrl'  class='txt' />
                </td>
            </tr>
            <tr>
                <td class="required">轮播图片5:  </td>
                <td class="vatop rowform">
                    <span class="type-file-box">
                        <input type='text' name='textfield' class='type-file-text' />
                        <input type='button' name='button' value='' class='type-file-button' />
                        <input name="bannerFiles" type="file" class="type-file-file" size="30" hidefocus="true" nc_type="change_pic">
                    </span>
                </td>
                <td class="required">URL:  </td>
                <td class="vatop rowform">
                    <input type='text' name='bannerUrl'  class='txt' />
                </td>
            </tr>
            <tr>
                <td class="required">推广商品图片1:  </td>
                <td class="vatop rowform">
                    <span class="type-file-box">
                        <input type='text' name='textfield' class='type-file-text' />
                        <input type='button' name='button' value='' class='type-file-button' />
                        <input name="recommendFiles" type="file" class="type-file-file" size="30" hidefocus="true" nc_type="change_pic">
                    </span>
                </td>
                <td class="required">URL:  </td>
                <td class="vatop rowform">
                    <input type='text' name='recommendUrl'  class='txt' />
                </td>
            </tr>
            <tr>
                <td class="required">推广商品图片2:  </td>
                <td class="vatop rowform">
                    <span class="type-file-box">
                        <input type='text' name='textfield' class='type-file-text' />
                        <input type='button' name='button' value='' class='type-file-button' />
                        <input name="recommendFiles" type="file" class="type-file-file" size="30" hidefocus="true" nc_type="change_pic">
                    </span>
                </td>
                <td class="required">URL:  </td>
                <td class="vatop rowform">
                    <input type='text' name='recommendUrl'  class='txt' />
                </td>
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
</@layout.body>
<script type="text/javascript">
    $(function(){
        $(".type-file-file").change(function(){
            $(this).parent("span").find("input:eq(0)").val($(this).val());
        });
        $("#submitBtn").click(function(){
            $("#banner_form").submit();
        })
    })
</script>