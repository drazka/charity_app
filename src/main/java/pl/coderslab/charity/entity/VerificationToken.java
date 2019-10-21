package pl.coderslab.charity.entity;

import lombok.Data;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;

@Entity
@Data
//@RequiredArgsConstructor
public class VerificationToken {
    private static final int EXPIRATION = 60 * 24;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String token;

    @OneToOne//(fetch = FetchType.EAGER)
    //@JoinColumn(nullable = false, name = "id")
    private User user;

    @Column(name = "expiryDate")
    private Date expiryDate;


//    public VerificationToken(String token, User user, Date expiryDate) {
//        this.token = token;
//        this.user = user;
//        this.expiryDate = expiryDate;
//    }

    public VerificationToken(String token, User user) {
        this.token = token;
        this.user = user;

    }

    private Date calculateExpiryDate(int expiryTimeInMinutes) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(new Timestamp(cal.getTime().getTime()));
        cal.add(Calendar.MINUTE, expiryTimeInMinutes);
        return new Date(cal.getTime().getTime());
    }

    @PrePersist
    public void prePersist() {
        expiryDate = calculateExpiryDate(EXPIRATION);
    }
}
