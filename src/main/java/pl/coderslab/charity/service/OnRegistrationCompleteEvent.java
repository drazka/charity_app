package pl.coderslab.charity.service;


import lombok.Data;
import org.springframework.context.ApplicationEvent;
import pl.coderslab.charity.entity.User;

import java.util.Locale;


@Data
//@RequiredArgsConstructor
public class OnRegistrationCompleteEvent extends ApplicationEvent {

    private String appUrl;
    private Locale locale;
    private User userForm;

    public OnRegistrationCompleteEvent(User userForm, Locale locale, String appUrl) {
        super(userForm);

        this.userForm = userForm;
        this.locale = locale;
        this.appUrl = appUrl;
    }

}
