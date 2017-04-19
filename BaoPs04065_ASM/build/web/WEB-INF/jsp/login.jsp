<%-- 
    Document   : newjsp
    Created on : Feb 16, 2017, 1:34:51 PM
    Author     : GiaBao
--%>

<%@ page pageEncoding="utf-8"%> 
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Spring MVC</title>
        <base href="${pageContext.servletContext.contextPath}/">
        <link href="<c:url value="/resources/ css/style.css"/>" rel="stylesheet">
    </head>
    <body>
        <div class="header">
            <jsp:include page="Header_tren.jsp"></jsp:include>
            <jsp:include page="Header_giua.jsp"></jsp:include>
            </div>
            <div class="content">
                <section class="container">
                    <div class="login">
                        <h1><s:message code="label.login.title"/></h1>
                    <form action="login.htm" method="POST">
                        <p><input type="text" name="txtuser" placeholder="<s:message code="label.login.username"/>"></p>
                        <p><input type="password" name="txtpass" value="" placeholder="<s:message code="label.login.password"/>"></p>
                        <p class="remember_me">
                            <label>
                                Language: <a href="login/checklogin.htm?lang=en">English</a> | <a href="login/checklogin.htm?lang=vi">Việt Nam</a>
                            </label>
                        </p>
                        <p class="submit"><button name="btnlogin"><s:message code="label.login.submit"/></button></p>
                    </form>
                </div>
                <div class="login-help">
                    <p>${loi}</p>
                    <p><s:message code="label.login.td"/> <a href="#"><s:message code="label.login.tb"/></a>.</p>
                </div>
            </section>
        </div>
        <!--
<script>
$(function () {
    $("a[data-lang]").click(function () {
        var lang = $(this).attr("data-lang");
        $.get("login/checklogin.htm?lang=" + lang, function () {
            location.reload();
        });
        return false;
    });
});
    </script>
        -->
        <div class="footer">
            <jsp:include page="Footer.jsp"></jsp:include>
        </div>
    </body>
</html>
