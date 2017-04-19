<%-- 
    Document   : danhsachuser
    Created on : Feb 10, 2017, 8:51:58 AM
    Author     : GiaBao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <base href="${pageContext.servletContext.contextPath}/">
    </head>
    <body>
        <h1>Thông tin User</h1>
        <spring:form action="login.htm" commandName="usermd">
            <div>Username:</div>
            <spring:input path="username"/>
            <div>Password:</div>
            <spring:input path="password"/>
            <div>Fullname:</div>
            <spring:input path="fullname"/>
            <hr>
            <p>Tìm kiếm:</p>
            <input name="txtfind"/>
            <button name="btnfind">Oke</button>
            <hr>
            <button name="btninsert">Insert</button>
            <button name="btnupdate">Update</button>
        </spring:form>
        <hr>
        <h1>Danh sách user!</h1>
        <table border="1">
            <tr>
                <td>Số thứ tự</td>
                <td>Tên đăng nhập</td>
                <td>Mật khẩu</td>
                <td>Họ và tên</td>
                <td>Chức năng</td>
            </tr>
            <c:set var="count" value="0"/>
            <c:forEach var="rows" items="${listUser}">
                <form action="login/delete.htm">
                    <tr>
                        <c:set var="count" value="${count + 1}"/>
                        <td>${count}</td>
                        <td>${rows.username}</td>
                        <td>${rows.password}</td>
                        <td>${rows.fullname}</td>
                        <c:url var="del" value="login/edit.htm">
                            <c:param name="txtuser" value="${rows.username}"/>
                            <c:param name="txtpass" value="${rows.password}"/>
                            <c:param name="txtfname" value="${rows.fullname}"/>
                        </c:url>
                        <td>
                            <a href="${del}">Edit</a>
                            <input type="hidden" name="txtuser" value="${rows.username}"/>
                            <input type="submit" name="action" value="Delete"/>
                        </td>
                    </tr>
                </form>
            </c:forEach> 
            <tr>
                <spring:form action="login.htm" commandName="usermd">
                    <td>New Acccount</td>
                    <td><spring:input path="username"/></td>
                    <td><spring:input path="password"/></td>
                    <td><spring:input path="fullname"/></td>
                    <td>
                        <button name="btninsert">Insert</button>
                        <button name="btnupdate">Update</button>
                    </td>
                </spring:form>
            </tr>   
        </table>
    </body>
</html>
