<%-- 
    Document   : index
    Created on : Feb 20, 2017, 10:03:48 PM
    Author     : GiaBao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="spring"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <base href="${pageContext.servletContext.contextPath}/">
        <style type="text/css">
            *[id$=errors]{
                color:red;
                font-style: italic;
            }
        </style>
    </head>
    <body>
        <h1>Thông tin nhân viên!</h1>
        ${message}
        <spring:form action="depart.htm" modelAttribute="pb" method="POST">
            <div class="">
                <p>Mã phòng ban</p>
                <p><spring:input path="id"/></p>
                <p><spring:errors path="id"/></p>
            </div>
            <div class="">
                <p>Tên phòng ban</p>
                <p><spring:input path="name"/></p>
                <p><spring:errors path="name"/></p>
            </div> 
            <div>
                <button name="btninsert">Thêm</button>
                <button name="btnupdate">Sửa</button>
                <button name="btndelete">Xóa</button>
            </div>
        </spring:form>
        <hr>
        <h1>Danh sách phòng ban!</h1>
        <table border="1"> 
            <thead>
                <tr>  
                    <th>Mã phòng ban</th>  
                    <th>Tên phòng ban</th>  
                    <th></th>
                </tr> 
            </thead>
            <tbody>
                <c:forEach var="s" items="${pbs}"> 
                    <tr>  
                        <td>${s.id}</td>  
                        <td>${s.name}</td>  
                        <td><a href="depart/${s.id}.htm">Chọn</a></td>
                    </tr> 
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
