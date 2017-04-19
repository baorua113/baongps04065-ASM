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
        <spring:form action="staff.htm" modelAttribute="nv" enctype="multipart/form-data">
            <div class="">
                <p>Mã nhân viên</p>
                <p><spring:input path="id"/></p>
                <p><spring:errors path="id"/></p>
            </div>
            <div class="">
                <p>Tên nhân viên</p>
                <p><spring:input path="name"/></p>
                <p><spring:errors path="name"/></p>
            </div>
            <div class="">
                <p>Giới tính:
                    <spring:select path="gender">
                        <spring:option value="true">Nam</spring:option>
                        <spring:option value="false">Nữ</spring:option>
                    </spring:select>
                </p>
            </div>
            <div class="">
                <p>Ngày sinh</p>
                <p><spring:input path="birthday"/></p>
                <p><spring:errors path="birthday"/></p>
            </div>
            <div class="">
                <p>Hình ảnh</p>
                <p><spring:input path="photo"/></p>
                <p><input name="fileUpload" type="file" /></p>
                <p><spring:errors path="photo"/></p>
                <div class="">
                    <p>Email</p>
                    <p><spring:input path="email"/></p>
                    <p><spring:errors path="email"/></p>
                </div>
                <div class="">
                    <p>Số điện thoại</p>
                    <p><spring:input path="phone"/></p>
                    <p><spring:errors path="phone"/></p>
                </div>
                <div class="">
                    <p>Lương</p>
                    <p><spring:input path="salary"/></p>
                    <p><spring:errors path="salary"/></p>
                </div>
                <div class="">
                    <p>Cấp độ</p>
                    <p><spring:input path="notes"/></p>
                </div>
                <div class="">
                    <p>Phòng ban:
                        <spring:select path="depart.id"  items="${departs}" itemValue="id" itemLabel="name"/> 
                    </p>
                </div> 
                <div>
                    <button name="btninsert">Thêm</button>
                    <button name="btnupdate">Sửa</button>
                    <button name="btndelete">Xóa</button>
                </div>
            </spring:form>
            <hr>
            <h1>Danh sách nhân viên!</h1>
            ${message}
            <table border="1"> 
                <thead>
                    <tr>  
                        <th>Mã NV</th>  
                        <th>Họ và tên</th>  
                        <th>Giới tính</th>
                        <th>Ngày sinh</th>
                        <th>Hình ảnh</th>
                        <th>Email</th>
                        <th>Số điện thoại</th>
                        <th>Tiền lương</th>
                        <th>Cấp độ</th>
                        <th>Phòng ban</th>
                        <th></th>
                    </tr> 
                </thead>
                <tbody>
                    <c:forEach var="s" items="${nvs}"> 
                        <tr>  
                            <td>${s.id}</td>  
                            <td>${s.name}</td>  
                            <td>${s.gender?'Nam':'Nữ'}</td>  
                            <td>${s.birthday}</td>
                            <td>
                                <img src="files/${s.photo}"/></td>
                            <td>${s.email}</td>
                            <td>${s.phone}</td>
                            <td>${s.salary}</td>
                            <td>${s.notes}</td>
                            <td>${s.depart.name}</td> 
                            <td><a href="staff/${s.id}.htm">Chọn</a></td>
                        </tr> 
                    </c:forEach>
                </tbody>
            </table>
            <div class="chuyentrang">
                <form action="staff.htm" method="POST">
                    <button name="btnsau"><</button>
                    <input type="hidden" value="${sobd}" name="txtso1"/>
                    <input type="hidden" value="${sokt}" name="txtso2"/>
                    <button name="btntruoc">></button>
                </form>
            </div>
    </body>
</html>
