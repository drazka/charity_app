package pl.coderslab.charity.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.charity.entity.User;
import pl.coderslab.charity.service.CurrentUser;
import pl.coderslab.charity.service.SecurityService;
import pl.coderslab.charity.service.UserService;
import pl.coderslab.charity.validator.UserValidator;

import javax.validation.Valid;


@Controller
public class UserController {

    @Autowired
    private UserValidator userValidator;

    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/register")
    public String registerPageShow(Model model) {
        model.addAttribute("userForm", new User());
        return "register"; }

    @PostMapping("/register")
    public String registerPagePost(@ModelAttribute("userForm") User userForm, BindingResult bindingResult) {
        userValidator.validate(userForm, bindingResult);
        if( bindingResult.hasErrors()) {
            return "register";
        }

        userService.save(userForm);
        securityService.autoLogin(userForm.getUsername(), userForm.getPasswordConfirm());
        return "redirect:/donation"; }

    @GetMapping("/profil")
    public String profilPageShow(Model model, @AuthenticationPrincipal CurrentUser currentUser) {
        User entityUser = currentUser.getUser();
        model.addAttribute("user", entityUser);
        return "profil"; }

    @PostMapping("/profil")
    public String profilPost(@ModelAttribute @Valid User user,
                             BindingResult result) {
        userValidator.validateUsername(user, result);
        if(result.hasErrors()) {
            return "login";
        }
        userService.save(user);
        return "index"; }

}
