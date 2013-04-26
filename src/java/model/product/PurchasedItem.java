/*
 * PurchaseItem is the class that only includes the premitive type variables
 * for server-client communication
 */
package model.product;

/**
 *
 * @author Wilson
 */
public class PurchasedItem {
    String model;
    int quantity;
    String description;
    float listPrice;
    float unitPrice;
    float total;
    String dateCode;
    String notes;

    public String getModel() {
        return model;
    }

    public int getQuantity() {
        return quantity;
    }

    public String getDescription() {
        return description;
    }

    public float getListPrice() {
        return listPrice;
    }

    public float getUnitPrice() {
        return unitPrice;
    }

    public float getTotal() {
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

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setListPrice(float listPrice) {
        this.listPrice = listPrice;
    }

    public void setUnitPrice(float unitPrice) {
        this.unitPrice = unitPrice;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public void setDateCode(String dateCode) {
        this.dateCode = dateCode;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }
}
