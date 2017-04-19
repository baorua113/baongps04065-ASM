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
@RequestMapping(value = "/depart")
public class DepartController {

    @Autowired
    SessionFactory factory;

    @SuppressWarnings("unchecked")
    public List<Depart> getDeparts() {
        Session session = factory.getCurrentSession();
        String hql = "FROM Depart";
        Query query = session.createQuery(hql);
        List<Depart> list = query.list();
        return list;
    }

    @RequestMapping()
    public String showall(ModelMap model) {
        model.addAttribute("pb", new Depart());
        model.addAttribute("pbs", getDeparts());
        return "depart/Departs";
    }

    @RequestMapping("{id}")
    public String edit(ModelMap model, @PathVariable("id") String id) {
        Session session = factory.getCurrentSession();
        Depart depart = (Depart) (session.get(Depart.class, id));

        model.addAttribute("pb", depart);
        model.addAttribute("pbs", getDeparts());
        return "depart/Departs";
    }

    @RequestMapping(params = "btninsert", method = RequestMethod.POST)
    public String insert(ModelMap model, @Validated @ModelAttribute("pb") Depart depart, BindingResult errors) {
        if (errors.hasErrors()) {
            model.addAttribute("message", "Vui lòng sửa các lỗi sau đây !");
            model.addAttribute("pbs", getDeparts());
            return "depart/Departs";
        } else {
//            model.addAttribute("message", "Chúc mừng, bạn đã nhập đúng !");
            Session session = factory.openSession();
            Transaction t = session.beginTransaction();
            try {
                session.save(depart);
                t.commit();
                model.addAttribute("message", "Thêm mới thành công !");
            } catch (Exception e) {
                t.rollback();
                model.addAttribute("message", "Thêm mới thất bại !");
            } finally {
                session.close();
            }
            return "redirect:depart.htm";
        }
    }

//    @RequestMapping(value = "/upload", method = RequestMethod.POST)
//    public String upload(ModelMap mm, HttpServletRequest request, HttpServletResponse response,
//            @RequestParam(value = "fileUpload", required = false) MultipartFile fileUpload, @ModelAttribute("nv") Staff staff) {
//        String path = request.getSession().getServletContext().getRealPath("/") + "files/";
//        if (fileUpload != null) {
//            try {
//                FileUtils.forceMkdir(new File(path));
//                File upload = new File(path + fileUpload.getOriginalFilename());
//                fileUpload.transferTo(upload);
//                mm.addAttribute("fileUpload", fileUpload.getOriginalFilename());
//            } catch (IOException ex) {
//                ex.printStackTrace();
//            }
//        }
//        return "staff/Staffs";
//    }
//
//    @RequestMapping(params = "btntruoc")
//    public String tang(ModelMap model, HttpServletRequest request, @ModelAttribute("nv") Staff staff) {
//        String sobd = request.getParameter("txtso1");
//        String sokt = request.getParameter("txtso2");
//        int sbd = Integer.parseInt(sobd);
//        int skt = Integer.parseInt(sokt);
//        sbd = sbd + 5;
//        Session session = factory.getCurrentSession();
//        String hql = "FROM Staff";
//        Query query = session.createQuery(hql);
//        query.setFirstResult(sbd);
//        query.setMaxResults(skt);
//        List<Staff> list = query.list();
//        model.addAttribute("staffs", list);
//        model.addAttribute("sobd", sbd);
//        model.addAttribute("sokt", skt);
//        return "staff/index";
//    }
//
//    @RequestMapping(params = "btnsau")
//    public String giam(ModelMap model, HttpServletRequest request, @ModelAttribute("nv") Staff staff) {
//        String sobd = request.getParameter("txtso1");
//        String sokt = request.getParameter("txtso2");
//        int sbd = Integer.parseInt(sobd);
//        int skt = Integer.parseInt(sokt);
//        sbd = sbd - 5;
//        Session session = factory.getCurrentSession();
//        String hql = "FROM Staff";
//        Query query = session.createQuery(hql);
//        query.setFirstResult(sbd);
//        query.setMaxResults(skt);
//        List<Staff> list = query.list();
//        model.addAttribute("staffs", list);
//        model.addAttribute("sobd", sbd);
//        model.addAttribute("sokt", skt);
//        return "staff/index";
//    }
//
//
    @RequestMapping(params = "btndelete")
    public String delete(ModelMap model, @ModelAttribute("pb") Depart depart) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            session.delete(depart);
            t.commit();
            model.addAttribute("message", "Xóa thành công !");
        } catch (Exception e) {
            t.rollback();
            model.addAttribute("message", "Xóa thất bại !");
        } finally {
            session.close();
        }

        return "redirect:depart.htm";
    }

    @RequestMapping(params = "btnupdate")
    public String update(ModelMap model, @ModelAttribute("pb") Depart depart) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            session.update(depart);
            t.commit();
            model.addAttribute("message", "Cập nhật thành công !");
        } catch (Exception e) {
            t.rollback();
            model.addAttribute("message", "Cập nhật thất bại !");
        } finally {
            session.close();
        }
        return "depart/Departs";
    }
}
