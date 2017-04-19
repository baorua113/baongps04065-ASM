<%-- 
    Document   : Header_giua
    Created on : Feb 28, 2017, 3:10:58 PM
    Author     : GiaBao
--%>

<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="<c:url value="/resources/ css/header_giua.css"/>" rel="stylesheet">
        <link href="<c:url value="/resources/ css/css-tendn.css"/>" rel="stylesheet">
        <link href="<c:url value="/resources/ css/css-menu.css"/>" rel="stylesheet">
    </head>
    <body>
        <div class="header_giua">
            <div class="header-giua_trai">
                <div class="menu">
                    <ul>
                        <li><a href="#">Trang chủ</a></li>
                        <li><a href="#">Phòng ban</a></li>
                        <li><a href="#">Nhân viên</a></li>
                        <li><a href="#">Thông báo</a></li>
                    </ul>
                </div>
            </div>
            <div class="header-giua_phai">
                <div class="menu_1">
                    <ul>
                        <c:set var="name" value="${sessionScope.hoten}"/>
                        <c:choose>
                            <c:when test="${empty name}">
                                <li><a href="#">Đăng nhập</a></li>
                                </c:when>
                                <c:when test="${not empty name}">
                                <li><a href="#">Xin chào: ${sessionScope.hoten}</a>
                                    <ul>
                                        <li><a href="#">Thông tin tài khoản</a></li>
                                        <li><a href="${pageContext.servletContext.contextPath}/login/dangxuat.htm">Đăng xuất</a></li>
                                    </ul>
                                </li>
                            </c:when>
                        </c:choose>
                    </ul>
                </div>
            </div>
        </div>
    </body>
</html>
