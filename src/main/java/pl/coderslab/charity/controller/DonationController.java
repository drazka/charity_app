package pl.coderslab.charity.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import pl.coderslab.charity.repository.CategoryRepository;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.InstitutionRepository;

@Controller
public class DonationController {

    @Autowired
    DonationRepository donationRepository;

    @Autowired
    CategoryRepository categoryRepository;

    @Autowired
    InstitutionRepository institutionRepository;
}
