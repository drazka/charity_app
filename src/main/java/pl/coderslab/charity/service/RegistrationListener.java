package pl.coderslab.charity.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.MessageSource;
import org.springframework.mail.SimpleMailMessage;
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

        String recipientAddress = user.getEmail();
        String subject = "REGISTRATION CONFIRMATION";
        String confirmationUrl = onRegistrationCompleteEvent.getAppUrl() +
                "/registrationConfirm.html?token=" + token;
        String message = messageSource
                .getMessage("message.regSucc",null, onRegistrationCompleteEvent.getLocale());

        SimpleMailMessage email = new SimpleMailMessage();
        email.setTo(recipientAddress);
        email.setSubject(subject);
        email.setText(message + "rn" + "http://localhost:8080" +confirmationUrl);
        mailSender.send(email);
    }
}
