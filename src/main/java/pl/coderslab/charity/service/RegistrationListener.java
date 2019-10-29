package pl.coderslab.charity.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.MessageSource;
import org.springframework.core.env.Environment;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;
import pl.coderslab.charity.entity.User;

import java.util.UUID;

@Component
//@RequiredArgsConstructor
public class RegistrationListener implements ApplicationListener<OnRegistrationCompleteEvent> {

    @Autowired
    private UserService userService;

    @Autowired
    private MessageSource messageSource;

    @Autowired
    private Environment env;

    @Autowired
    private JavaMailSender mailSender;

    @Override
    public void onApplicationEvent(OnRegistrationCompleteEvent event) {
        this.confirmRegistration(event);
    }


    private void confirmRegistration(final OnRegistrationCompleteEvent event) {
        User user = event.getUserForm();
        String token = UUID.randomUUID().toString();
        userService.createVerificationToken(user, token);

        String recipientAddress = user.getEmail();
        String subject = "REGISTRATION CONFIRMATION";
        String confirmationUrl = event.getAppUrl() +
                "/registrationConfirm?token=" + token;
        String message = messageSource
                .getMessage("message.regSucc",null, event.getLocale());

        SimpleMailMessage email = new SimpleMailMessage();
        email.setTo(recipientAddress);
        email.setSubject(subject);
        email.setText(message + " " + "http://localhost:8080" +confirmationUrl);
        email.setFrom(env.getProperty("support.email"));
        mailSender.send(email);
    }
}
