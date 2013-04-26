/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.cart;

import model.user.User;

/**
 *
 * @author Zhengyi
 */
public class Cart {
    private User user;
    private float total;
    private String currency;
    
    public Cart () {
        user = null;
        total = 0.00f;
        currency = "$";
    }

    public String getTotal() {
        return currency + total;
    }

    public User getUser() {
        return user;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getCurrency() {
        return currency;
    }
}
