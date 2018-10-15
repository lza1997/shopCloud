<%
response.setStatus(403);

//获取异常类
Throwable ex = Exceptions.getThrowable(request);

// 如果是异步请求或是手机端，则直接返回信息
if (Servlets.isAjaxRequest(request)) {
	/* if (ex!=null && StringUtils.startsWith(ex.getMessage(), "msg:")){
		out.print(StringUtils.replace(ex.getMessage(), "msg:", ""));
	}else{ */
		out.print("操作权限不足.");
	/* } */
}

//输出异常信息页面
else {
%>
<%@page import="com.rt.admin.utils.Servlets"%>
<%@page import="com.rt.core.common.Exceptions"%>
<%@page import="com.rt.core.common.StringUtils"%>
<%@page contentType="text/html;charset=UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
	<title>403 - 操作权限不足</title>
</head>
<body>
	<div class="container-fluid">
		<div class="page-header"><h1>操作权限不足.</h1></div>
		<%-- <%
			if (ex!=null && StringUtils.startsWith(ex.getMessage(), "msg:")){
				out.print("<div>"+StringUtils.replace(ex.getMessage(), "msg:", "")+" <br/> <br/></div>");
			}
		%> --%>
		<div><a href="javascript:" onclick="history.go(-1);" class="btn">返回上一页</a></div>
	</div>
</body>
</html>
<%
} out = pageContext.pushBody();
%>