/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package poly.controller;

import poly.entity.UserModel;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author GiaBao
 */
@Controller
@RequestMapping(value = "/login")
public class UserController {

    //danh sách user
    public static List<UserModel> showUser(String tenuser) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://localhost:1433;databaseName=Personel";
            Connection con = DriverManager.getConnection(url, "sa", "");
            String sql = "SELECT * FROM Users";
            if (tenuser.length() > 0) {
                sql += " WHERE Username like '%" + tenuser + "%'";
            }
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            List<UserModel> list = new ArrayList<UserModel>();
            while (rs.next()) {
                String user = rs.getString("Username");
                String pass = rs.getString("Password");
                String name = rs.getString("Fullname");
                UserModel usmd = new UserModel(user, pass, name);
                list.add(usmd);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
////////////////////////////////////////////////

    @RequestMapping(value = "/checklogin")
    public String checklogin(ModelMap model) {
        return "login";
    }
//Đăng nhập tài khoản

    @RequestMapping(params = "btnlogin")
    public String kiemtra(HttpServletRequest request, ModelMap model, HttpSession session) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://localhost:1433;databaseName=Personel";
            Connection con = DriverManager.getConnection(url, "sa", "");
            String username = request.getParameter("txtuser");
            String password = request.getParameter("txtpass");
            String sql = "SELECT * FROM Users WHERE Username = '" + username + "' AND Password = '" + password + "'";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if (rs.next()) {
                String user = rs.getString("Username");
                String pass = rs.getString("Password");
                String name = rs.getString("Fullname");
                UserModel login = new UserModel(user, pass, name);
                model.addAttribute("login", login);
                session.setAttribute("hoten", user);
                return "index";
            } else {
                model.put("loi", "Tên đăng nhập hoặc mật khẩu bị sai<br>");
                return "login";
            }
        } catch (Exception e) {
            return "Error";
        }
    }
//Đăng xuất tài khoản

    @RequestMapping(value = "/dangxuat")
    public String dangxuat(ModelMap model, HttpSession session) {
        session.removeAttribute("hoten");
        return "login";
    }

//Hiển thị danh sách
    @RequestMapping(value = "/showdsuser")
    public String dsuser(ModelMap model) {
//        UserModel usmd = new UserModel();
        model.put("usermd", new UserModel());

        List<UserModel> list = new ArrayList<UserModel>();
        list = UserController.showUser("");
        model.addAttribute("listUser", list);
        return "QLNguoiDung";
    }

//Thêm
    @RequestMapping(params = "btninsert")
    public String them(@Validated @ModelAttribute("usermd") UserModel usermd, BindingResult errors, ModelMap model) {
        if (errors.hasErrors()) {
            model.addAttribute("message", "Vui lòng sửa các lỗi sau đây !");
        } else {
            try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                String url = "jdbc:sqlserver://localhost:1433;databaseName=Personel";
                Connection con = DriverManager.getConnection(url, "sa", "");
                String sql = "INSERT INTO Users VALUES(?,?,?)";
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, usermd.getUsername());
                stm.setString(2, usermd.getPassword());
                stm.setString(3, usermd.getFullname());
                stm.executeUpdate();
                stm.close();
                con.close();
                model.addAttribute("message", "Thêm thành công user !");
            } catch (Exception e) {
                e.printStackTrace();
                model.addAttribute("message", "User trên đã có người đăng ký !");
            }
        }
//        model.put("usermd", new UserModel());
        List<UserModel> list = new ArrayList<UserModel>();
        list = UserController.showUser("");
        model.addAttribute("listUser", list);
        return "QLNguoiDung";
//        return "redirect:login/showdsuser.htm";
    }

//Update user
    @RequestMapping(params = "btnupdate")
    public String update(@ModelAttribute("usermd") UserModel usermd, ModelMap model) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://localhost:1433;databaseName=Personel";
            Connection con = DriverManager.getConnection(url, "sa", "");
            String sql = "UPDATE Users SET Password=?, Fullname=? WHERE Username=?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, usermd.getPassword());
            stm.setString(2, usermd.getFullname());
            stm.setString(3, usermd.getUsername());
            stm.executeUpdate();
            stm.close();
            con.close();
            List<UserModel> list = new ArrayList<UserModel>();
            list = UserController.showUser("");
            model.addAttribute("listUser", list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "QLNguoiDung";
    }

//Chọn user
    @RequestMapping(value = "/edit")
    public String edit(HttpServletRequest request, ModelMap model) {
        String username = request.getParameter("txtuser");
        String password = request.getParameter("txtpass");
        String fullname = request.getParameter("txtfname");
        UserModel usmd = new UserModel(username, password, fullname);
        model.addAttribute("usermd", usmd);

        List<UserModel> list = new ArrayList<UserModel>();
        list = UserController.showUser("");
        model.addAttribute("listUser", list);
        return "QLNguoiDung";
    }
//Xóa user  

    @RequestMapping(value = "/delete")
    public String delete(HttpServletRequest request, ModelMap model, @ModelAttribute("usermd") UserModel usermd) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://localhost:1433;databaseName=Personel";
            Connection con = DriverManager.getConnection(url, "sa", "");
            String sql = "DELETE FROM Users WHERE Username=?";
            PreparedStatement stm = con.prepareStatement(sql);
            String user = request.getParameter("txtuser");
            stm.setString(1, user);
            stm.executeUpdate();
            stm.close();
            con.close();
            List<UserModel> list = new ArrayList<UserModel>();
            list = UserController.showUser("");
            model.addAttribute("listUser", list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "QLNguoiDung";
    }

//Tìm user
    @RequestMapping(params = "btnfind")
    public String find(HttpServletRequest request, ModelMap model, @ModelAttribute("usermd") UserModel usermd) {
        String user = request.getParameter("txtfind");
        List<UserModel> list = new ArrayList<UserModel>();
        list = UserController.showUser(user);
        model.addAttribute("listUser", list);
        return "QLNguoiDung";
    }
}
