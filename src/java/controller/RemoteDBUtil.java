/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import model.cart.Cart;
import model.order.Order;
import model.product.Product;
import model.user.User;

/**
 *
 * @author Icewill
 */
public interface RemoteDBUtil {
    public Product[] getProductList();
    public User getCustomer(String email, String password);
    public boolean addUser(User user);
    public boolean registerCustomer(User user);
    public Cart getShoppingCart(int userId);
    public User getSalesPerson(String username, String password);
    public Order getOrder(int invoice);
    public Product getProductByModel(String model);
    public Product getProductById(int pId);
    public Product[] getProductsByModel(String model);
    public boolean placeOrder(Order order);
    public boolean updateProduct(Product product);
    public boolean removeProduct(int pId);
    public Object addProduct(Product product);
}
