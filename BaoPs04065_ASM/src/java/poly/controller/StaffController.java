/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package poly.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.io.FileUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import poly.entity.Depart;
import poly.entity.Staff;

/**
 *
 * @author GiaBao
 */
@Transactional
@Controller
@RequestMapping(value = "/staff")
public class StaffController {

    @Autowired
    SessionFactory factory;

    @SuppressWarnings("unchecked")
    public List<Staff> getStaffs() {
        Session session = factory.getCurrentSession();
        String hql = "FROM Staff";
        Query query = session.createQuery(hql);
        query.setFirstResult(0);
        query.setMaxResults(5);
        List<Staff> list = query.list();
        return list;
    }

    @RequestMapping()
    public String showall(ModelMap model) {
        model.addAttribute("nv", new Staff());
        model.addAttribute("nvs", getStaffs());
        int sbd = 0;
        int skt = 5;
        model.addAttribute("sobd", sbd);
        model.addAttribute("sokt", skt);
        return "staff/Staffs";
    }

    @RequestMapping("{id}")
    public String edit(ModelMap model, @PathVariable("id") String id) {
        Session session = factory.getCurrentSession();
        Staff staff = (Staff) session.get(Staff.class, id);

        model.addAttribute("nv", staff);
        model.addAttribute("nvs", getStaffs());
        return "staff/Staffs";
    }

    @RequestMapping(params = "btninsert")
    public String insert(ModelMap model, @Validated @ModelAttribute("nv") Staff staff, BindingResult errors,
            HttpServletRequest request, HttpServletResponse response,
            @RequestParam(value = "fileUpload", required = false) MultipartFile fileUpload) {
        if (errors.hasErrors()) {
            model.addAttribute("message", "Vui lòng sửa các lỗi sau đây !");
        } else {
            String path = request.getSession().getServletContext().getRealPath("/") + "files/";
            Session session = factory.openSession();
            Transaction t = session.beginTransaction();
            if (fileUpload.isEmpty()) {
                try {
                    session.save(staff);
                    t.commit();
                    model.addAttribute("message", "Thêm mới thành công !");
                } catch (Exception e) {
                    t.rollback();
                    model.addAttribute("message", "Thêm mới thất bại !");
                } finally {
                    session.close();
                }
            } else {
                try {
                    FileUtils.forceMkdir(new File(path));
                    File upload = new File(path + fileUpload.getOriginalFilename());
                    fileUpload.transferTo(upload);
                    model.addAttribute("fileUpload", fileUpload.getOriginalFilename());
                    String hinh = fileUpload.getOriginalFilename();
                    staff.setPhoto(hinh);
                    session.save(staff);
                    t.commit();
                    model.addAttribute("message", "Thêm mới thành công !");
                } catch (Exception e) {
                    t.rollback();
                    model.addAttribute("message", "Thêm mới thất bại !");
                } finally {
                    session.close();
                }
            }
        }
        model.addAttribute("nvs", getStaffs());
        return "staff/Staffs";
    }

//
    @RequestMapping(params = "btntruoc")
    public String tang(ModelMap model, HttpServletRequest request, @ModelAttribute("nv") Staff staff) {
        String sobd = request.getParameter("txtso1");
        String sokt = request.getParameter("txtso2");
        int sbd = Integer.parseInt(sobd);
        int skt = Integer.parseInt(sokt);
        sbd = sbd + 5;
        Session session = factory.getCurrentSession();
        String hql = "FROM Staff";
        Query query = session.createQuery(hql);
        query.setFirstResult(sbd);
        query.setMaxResults(skt);
        List<Staff> list = query.list();
        model.addAttribute("nvs", list);
        model.addAttribute("sobd", sbd);
        model.addAttribute("sokt", skt);
        return "staff/Staffs";
    }
//

    @RequestMapping(params = "btnsau")
    public String giam(ModelMap model, HttpServletRequest request, @ModelAttribute("nv") Staff staff) {
        String sobd = request.getParameter("txtso1");
        String sokt = request.getParameter("txtso2");
        int sbd = Integer.parseInt(sobd);
        int skt = Integer.parseInt(sokt);
        sbd = sbd - 5;
        if (sbd < 0) {
            sbd = 0;
        }
        Session session = factory.getCurrentSession();
        String hql = "FROM Staff";
        Query query = session.createQuery(hql);
        query.setFirstResult(sbd);
        query.setMaxResults(skt);
        List<Staff> list = query.list();
        model.addAttribute("nvs", list);
        model.addAttribute("sobd", sbd);
        model.addAttribute("sokt", skt);
        return "staff/Staffs";
    }
//

    @RequestMapping(value = "/report")
    public String report(ModelMap model) {
        Session session = factory.getCurrentSession();
        String hql = "SELECT r.staff.id, r.staff.name, r.staff.photo, SUM(case when r.type=1 then 1 else 0 end),"
                + "SUM(case when r.type=0 then 1 else 0 end) "
                + "FROM Record r GROUP BY r.staff.id, r.staff.name, r.staff.photo";
        Query query = session.createQuery(hql);
        List<Object[]> list = query.list();
        model.addAttribute("arrays", list);
        return "Trangchu";
    }

    @RequestMapping(params = "btndelete")
    public String delete(ModelMap model, @ModelAttribute("nv") Staff staff) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            session.delete(staff);
            t.commit();
            model.addAttribute("message", "Xóa thành công !");
        } catch (Exception e) {
            t.rollback();
            model.addAttribute("message", "Xóa thất bại !");
        } finally {
            session.close();
        }
        return "redirect:staff.htm";
    }

    @RequestMapping(params = "btnupdate")
    public String update(ModelMap model, @Validated @ModelAttribute("nv") Staff staff,
            HttpServletRequest request, HttpServletResponse response,
            @RequestParam(value = "fileUpload", required = false) MultipartFile fileUpload) {
        String path = request.getSession().getServletContext().getRealPath("/") + "files/";
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            FileUtils.forceMkdir(new File(path));
            File upload = new File(path + fileUpload.getOriginalFilename());
            fileUpload.transferTo(upload);
            model.addAttribute("fileUpload", fileUpload.getOriginalFilename());
            String hinh = fileUpload.getOriginalFilename();
            staff.setPhoto(hinh);
            session.update(staff);
            t.commit();
            model.addAttribute("message", "Cập nhật thành công !");
        } catch (Exception e) {
            t.rollback();
            model.addAttribute("message", "Cập nhật thất bại !");
        } finally {
            session.close();
        }
        model.addAttribute("nvs", getStaffs());
        return "staff/Staffs";
    }

    @ModelAttribute("departs")
    public List<Depart> getDeparts() {
        Session session = factory.getCurrentSession();
        String hql = "FROM Depart";
        Query query = session.createQuery(hql);
        List<Depart> list = query.list();
        return list;
    }
}
