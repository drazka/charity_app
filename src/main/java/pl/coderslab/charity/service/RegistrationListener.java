package pl.coderslab.charity.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.MessageSource;
import org.springframework.mail.javamail.JavaMailSender;
import pl.coderslab.charity.entity.User;

import java.util.UUID;

public class RegistrationListener implements ApplicationListener<OnRegistrationCompleteEvent> {

    @Autowired
    private UserServiceImpl userService;

    @Autowired
    private MessageSource messageSource;

    @Autowired
    private JavaMailSender mailSender;

    @Override
    public void onApplicationEvent(OnRegistrationCompleteEvent onRegistrationCompleteEvent) {
        User user = onRegistrationCompleteEvent.getUserForm();
        String token = UUID.randomUUID().toString();
        userService.createVerificationToken(user, token);
    }
}
