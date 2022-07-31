package com.example.inventory_management_system.model;
import com.example.inventory_management_system.model.enums.AccessType;
import javax.persistence.Entity;

@Entity
public class Admin extends User{

    public Admin() {
        super();
    }

    public Admin(String username, String password) {
        super(username, password);
        this.setUserType(AccessType.ADMIN);
    }
}
