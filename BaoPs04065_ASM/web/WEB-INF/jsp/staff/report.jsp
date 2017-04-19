<%-- 
    Document   : report
    Created on : Feb 20, 2017, 10:18:55 PM
    Author     : GiaBao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Thành tích và kỷ luật!</h1>
        <table border="1"> 
            <tr>  
                <th>Mã NV</th> 
                <th>Tổng thành tích</th> 
                <th>Tổng kỷ luật</th> 
                <th>Tổng kết</th> 
            </tr> 
            <c:forEach var="a" items="${arrays}"> 
                <tr> 
                    <td>${a[0]}</td> 
                    <td>${a[1] }</td> 
                    <td>${a[2]}</td>
                    <td>${a[1] - a[2]}</td> 
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
