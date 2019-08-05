package pl.coderslab.charity.service;

import pl.coderslab.charity.entity.User;

public interface UserService {
    User findByUsername(String username);

    void save(User user);

    boolean checkIfValidOldPassword(User user, String password);

    void changeUserPassword(User user, String password);
}
