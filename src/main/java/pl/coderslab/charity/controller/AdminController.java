package pl.coderslab.charity.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.repository.InstitutionRepository;

import java.util.List;

@RequestMapping("/admin")
@Controller
public class AdminController {

    @Autowired
    InstitutionRepository institutionRepository;

    @ModelAttribute("institutions")
    public List<Institution> institutions() {
        return institutionRepository.findAll();
    }

    @GetMapping("/")
    public String adminPageShow() {
        return "admin/admin"; }

    @GetMapping("/institutions")
    public String allInsPageShow() {
        return "admin/institutions"; }
}
