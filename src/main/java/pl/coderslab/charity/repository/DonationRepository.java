package pl.coderslab.charity.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import pl.coderslab.charity.entity.Donation;
import pl.coderslab.charity.entity.User;

import java.util.List;

@Repository
public interface DonationRepository extends JpaRepository<Donation, Long> {

    @Query("SELECT SUM(d.quantity) from Donation d")
    int sumDonation();

    @Query("SELECT count (distinct d.institution) from Donation d")
    int countDistinctByInstitution();

    List<Donation> findDonationByUser(User user);

    //List<Donation> findDonationByUser();
}
