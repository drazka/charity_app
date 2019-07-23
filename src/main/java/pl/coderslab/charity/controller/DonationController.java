package pl.coderslab.charity.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import pl.coderslab.charity.entity.Category;
import pl.coderslab.charity.entity.Donation;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.repository.CategoryRepository;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.InstitutionRepository;

import java.util.List;

@Controller
public class DonationController {

    @Autowired
    DonationRepository donationRepository;

    @Autowired
    CategoryRepository categoryRepository;

    @Autowired
    InstitutionRepository institutionRepository;

    @ModelAttribute("categories")
    public List <Category> getCategories() {
        return categoryRepository.findAll();
    }

    @ModelAttribute("institutions")
    public List<Institution> institutions() {
        return institutionRepository.findAll();
    }


    @GetMapping("/donation")
    public String formGet(Model model){
        model.addAttribute("donation", new Donation());
        return "form";
    }
}

