/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.project.admin.controller;

import com.project.admin.service.CheckinService;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author NIKIL
 */
@Controller
@RequestMapping(value="/admin/checkin")
public class CheckinController {
    
    @Autowired
    private CheckinService checkinService;
    @RequestMapping(method = RequestMethod.GET)
    public String index(ModelMap map) throws SQLException {
        map.addAttribute("Checkin", checkinService.getALL());
        return "admin/checkin/index";
    }
    @RequestMapping(method = RequestMethod.GET, value = "/logout")
    public String Logout(HttpServletRequest req, HttpServletResponse resp){
        HttpSession session = req.getSession(false);
        String checking =(String) session.getAttribute("username");
        if(checking == null){
            return "redirect:/?logout=false";
        }else{
            session.invalidate();
            return "redirect:/admin";
        }
        }
    
}
