package com.example.inventory_management_system.model.enums;

public enum Category {
    CATEGORY1("CAT1"),
    CATEGORY2("CAT2"),
    CATEGORY3("CAT3");

    private String name;
    private Category(String type) {
        name = type;
    }

    public String getName() {
        return name;
    }

    public static String getCategory(int index){
        return Category.values()[index].toString();
    }
}
