<%-- 
    Document   : Dangnhap
    Created on : Feb 28, 2017, 4:52:13 PM
    Author     : GiaBao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<c:url value="/resources/ css/style.css"/>" rel="stylesheet">
        <title>JSP Page</title>
        <base href="${pageContext.servletContext.contextPath}/">
    </head>
    <body>
        <section class="container">
            <div class="login">
                <h1>Đăng nhập tài khoản</h1>
                <spring:form action="login.htm">
                    <p><input type="text" name="txtuser" placeholder="Tên tài khoản"></p>
                    <p><input type="password" name="txtpass" value="" placeholder="Mật khẩu"></p>

                    <p class="remember_me">
                        <label>
                            <input type="checkbox" name="remember_me" id="remember_me">
                            Ghi nhớ mật khẩu
                        </label>
                    </p>
                    <p class="submit"><button name="btnlogin">Đăng nhập</button></p>
                </spring:form>
            </div>
            <div class="login-help">
                <p>${loi}</p>
                <p>Quên mật khẩu? <a href="index.html">Nhấn vào đây để lấy lại mật khẩu.</a>.</p>
            </div>
        </div>
    </section>
</body>
</html>
