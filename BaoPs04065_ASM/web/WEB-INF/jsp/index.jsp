<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Spring Web MVC project</title>
        <base href="${pageContext.servletContext.contextPath}/">
    </head>

    <body>
        <div class="header">
            <jsp:include page="Header_tren.jsp"></jsp:include>
            <jsp:include page="Header_duoi.jsp"></jsp:include>
            <jsp:include page="Header_giua.jsp"></jsp:include>
            </div>
            <div class="">
                <a href="login/showdsuser.htm">Quản lý User</a>
                <a href="staff.htm">Quản lý Staff</a>
                <a href="depart.htm">Quản lý Depart</a>
                <a href="record/show.htm">Đánh giá Staff</a>
                <a href="staff/report.htm">Thành tích và kỷ luật</a>
                <a href="mailer2/form.htm">Gửi mail</a>
            </div>
            <div class="footer">
            <jsp:include page="Footer.jsp"></jsp:include>
        </div>
    </body>
</html>
