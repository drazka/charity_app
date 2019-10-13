package pl.coderslab.charity.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
import pl.coderslab.charity.entity.User;
import pl.coderslab.charity.repository.UserRepository;
import pl.coderslab.charity.service.CurrentUser;
import pl.coderslab.charity.service.OnRegistrationCompleteEvent;
import pl.coderslab.charity.service.SecurityService;
import pl.coderslab.charity.service.UserService;
import pl.coderslab.charity.validator.UserValidator;

import javax.jws.WebResult;
import javax.validation.Valid;


@Controller
@RequiredArgsConstructor
public class UserController {

    private final UserValidator userValidator;

    private final UserService userService;

    private final SecurityService securityService;

    private final UserRepository userRepository;

    private final ApplicationEventPublisher eventPublisher;

    @GetMapping("/register")
    public String registerPageShow(Model model) {
        model.addAttribute("userForm", new User());
        return "register";
    }

    @PostMapping("/register")
    public String registerPagePost(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, WebRequest request) {
        userValidator.validate(userForm, bindingResult);
        if (bindingResult.hasErrors()) {
            return "register";
        }
        userService.save(userForm);
        securityService.autoLogin(userForm.getUsername(), userForm.getPasswordConfirm());

        try {
            String appUrl = request.getContextPath();
            eventPublisher.publishEvent(new OnRegistrationCompleteEvent
                    (userForm, request.getLocale(), appUrl));
        } catch (Exception me) {
            return "register";
        }
        return "redirect:/donation";
    }

    @GetMapping("/profil")
    public String profilPageShow(Model model, @AuthenticationPrincipal CurrentUser currentUser) {
        User entityUser = currentUser.getUser();
        model.addAttribute("user", entityUser);
        System.out.println(currentUser.getUser().getId());
        System.out.println(entityUser.getId());
        return "profil";
    }

    @PostMapping("/profil")
    public String profilPost(@ModelAttribute @Valid User user,
                             BindingResult result,@AuthenticationPrincipal CurrentUser currentUser) {
        userValidator.validateUsername(user, result);
        if (result.hasErrors()) {
            return "login";
        }
        String userPass = currentUser.getUser().getPassword();
        user.setPassword(userPass);
        userRepository.save(user);
        //TODO weryfikacja username
        return "redirect:/logout";
    }


    @GetMapping("/password")
    public String changePass(Model model,@AuthenticationPrincipal CurrentUser currentUser) {
        User entityUser = currentUser.getUser();
        model.addAttribute("user", entityUser);
        return "password";
    }

    @PostMapping("/password")
    public String changePassPost(@ModelAttribute @Valid User user,
                                 BindingResult result,
                                 @AuthenticationPrincipal CurrentUser currentUser,
                                 @RequestParam("oldPassword") String oldPassword) {

        if (!userService.checkIfValidOldPassword(currentUser.getUser(), oldPassword)) {
            return "password";
        }
        userValidator.validatePassword(user, result);
        userService.changeUserPassword(currentUser.getUser(),user.getPassword());
        //TODO walidacja hasła

        return "redirect:/logout";

    }
}
