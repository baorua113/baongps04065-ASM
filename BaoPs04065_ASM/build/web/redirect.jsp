<%--
Views should be stored under the WEB-INF folder so that
they are not accessible except through controller process.

This JSP is here to provide a redirect to the dispatcher
servlet but should be the only JSP outside of WEB-INF.
home/index.htm
<% response.sendRedirect("record/show.htm"); %>
<% response.sendRedirect("login/checklogin.htm"); %>
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% response.sendRedirect("login/checklogin.htm"); %>
