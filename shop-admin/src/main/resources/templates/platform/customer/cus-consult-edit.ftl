<link href="${base}/res/css/base.css" rel="stylesheet" type="text/css">
<link href="${base}/res/css/member.css" rel="stylesheet" type="text/css">
<div class="eject_con" style="width:450px">
  <div id="warning"></div>
  <form id="message" target="_parent" method="post" action="">
    <input type="hidden" name="type" value="edit">
    <dl>
      <dt>咨询内容：</dt>
      <dd>${consult.consultContent}</dd>
    </dl>
    <dl>
      <dt class="required"><em class="pngFix"></em>回复咨询：</dt>
      <dd>
        <input type="hidden" id="consultId" name="consult_id" value="${consult.consultId}">
        <textarea name="content" id="content" rows="3" class="w300" maxlength="150">${consult.consultReply}</textarea>
      </dd>
    </dl>
  </form>
</div>
