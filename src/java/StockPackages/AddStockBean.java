/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package StockPackages;

/**
 *
 * @author Vatsal
 */
public class AddStockBean {
    private String stock_name,uid;
    private String date;
    private int quantity;
    private float price;
    
 private boolean valid;

    /**
     * @return the stock_name
     */
    public String getStock_name() {
        return stock_name;
    }

    /**
     * @param stock_name the stock_name to set
     */
    public void setStock_name(String stock_name) {
        this.stock_name = stock_name;
    }

    /**
     * @return the date
     */
    public String getDate() {
        return date;
    }

    /**
     * @param date the date to set
     */
    public void setDate(String date) {
        this.date = date;
    }

    /**
     * @return the quantity
     */
    public int getQuantity() {
        return quantity;
    }

    /**
     * @param quantity the quantity to set
     */
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    /**
     * @return the price
     */
    public float getPrice() {
        return price;
    }

    /**
     * @param price the price to set
     */
    public void setPrice(float price) {
        this.price = price;
    }

    /**
     * @return the valid
     */
    public boolean isValid() {
        return valid;
    }

    /**
     * @param valid the valid to set
     */
    public void setValid(boolean valid) {
        this.valid = valid;
    }

    /**
     * @return the uid
     */
    public String getUid() {
        return uid;
    }

    /**
     * @param uid the uid to set
     */
    public void setUid(String uid) {
        this.uid = uid;
    }
    /**
     */
 
}
