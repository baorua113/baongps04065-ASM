<%-- 
    Document   : Header
    Created on : Feb 16, 2017, 1:21:31 PM
    Author     : GiaBao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header</title>
        <base href="${pageContext.servletContext.contextPath}/">
        <link href="<c:url value="/resources/ css/header_tren.css"/>" rel="stylesheet">
    </head>
    <body>
        <div class="header-tren">
            <div class="header-trenahi">
                <div class="logo">Omega.</div>
                <div class="logo1">www.omega.com</div>
            </div>
        </div>
    </body>
</html>
