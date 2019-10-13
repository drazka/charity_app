package pl.coderslab.charity.service;


import org.springframework.context.ApplicationEvent;
import pl.coderslab.charity.entity.User;

import java.util.Locale;

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

    public String getAppUrl() {
        return appUrl;
    }

    public void setAppUrl(String appUrl) {
        this.appUrl = appUrl;
    }

    public Locale getLocale() {
        return locale;
    }

    public void setLocale(Locale locale) {
        this.locale = locale;
    }

    public User getUserForm() {
        return userForm;
    }

    public void setUserForm(User userForm) {
        this.userForm = userForm;
    }
}
