<%
response.setStatus(500);

// 获取异常类
Throwable ex = Exceptions.getThrowable(request);
if (ex != null){
	LoggerFactory.getLogger("500.jsp").error(ex.getMessage(), ex);
}

// 编译错误信息
StringBuilder sb = new StringBuilder("错误信息：\n");
if (ex != null) {
	sb.append(Exceptions.getStackTraceAsString(ex));
} else {
	sb.append("未知错误.\n\n");
}

// 如果是异步请求或是手机端，则直接返回信息
if (Servlets.isAjaxRequest(request)) {
	out.print(sb);
}

// 输出异常信息页面
else {
%>
<%@page import="org.slf4j.Logger,org.slf4j.LoggerFactory"%>
<%@page import="com.rt.admin.utils.Servlets"%>
<%@page import="com.rt.core.common.Exceptions"%>
<%@page import="com.rt.core.common.StringUtils"%>
<%@page contentType="text/html;charset=UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
	<title>500 - 系统内部错误</title>
</head>
<body>
	<div class="container-fluid">
		<div class="page-header"><h1>系统内部错误.</h1></div>
		<div class="errorMessage" id="msg">
			错误信息：<%=ex==null?"未知错误.":StringUtils.toHtml(ex.getMessage())%> <br/> <br/>
			请点击“查看详细信息”按钮，将详细错误信息发送给系统管理员，谢谢！<br/> <br/>
			<a href="javascript:" onclick="history.go(-1);" class="btn">返回上一页</a> &nbsp;
			<a href="javascript:" onclick="showMsgDetail()" class="btn">查看详细信息</a>
		</div>
		<div class="errorMessage" style="display: none;" id="msgDetail">
			<%=StringUtils.toHtml(sb.toString())%> <br/>
			<a href="javascript:" onclick="history.go(-1);" class="btn">返回上一页</a> &nbsp;
			<a href="javascript:" onclick="showMsg()" class="btn">隐藏详细信息</a>
			<br/> <br/>
		</div>
		<script>
			function showMsg(){
				document.getElementById("msg").style.display="block";
				document.getElementById("msgDetail").style.display="none";
			}
			function showMsgDetail(){
				document.getElementById("msg").style.display="none";
				document.getElementById("msgDetail").style.display="block";
			}
		</script>
	</div>
</body>
</html>
<%
} out = pageContext.pushBody();
%>