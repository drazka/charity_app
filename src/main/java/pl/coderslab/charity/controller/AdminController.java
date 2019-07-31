package pl.coderslab.charity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin")
@Controller
public class AdminController {

    @GetMapping("/")
    public String adminPageShow() {
        return "admin/admin"; }

    @GetMapping("/institutions")
    public String allInsPageShow() {
        return "admin/institutions"; }
}
