package com.example.inventory_management_system.model.enums;

public enum AccessType {
    ADMIN("ADMIN"),
    CLIENT("CLIENT");

    private String name;
    private AccessType(String type) {
        name = type;
    }

    public String getName() {
        return name;
    }

    public static String getAccessType(int index){
        return AccessType.values()[index].toString();
    }

}
