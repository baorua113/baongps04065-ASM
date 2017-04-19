/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package poly.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 *
 * @author GiaBao
 */
@Controller
@RequestMapping("/home/")
public class Main {
    @RequestMapping("index")
    public String index(){
        return "index_1";
    }
}
