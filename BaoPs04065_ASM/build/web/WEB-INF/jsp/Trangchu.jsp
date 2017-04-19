<%-- 
    Document   : newjsp
    Created on : Feb 16, 2017, 1:34:51 PM
    Author     : GiaBao
--%>

<%@ page pageEncoding="utf-8"%> 
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
                <h1>Thành tích và kỷ luật!</h1>
                <table border="1"> 
                    <tr>  
                        <th>Mã nhân viên</th> 
                        <th>Tên nhân viên</th> 
                        <th>Hình</th> 
                        <th>Tổng thành tích</th> 
                        <th>Tổng kỷ luật</th> 
                        <th>Tổng kết</th> 
                    </tr> 
                <c:forEach var="a" items="${arrays}"> 
                    <tr> 
                        <td>${a[0]}</td> 
                        <td>${a[1]}</td> 
                        <td>${a[2]}</td>
                        <td>${a[3]}</td> 
                        <td>${a[4]}</td>
                        <td>${a[3] - a[4]}</td> 
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div class="footer">
            <jsp:include page="Footer.jsp"></jsp:include>
        </div>
    </body>
</html>
