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
        <link href="<c:url value="/resources/ css/header_duoi.css"/>" rel="stylesheet">
    </head>
    <body>
        <div class="header-duoi">
            <div class="image"><img id="hinh" src="${pageContext.servletContext.contextPath}/img/1.jpg" alt=""/></div>  
            <div class="back"><img src="${pageContext.servletContext.contextPath}/img/back.png" onclick="back()"/></div>
            <div class="next"><img src="${pageContext.servletContext.contextPath}/img/next.png" onclick="next()"/></div>
            <script>
                var a = document.getElementById("hinh");
                var i = 1;

                function next() {
                    i++;
                    if (i >= 4) {
                        i = 1;
                    } else {
                        //
                    }
                    a.src = "${pageContext.servletContext.contextPath}/img/" + i + ".jpg";
                }
                function back() {
                    if (i == 4)
                        i -= 2;
                    else
                        i--;
                    if (i < 1) {
                        i = 3;
                    } else {
                        //
                    }
                    a.src = "${pageContext.servletContext.contextPath}/img/" + i + ".jpg";
                }
                var mySlideshow;
                document.mySlideshow = setInterval(next, 4000);
            </script>
        </div>
    </body>
</html>
