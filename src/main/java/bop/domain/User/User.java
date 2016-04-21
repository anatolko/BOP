package bop.domain.user;



import bop.domain.Plant;
import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.io.Serializable;

@Entity
@Table(name = "users")
public class User implements Serializable {

    private static final long serialVersionUID = 5402151523535598251L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int id;

    @NotNull
    @Column(name = "first_name")
    private String firstName;

    @NotNull
    @Column(name = "last_name")
    private String lastName;

    @NotNull
    @Column(name = "ad_account")
    private String adAccount;

    @NotNull
    @ManyToOne
    @JoinColumn(name="user_department_id")
    private UserDepartment userDepartment;

    @ManyToOne
    @JoinColumn(name="user_group_id")
    private UserGroup userGroup;

    @NotNull
    @ManyToOne
    @JoinColumn(name="plant_id")
    private Plant plant;
    
    @NotNull
    @Column(name = "email")
    private String email;

    @NotNull
    @ManyToOne
    @JoinColumn(name="role_id",referencedColumnName = "id")
    private UserRole userRole;
    
    @NotNull
    @Column(name = "passhash")
    @JsonIgnore
    private String passHash;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getAdAccount() {
        return adAccount;
    }

    public void setAdAccount(String adAccount) {
        this.adAccount = adAccount;
    }

    public UserDepartment getUserDepartment() {
        return userDepartment;
    }

    public void setUserDepartment(UserDepartment userDepartment) {
        this.userDepartment = userDepartment;
    }

    public UserGroup getUserGroup() {
        return userGroup;
    }

    public void setUserGroup(UserGroup userGroup) {
        this.userGroup = userGroup;
    }

    public Plant getPlant() {
        return plant;
    }

    public void setPlant(Plant plant) {
        this.plant = plant;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public UserRole getUserRole() {
        return userRole;
    }

    public void setUserRole(UserRole userRole) {
        this.userRole = userRole;
    }

    public String getPassHash() {
        return passHash;
    }

    public void setPassHash(String passHash) {
        this.passHash = passHash;
    }
}
