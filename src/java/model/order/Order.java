/*
 * Serialized class that transfer in between the server and the client
 */
package model.order;

import java.io.Serializable;
import model.product.PurchasedItem;
import model.user.User;

/**
 *
 * @author Wilson
 */
public class Order implements Serializable {
    private int orderId;
    private User user;
    private java.sql.Timestamp placeTime;
    private PurchasedItem[] purchasedItems;
    private float total;

    public User getUser() {
        return user;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public int getOrderId() {
        return orderId;
    }

    public User getCustomer() {
        return user;
    }

    public java.sql.Timestamp getPlaceTime() {
        return placeTime;
    }

    public PurchasedItem[] getPurchasedItems() {
        return purchasedItems;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public void setPlaceTime(java.sql.Timestamp placeTime) {
        this.placeTime = placeTime;
    }

    public void setPurchasedItems(PurchasedItem[] purchasedItems) {
        this.purchasedItems = purchasedItems;
    }
}
