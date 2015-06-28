/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package StockPackages;

/**
 *
 * @author Vatsal
 */
public class AddBullionBean {
     private String date,uid;
    private String commodity_name;
    private float price;
    private int quantity;
    private boolean valid;

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
     * @return the commodity_name
     */
    public String getCommodity_name() {
        return commodity_name;
    }

    /**
     * @param commodity_name the commodity_name to set
     */
    public void setCommodity_name(String commodity_name) {
        this.commodity_name = commodity_name;
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
    
}
