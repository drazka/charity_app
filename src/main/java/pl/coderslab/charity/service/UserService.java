package pl.coderslab.charity.service;

import pl.coderslab.charity.entity.User;
import pl.coderslab.charity.entity.VerificationToken;

public interface UserService {
    User findByUsername(String username);

    void save(User user);

    boolean checkIfValidOldPassword(User user, String password);

    void changeUserPassword(User user, String password);

    void createVerificationToken(User user, String token);

    VerificationToken getVerificationToken(String VerificationToken);
}
