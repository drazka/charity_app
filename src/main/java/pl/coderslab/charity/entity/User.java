package pl.coderslab.charity.entity;

import lombok.Data;
import lombok.ToString;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import java.util.Set;

@Entity
@Data
@Table(name = "user")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String firstName;

    private String lastName;

    @NotEmpty
    private String username;

    private String email;

    private String password;

    @Transient
    private String passwordConfirm;

    @ManyToMany
    private Set<Role> roles;

    private boolean enabled;

    @ToString.Exclude
    @OneToMany(mappedBy = "user")
    private Set<Donation> donations;

//    @OneToOne(mappedBy = "user")
//    private VerificationToken verificationToken;

    public User() {
        super();
        this.enabled=false;
    }

}
