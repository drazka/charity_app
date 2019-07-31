package pl.coderslab.charity.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.repository.InstitutionRepository;

import javax.validation.Valid;
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
        return "admin/admin";
    }

    @GetMapping("/institutions")
    public String allInsPageShow() {
        return "admin/institutions";
    }

    @PostMapping("/institutions")
    public String deletePageShow() {
        return "admin/institutions/1";
    }

    @GetMapping("/institution/add")
    public String insAdd(Model model) {
        model.addAttribute("institution", new Institution());
        return "admin/institutionF";
    }

    @PostMapping("/institution/add")
    public String insAddPost(@ModelAttribute @Valid Institution institution,
                             BindingResult result) {
        if (result.hasErrors()) {
            return "admin/institutionF";
        }
        institutionRepository.save(institution);
        return "redirect:/admin/institutions";
    }

    @GetMapping("/institution/edit/{id}")
    public String insEdit(@PathVariable long id, Model model) {
        model.addAttribute("institution", institutionRepository.findById(id));
        return "admin/institutionF";
    }

    @PostMapping("/institution/edit/{id}")
    public String insEditPost(@ModelAttribute @Valid Institution institution,
                             BindingResult result) {
        if (result.hasErrors()) {
            return "admin/institutionF";
        }
        institutionRepository.save(institution);
        return "redirect:/admin/institutions";
    }

    @GetMapping("/institution/delete/{id}")
    public String insDelete(@PathVariable long id) {
        Institution institution = institutionRepository.findById(id).get();
        institutionRepository.delete(institution);
        return "redirect:/admin/institutions";
    }


}
