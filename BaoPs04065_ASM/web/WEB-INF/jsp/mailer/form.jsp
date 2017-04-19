<%-- 
    Document   : form
    Created on : Feb 15, 2017, 2:27:15 PM
    Author     : GiaBao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <base href="${pageContext.servletContext.contextPath}/"/>
        <title>Send Mail</title>
    </head>
    <body>
        ${message}
        <form action="mailer2/send.htm" method="post">
            <p><input name="from" placeholder="From"></p>
            <p><input name="to" placeholder="To"></p>
            <p><input name="subject" placeholder="Subject"></p>
            <p><textarea name="body" placeholder="Body" rows="3" cols="30"></textarea></p>
            <button>Send</button>
        </form>
    </body>
</html>
