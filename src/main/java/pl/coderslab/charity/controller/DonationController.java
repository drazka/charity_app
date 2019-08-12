package pl.coderslab.charity.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.entity.Category;
import pl.coderslab.charity.entity.Donation;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.entity.User;
import pl.coderslab.charity.repository.CategoryRepository;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.InstitutionRepository;
import pl.coderslab.charity.service.CurrentUser;

import javax.validation.Valid;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import java.util.Locale;

@Controller
@RequiredArgsConstructor
public class DonationController {

    private final DonationRepository donationRepository;

    private final CategoryRepository categoryRepository;

    private final InstitutionRepository institutionRepository;

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

    @PostMapping("/donation")
    public String formPost(@ModelAttribute @Valid Donation donation,
                           BindingResult result,@AuthenticationPrincipal CurrentUser currentUser){
        if (result.hasErrors()) {
            return "form";
        }
        User user = currentUser.getUser();
        donation.setUser(user);
        donation.getCategories().forEach(c->c.getDonations().add(donation));
        donationRepository.save(donation);
        return "form-confirmation";
    }

    @GetMapping("/donations")
    public String formGetUserDonation(Model model, @AuthenticationPrincipal CurrentUser currentUser){
        User user = currentUser.getUser();
        List<Donation> userDonations = donationRepository.findDonationByUser(user);
        model.addAttribute("userDonations", userDonations);
        return "donations";
    }

    @GetMapping("/donationDetails/{id}")
    public String donationGet(@PathVariable long id, Model model){
        model.addAttribute("donation", donationRepository.findById(id).get());
        return "donationDetails";
    }

    @GetMapping("/donationDetails/{id}/edit")
    public String givenGet(@PathVariable long id, Model model){
        model.addAttribute("donation", donationRepository.findById(id).get());
        return "donationDetailsEdit";
    }

    @PostMapping("/donationDetails/{id}/edit")
    public String givenPost(@ModelAttribute @Valid Donation donationNewData, @PathVariable long id, Model model,
                            @RequestParam("givenD") String ldt) throws ParseException {
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date date = format.parse(ldt);
        Donation donation = donationRepository.findById(id).get();
        donation.setGivenDate(date);
        donation.setGiven(donationNewData.isGiven());
        donationRepository.save(donation);
        model.addAttribute("donation", donation);
        return "donationDetails";
    }
}

