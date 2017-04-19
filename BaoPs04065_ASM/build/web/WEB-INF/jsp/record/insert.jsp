<%-- 
    Document   : insert
    Created on : Feb 21, 2017, 12:21:46 AM
    Author     : GiaBao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <base href="${pageContext.servletContext.contextPath}/">
    </head>
    <body>
        ${message} 
        <form:form action="record/layds.htm">  
            <div>  
                <label>Phòng ban:</label> 
                <select name="txtmapb">
                    <c:forEach var="s" items="${departs}">
                        <option value="${s.id}">${s.name}</option>
                    </c:forEach>              
                </select>
                <button>Lấy danh sách</button>
            </div>           
        </form:form>
        <hr>
        <h1>Danh sách nhân viên!</h1>
        <table border="1"> 
            <thead>
                <tr>  
                    <th>Mã NV</th>  
                    <th>Họ và tên</th>  
                    <th>Giới tính</th>
                    <th>Ngày sinh</th>
                    <th>Hình ảnh</th>
                    <th>Phòng ban</th>
                </tr> 
            </thead>
            <tbody>
                <c:forEach var="s" items="${staff}"> 
                    <tr>  
                        <td>${s.id}</td>  
                        <td>${s.name}</td>  
                        <td>${s.gender?'Nam':'Nữ'}</td>  
                        <td>${s.birthday}</td>
                        <td>
                            <img src="files/${s.photo}"/>
                        </td>
                        <td>${s.depart.name}</td> 
                    </tr> 
                </c:forEach>
            </tbody>
        </table>
        <hr>
        <form:form action="record/insert.htm" modelAttribute="record">   
            <div>  
                <label>Mã nhân viên</label>
                <form:select path="staff.id"  items="${staff}" itemValue="id" itemLabel="name"/> 
            </div> 
            <div> 
                <label>Loại</label> 
                <form:radiobutton path="type" value="true" label="Thành tích"/> 
                <form:radiobutton path="type" value="false" label="Kỷ luật"/> 
            </div>
            <div>
                <form:textarea path="reason" rows="3"/>
            </div>
            <div>
                <button>Insert</button>
            </div>
        </form:form>
    </body>
</html>
