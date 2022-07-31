package com.example.inventory_management_system.model;
import com.example.inventory_management_system.model.enums.AccessType;
import javax.persistence.Entity;

@Entity
public class Client extends User{

    public Client() {
        super();
    }

    public Client(String username, String password) {
        super(username, password);
        this.setUserType(AccessType.CLIENT);
    }
}
