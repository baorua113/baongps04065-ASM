<%-- 
    Document   : Footer
    Created on : Feb 16, 2017, 1:37:25 PM
    Author     : GiaBao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <base href="${pageContext.servletContext.contextPath}/">
        <link href="<c:url value="/resources/ css/footer.css" />" rel="stylesheet">
    </head>
    <body>
        <div class="fooder">
            <div class="fooder-trong">
                <div class="fooder-tren">
                    <div class="trai">
                        <div class="gt">Giới thiệu</div>
                        <div class="nd1">
                            Được thành lập vào năm 1993, 
                            Công ty Cổ Phần Công Nghệ Omega được biết đến như một nhà cung cấp chuyên nghiệp
                            các giải pháp thiết bị và dịch vụ kỹ thuật chất lượng cao, công nghệ tiên tiến cho khách hàng
                            ngành công nghệ thông tin
                        </div>
                        <br>
                        <div class="nd1">
                            Chúng tôi cũng đảm nhận cung cấp các dịch vụ sau bán hàng như: 
                            Bảo trì, đại tu, sửa chữa, đào tạo, hướng dẫn sử dụng, 
                            dịch vụ quản lý tài sản & hợp đồng cho khách hàng
                        </div>
                    </div>
                    <div class="giua">
                        <div class="lh">Liên hệ</div>
                        <div class="nd4">Địa chỉ 1: 365 Đinh Tiên Hoàng, Quận 3 TP.HCM</div>
                        <div class="nd4">Địa chỉ 2: 168 Bạch Đằng, Thủ Dầu Một TP.Bình Dương</div>
                        <div class="nd4">Tel: 08. 3911 5611 - Fax: 08. 3911 5644</div>
                        <div class="nd4">E-mail: info@omega.vn</div>
                        <div class="nd4">Website: www.omega.com</div>
                    </div>
                    <div class="phai">
                        <div class="logon-foodter">Omega.</div>
                    </div>
                </div>
                <hr>
                <div class="fooder-duoi">    
                    <a href="#"><img src="img/06-facebook-512.png" alt="" width="20px" height="20px"/></a>  
                    <a href="#"><img src="img/social.jpg" alt="" width="20px" height="20px"/></a>
                    <a href="#"><img src="img/linkedin-4096-black.jpg" alt="" width="20px" height="20px"/></a>      
                    <a href="#"><img src="img/40-google-plus-512.png" alt="" width="20px" height="20px"/></a>
                </div>
            </div>
        </div>
    </body>
</html>
