/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.product;

/**
 *
 * @author Wilson
 */
public class NewPurchase {
    String model;
    String quantity;
    String description;
    String listPrice;
    String unitPrice;
    String total;
    String dateCode;
    String notes;
    
    public NewPurchase() {
        model = "";
        quantity = "";
        description = "";
        listPrice = "";
        unitPrice = "";
        total = "";
        dateCode = "";
        notes = "";
    }
    
    public void setItem(Product product) {
        model = product.getModel();
        quantity = Integer.toString(1);
        description = product.getName();
        String price = Float.toString(product.getPrice());
        listPrice = unitPrice = total = price;
    }

    public String getModel() {
        return model;
    }

    public String getQuantity() {
        return quantity;
    }

    public String getDescription() {
        return description;
    }

    public String getListPrice() {
        return listPrice;
    }

    public String getUnitPrice() {
        return unitPrice;
    }

    public String getTotal() {
        return total;
    }

    public String getDateCode() {
        return dateCode;
    }

    public String getNotes() {
        return notes;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setListPrice(String listPrice) {
        this.listPrice = listPrice;
    }

    public void setUnitPrice(String unitPrice) {
        this.unitPrice = unitPrice;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    public void setDateCode(String dateCode) {
        this.dateCode = dateCode;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }
}
