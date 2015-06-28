/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package StockPackages;

/**
 *
 * @author Vatsal
 */
public class AddMFBean {
     private String mf_name,uid;
    private String date;
    private int quantity;
    private float mf_price;
    private boolean valid;

    /**
     * @return the mf_name
     */
    public String getMf_name() {
        return mf_name;
    }

    /**
     * @param mf_name the mf_name to set
     */
    public void setMf_name(String mf_name) {
        this.mf_name = mf_name;
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
     * @return the mf_price
     */
    public float getMf_price() {
        return mf_price;
    }

    /**
     * @param mf_price the mf_price to set
     */
    public void setMf_price(float mf_price) {
        this.mf_price = mf_price;
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
