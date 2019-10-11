package pl.coderslab.charity.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.entity.Role;
import pl.coderslab.charity.entity.User;
import pl.coderslab.charity.repository.InstitutionRepository;
import pl.coderslab.charity.repository.RoleRepository;
import pl.coderslab.charity.repository.UserRepository;

import javax.validation.Valid;
import java.util.List;

@RequestMapping("/admin")
@Controller
@RequiredArgsConstructor
public class AdminController {

    private final InstitutionRepository institutionRepository;

    private final UserRepository userRepository;

    private final RoleRepository roleRepository;

    @ModelAttribute("institutions")
    public List<Institution> institutions() {
        return institutionRepository.findAll();
    }

    @ModelAttribute("users")
    public List<User> users() { return userRepository.findAll(); }

    @ModelAttribute("roles")
    public List<Role> roles() { return roleRepository.findAll(); }

    @ModelAttribute("admins")
    public List<User> admins() {
        Role role = roleRepository.findById(2);
        return userRepository.findUsersByRoles(role); }


    @GetMapping("/")
    public String adminPageShow() {
        return "admin/admin";
    }

    @GetMapping("/institutions")
    public String allInsPageShow() {
        return "admin/institutions";
    }


    //------INSTITUTIONS--------------

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

    //---------------USERS------------------

    @GetMapping("/users")
    public String allUsersPageShow() {
        return "admin/users";
    }

    @GetMapping("/user/add")
    public String userAdd(Model model) {
        model.addAttribute("user", new User());
        return "admin/userF";
    }

    @PostMapping("/user/add")
    public String userAddPost(@ModelAttribute @Valid User user,
                             BindingResult result) {
        if (result.hasErrors()) {
            return "admin/userF";
        }
        userRepository.save(user);
        return "redirect:/admin/users";
    }

    @GetMapping("/user/edit/{id}")
    public String userEdit(@PathVariable long id, Model model) {
        model.addAttribute("user", userRepository.findById(id));
        return "admin/userF";
    }

    @PostMapping("/user/edit/{id}")
    public String userEditPost(@ModelAttribute @Valid User user,
                              BindingResult result) {
        if (result.hasErrors()) {
            return "admin/userF";
        }
        userRepository.save(user);
        return "redirect:/admin/users";
    }

    @GetMapping("/user/delete/{id}")
    public String userDelete(@PathVariable long id) {
        User user = userRepository.findById(id);
        userRepository.delete(user);
        return "redirect:/admin/users";
    }

    //---------------ADMINS------------------

    @GetMapping("/admins")
    public String allAdminsPageShow() {
        return "admin/admins";
    }

}
