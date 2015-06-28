/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package StockPackages;

/**
 *
 * @author Vatsal
 */
public class AddPropertyBean {
    private String prop_name,uid;
    private String date;
    private String location;
    private float price;
    private float latest_price;
    private boolean valid;

    /**
     * @return the prop_name
     */
    public String getProp_name() {
        return prop_name;
    }

    /**
     * @param prop_name the prop_name to set
     */
    public void setProp_name(String prop_name) {
        this.prop_name = prop_name;
    }

    /**
     * @return the data
     */
    public String getDate() {
        return date;
    }

    /**
     * @param data the data to set
     */
    public void setDate(String date) {
        this.date = date;
    }

    /**
     * @return the location
     */
    public String getLocation() {
        return location;
    }

    /**
     * @param location the location to set
     */
    public void setLocation(String location) {
        this.location = location;
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
     * @return the latest_price
     */
    public float getLatest_price() {
        return latest_price;
    }

    /**
     * @param latest_price the latest_price to set
     */
    public void setLatest_price(float latest_price) {
        this.latest_price = latest_price;
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
     * @return the prop_name
     */
   
}
