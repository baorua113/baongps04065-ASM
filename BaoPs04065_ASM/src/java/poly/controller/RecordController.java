/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package poly.controller;

import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import poly.entity.Depart;
import poly.entity.Record;
import poly.entity.Staff;

/**
 *
 * @author GiaBao
 */
@Transactional
@Controller
@RequestMapping("/record/")
public class RecordController {

    @Autowired
    SessionFactory factory;

//    @RequestMapping(value = "insert", method = RequestMethod.GET)
//    public String insert(ModelMap model) {
//        model.addAttribute("record", new Record());
//        return "record/insert_1";
//    }
//
    @RequestMapping(value = "insert", method = RequestMethod.POST)
    public String insert(ModelMap model, @ModelAttribute("record") Record record) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            record.setDate(new Date());
            session.save(record);
            t.commit();
            model.addAttribute("message", "Thêm mới thành công !");
        } catch (Exception e) {
            t.rollback();
            model.addAttribute("message", "Thêm mới thất bại !");
        } finally {
            session.close();
        }
        return "record/insert";
    }

    @ModelAttribute("departs")
    public List<Depart> getDeparts() {
        Session session = factory.getCurrentSession();
        String hql = "FROM Depart";
        Query query = session.createQuery(hql);
        List<Depart> list = query.list();
        return list;
    }

    @RequestMapping("show")
    public String show(ModelMap model) {
        model.addAttribute("record", new Record());
        return "record/insert";
    }

    @RequestMapping("layds")
    public String layds(ModelMap model, HttpServletRequest request, @ModelAttribute("record") Record record) {
        String mapb = request.getParameter("txtmapb");
        Session session = factory.getCurrentSession();
        String hql = "FROM Staff WHERE depart.id = ?";
        Query query = session.createQuery(hql);
        query.setString(0, mapb);
        List<Staff> list = query.list();
        model.addAttribute("staff", list);
        return "record/insert";
    }
}
