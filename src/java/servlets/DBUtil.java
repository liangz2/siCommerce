/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import com.caucho.hessian.server.HessianServlet;
import controller.RemoteDBUtil;
import database.ConnectionPool;
import java.sql.*;
import java.util.Calendar;
import model.cart.Cart;
import model.order.Order;
import model.product.Product;
import model.user.User;

/**
 *
 * @author Zhengyi
 */
public class DBUtil extends HessianServlet implements RemoteDBUtil {
    private ConnectionPool pool = ConnectionPool.getInstance();
    @Override
    public Product[] getProductList() {
        String query = "SELECT * FROM products as p, products_description as ps"
                + " WHERE p.products_id = ps.products_id and p.products_id ORDER"
                + " BY products_model ASC";
        ResultSet result = null;
        Connection connection = null;
        Statement statment = null;
        int i = 0;
        Product[] products = null;
        // create the list
        
        try {
            connection = pool.getConnection();
            statment = connection.createStatement();
            result = statment.executeQuery(query);
            result.last();
            products = new Product[result.getRow()];
            result.beforeFirst();
            // start looping through the result
            while (result.next()) {
                Product p = new Product();
                p.setId(result.getShort("products_id"));
                java.sql.Timestamp timeAdded 
                        = result.getTimestamp("products_date_added");
                p.setDateAdded(timeAdded.toString());
                p.setPrice(result.getFloat("products_price"));
                p.setImage(result.getString("products_image"));
                p.setQuantity(result.getShort("products_quantity"));
                p.setWeight(result.getFloat("products_weight"));
                p.setStatus(result.getBoolean("products_status"));
                p.setModel(result.getString("products_model"));
                p.setName(result.getString("products_name"));
                products[i++] = p;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            finalize(result, statment, null, connection);
            return products;
        }
    }
    
    @Override
    public User getCustomer(String email, String password) {
        String query = "SELECT * FROM customers WHERE customers_email_address=? AND "
                + "password=?";
        
        PreparedStatement ps = null;
        User user = null;
        
        return user;
    }

    @Override
    public boolean registerCustomer(User user) {
        boolean success = false;
        String query = "SELECT customers_id FROM customers "
                + "WHERE customers_email_address=?";
        String register = "INSERT INTO customers "
                + "(customers_firstname, customers_lastname, customers_email_address, "
                + "customers_telephone, customers_password) values "
                + "(?, ?, ?, ?, ?)";
        PreparedStatement ps = null;
        ResultSet result = null;
        Connection connection = null;
        try {
            connection = pool.getConnection();
            ps = connection.prepareStatement(query);
            ps.setString(1, user.getEmail());
            result = ps.executeQuery();
            if (!result.next()) {
                // reinitialize PreparedStatement
                ps = connection.prepareCall(register);
                ps.setString(1, user.getFirstName());
                ps.setString(2, user.getLastName());
                ps.setString(3, user.getEmail());
                ps.setString(4, user.getPhoneNum());
                ps.setString(5, "123456");
                // insert new costomer
                success = ps.execute();
            }
        } catch (SQLException ex) {
            success = false;
        } finally {
            finalize(result, null, ps, connection);
            return success;
        }
    }

    @Override
    public Cart getShoppingCart(int userId) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
    @Override
    public Order getOrder(int invoiceNum) {
        return null;
    }

    @Override
    public boolean placeOrder(Order order) {
        boolean success = false;
        String placeOrder = "INSERT INTO purchases values (?, ?, ?, ?)";
        PreparedStatement ps = null;
        Connection connection = null;
        
        try {
            connection = pool.getConnection();
            ps = connection.prepareStatement(placeOrder);
            ps.setInt(1, order.getCustomer().getId());
            Calendar calendar = Calendar.getInstance();
            ps.setTimestamp(2, order.getPlaceTime());
            ps.setInt(3, 2);
            ps.setFloat(4, order.getTotal());
            
            success = ps.execute();
        } catch (SQLException ex) {
            
        } finally {
            finalize(null, null, ps, connection);
            return success;
        }
    }
    
    @Override
    public boolean addUser(User user) {
        return false;
    }
    
    /**
     * 
     * @param username
     * @param password
     * @return 
     */
    @Override
    public User getSalesPerson(String username, String password) {
        String query = "SELECT * FROM employees WHERE username=? AND "
                + "password=?";
        PreparedStatement ps = null;
        User user = null;
        Connection connection = null;
        ResultSet result = null;
        
        connection = pool.getConnection();
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            
            result = ps.executeQuery();
            if (result.next()) {
                user = new User();
                user.setFirstName(result.getString("firstname"));
                user.setLastName(result.getString("lastname"));
                user.setRank(result.getInt("rank"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            finalize(result, ps, null, connection);
            return user;
        }
    }

    @Override
    public Product getProductById(int pId) {
        String query = "SELECT * FROM Products as p, Products_description as ps"
                + " WHERE p.products_id = ps.products_id and p.products_id=" + pId;
        ResultSet result = null;
        Connection connection = null;
        Statement statment = null;
        Product p = new Product();
        
        try {
            connection = pool.getConnection();
            statment = connection.createStatement();
            result = statment.executeQuery(query);
            if (result.next()) {
                p.setId(result.getShort("products_id"));
                java.sql.Timestamp timeAdded 
                        = result.getTimestamp("products_date_added");
                p.setDateAdded(timeAdded.toString());
                p.setPrice(result.getFloat("products_price"));
                p.setImage(result.getString("products_image"));
                p.setQuantity(result.getShort("products_quantity"));
                p.setWeight(result.getFloat("products_weight"));
                p.setStatus(result.getBoolean("products_status"));
                p.setModel(result.getString("products_model"));
                p.setName(result.getString("products_name"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            finalize(result, statment, null, connection);
            return p;
        }
    }
    
    /**
     * 
     * @param model
     * @return 
     */
    @Override
    public Product getProductByModel(String model) {
        String query = "SELECT products_model, products_price, products_name "
                + "FROM products, products_description WHERE products.products_id"
                + "=products_description.products_id AND products_model='" + model + "'";
        ResultSet result = null;
        Statement statement = null;
        Connection connection = null;
        Product p = null;
        try {
            connection = pool.getConnection();
            statement = connection.createStatement();
            result = statement.executeQuery(query);
            if (result.next()) {
                p = new Product();
                p.setModel(result.getString("products_model"));
                p.setPrice(result.getFloat("products_price"));
                p.setName(result.getString("products_name"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            finalize(result, statement, null, connection);
            return p;
        }
    }
    
    /**
     * 
     * @param product
     * @return 
     */
    @Override
    public boolean updateProduct(Product product) {
        boolean success = false;
        String updateProduct = "UPDATE products SET products_quantity=?, products_price=?, "
                + "products_model=?, products_last_modified=Now(), products_weight=?,"
                + "products_status=? WHERE products_id=?";
        String updateProductDescription = "UPDATE products_description SET products_name=?"
                + " WHERE products_id=?";
        PreparedStatement ps = null;
        Connection connection = pool.getConnection();
        
        try {
            int pId = product.getId();
            ps = connection.prepareStatement(updateProduct);
            // setup statement
            ps.setShort(1, product.getQuantity());
            ps.setFloat(2, product.getPrice());
            ps.setString(3, product.getModel());
            ps.setFloat(4, product.getWeight());
            ps.setBoolean(5, product.getStatus());
            ps.setInt(6, pId);
            // execute products table update
            ps.executeUpdate();
            // execute products_description table update
            ps = connection.prepareStatement(updateProductDescription);
            ps.setString(1, product.getName());
            ps.setInt(2, pId);
            ps.executeUpdate();
            // set success
            success = true;
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            finalize(null, null, ps, connection);
            return success;
        }
    }
    
    /**
     * 
     * @param pId
     * @return 
     */
    @Override
    public boolean removeProduct(int pId) {
        boolean success = false;
        String removeProduct = "DELETE FROM products WHERE products_id=" + pId;
        String removeProductDescription = "DELETE FROM products_description "
                + "WHERE products_id=" + pId;
        Statement statement = null;
        Connection connection = pool.getConnection();
        try {
            statement = connection.createStatement();
            statement.execute(removeProduct);
            statement.execute(removeProductDescription);
            success = true;
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            finalize(null, statement, null, connection);
            return success;
        }
    }
    /**
     * 
     * @param product
     * @return 
     */
    @Override
    public Object addProduct(Product product) {
        String error = "";
        String getId = "SELECT MAX(products_id)+1 FROM products";
        String addProduct = "INSERT INTO products (products_id, products_quantity, "
                + "products_model, products_price, products_date_added, "
                + "products_weight, products_status, products_tax_class_id, "
                + "products_ordered, products_featured) VALUES (?, ?, ?, ?, Now(), ?,"
                + "?, ?, ?, ?)";
        String addProductDescription = "INSERT INTO products_description "
                + "(products_id, language_id, products_name) VALUES (?, 1, ?)";
        String findProduct = "SELECT products_id FROM products WHERE "
                + "products_model=?";
        Statement statement = null;
        PreparedStatement ps = null;
        Connection connection = pool.getConnection();
        ResultSet result = null;
        int nextId = 0;
        
        try {
            statement = connection.createStatement();
            ps = connection.prepareStatement(findProduct);
            ps.setString(1, product.getModel());
            result = ps.executeQuery();
            if (result.next()) {
                error = "Product already exists, please refresh the product table";
            } else {
                // get next product id
                result = statement.executeQuery(getId);
                if (result.next()) {
                    nextId = result.getInt(1);
                }
                // sets the id of product
                product.setId(nextId);
                // adding into the product table
                ps = connection.prepareStatement(addProduct);
                ps.setInt(1, nextId);
                ps.setShort(2, product.getQuantity());
                ps.setString(3, product.getModel());
                ps.setFloat(4, product.getPrice());
                ps.setFloat(5, product.getWeight());
                ps.setBoolean(6, product.getStatus());
                ps.setInt(7, 1);
                ps.setInt(8, 0);
                ps.setInt(9, 0);
                // execute the statement
                ps.executeUpdate();
                // adding into the product description table
                ps = connection.prepareStatement(addProductDescription);
                ps.setInt(1, nextId);
                ps.setString(2, product.getName());
                // execute the statement
                ps.executeUpdate();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            finalize(result, statement, ps, connection);
            if (!error.isEmpty()) {
                return error;
            }
            else {
                return getProductById(nextId);
            }
        }
    }
    /**
     * 
     * @param model
     * @return 
     */
    @Override
    public Product[] getProductsByModel(String model) {
        Product[] products = null;
        String query = "SELECT products_model, products_price, products_name "
                + "FROM products, products_description WHERE products.products_id"
                + "=products_description.products_id AND products_model like '" + model + "%'";
        Statement statement = null;
        Connection connection = null;
        ResultSet rs = null;
        try {
            connection = pool.getConnection();
            statement = connection.createStatement();
            rs = statement.executeQuery(query);
        } catch (SQLException ex) {
            
        }
        return products;
    }
    /**
     * 
     * @param r
     * @param s
     * @param c 
     */
    private void finalize(ResultSet r, 
            Statement s, 
            PreparedStatement ps,
            Connection c) {
        try {
            if (r != null) {
                r.close();
            }
            if (s != null) {
                s.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (c != null) {
                pool.freeConnection(c);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
