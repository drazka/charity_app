package pl.coderslab.charity.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.InstitutionRepository;

import java.util.List;


@Controller
public class HomeController {

    @Autowired
    InstitutionRepository institutionRepository;

    @Autowired
    DonationRepository donationRepository;

    @ModelAttribute("institutions")
    public List<Institution> institutions() {
        return institutionRepository.findAll();
    }

    @ModelAttribute("sumDonations")
    public int allDonation() {
        return donationRepository.sumDonation();
    }

    @ModelAttribute("countOfInstitutionsDonated")
    public int donatedInstitutions() {
        return donationRepository.countDistinctByInstitution();
    }


    @RequestMapping("/")
    public String homeAction(Model model){
        return "index";
    }

}
