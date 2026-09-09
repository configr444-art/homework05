package test4.work.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import test4.work.entity.User;

public interface UserRepository
        extends JpaRepository<User, Integer> {

    @Query("""
        SELECT u
        FROM User u
        WHERE LOWER(u.username)
              LIKE LOWER(CONCAT('%', :keyword, '%'))
           OR LOWER(u.fullName)
              LIKE LOWER(CONCAT('%', :keyword, '%'))
           OR LOWER(u.email)
              LIKE LOWER(CONCAT('%', :keyword, '%'))
    """)
    List<User> search(
            @Param("keyword") String keyword);
}