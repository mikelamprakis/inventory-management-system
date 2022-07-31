package com.example.inventory_management_system.model.enums;

public enum OrderStatus {
    OPEN("OPEN"),
    SUBMITTED("SUBMITTED"),
    DISPATCHED("DISPATCHED");

    private String name;
    private OrderStatus(String type) {
        name = type;
    }

    public String getName() {
        return name;
    }

    public static String getOrderStatus(int index){
        return Category.values()[index].toString();
    }
}
