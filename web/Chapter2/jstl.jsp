<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
</head>

<body>
<c:out value="cc" />
<br/>
数字格式化：<br/>
<fmt:formatNumber value="999.9" type="number" maxFractionDigits="2" />
<br/>
<c:set var="salary" value="12000"/>

<br/>
本地格式化：<br/>
<fmt:formatNumber type="currency" value="${salary}"/>
<br/>
en_US格式化：<br/>
<fmt:setLocale value="en_US"/>
<fmt:formatNumber type="currency" value="${salary}"/>
<br/>

</body>
</html>