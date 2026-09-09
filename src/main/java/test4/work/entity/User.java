package test4.work.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "Users")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "UserId")
    private Integer userId;

    @Column(
        name = "Username",
        nullable = false,
        unique = true,
        length = 50
    )
    private String username;

    @Column(
        name = "Password",
        nullable = false,
        length = 255
    )
    private String password;

    @Column(name = "FullName", length = 100)
    private String fullName;

    @Column(name = "Email", length = 100)
    private String email;

    @Column(name = "Phone", length = 20)
    private String phone;

    @Column(name = "Avatar", length = 255)
    private String avatar;

    @Column(name = "RoleId")
    private Integer roleId = 2;

    @Column(name = "Status")
    private Integer status = 1;
}