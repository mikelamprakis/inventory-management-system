package com.example.inventory_management_system.model;
import java.math.BigDecimal;


public class ItemOrder {

    private int itemId;
    private String itemTitle;
    private int itemQuantity;
    private BigDecimal itemOrderCost;

    public ItemOrder() {
    }

    public ItemOrder(int itemId, String itemTitle, int itemQuantity, BigDecimal itemOrderCost) {
        this.itemId = itemId;
        this.itemTitle = itemTitle;
        this.itemQuantity = itemQuantity;
        this.itemOrderCost = itemOrderCost;
    }

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public String getItemTitle() {
        return itemTitle;
    }

    public void setItemTitle(String itemTitle) {
        this.itemTitle = itemTitle;
    }

    public int getItemQuantity() {
        return itemQuantity;
    }

    public void setItemQuantity(int itemQuantity) {
        this.itemQuantity = itemQuantity;
    }

    public BigDecimal getItemOrderCost() {
        return itemOrderCost;
    }

    public void setItemOrderCost(BigDecimal itemOrderCost) {
        this.itemOrderCost = itemOrderCost;
    }

    @Override
    public String toString() {
        return "ItemOrder{" +
                "itemId=" + itemId +
                ", itemTitle='" + itemTitle + '\'' +
                ", itemQuantity=" + itemQuantity +
                ", itemOrderCost=" + itemOrderCost +
                '}';
    }
}
