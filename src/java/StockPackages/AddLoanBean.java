/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package StockPackages;

/**
 *
 * @author Vatsal
 */
public class AddLoanBean {
    private String loan_type,uid;
    private String emi_start_date;
    private String period_unit;
    private int tenure;
    private float loan_amt;
    private float rate;
    private boolean valid;

    /**
     * @return the loan_type
     */
    public String getLoan_type() {
        return loan_type;
    }

    /**
     * @param loan_type the loan_type to set
     */
    public void setLoan_type(String loan_type) {
        this.loan_type = loan_type;
    }

    /**
     * @return the emi_start_date
     */
    public String getEmi_start_date() {
        return emi_start_date;
    }

    /**
     * @param emi_start_date the emi_start_date to set
     */
    public void setEmi_start_date(String emi_start_date) {
        this.emi_start_date = emi_start_date;
    }

    /**
     * @return the period_unit
     */
    public String getPeriod_unit() {
        return period_unit;
    }

    /**
     * @param period_unit the period_unit to set
     */
    public void setPeriod_unit(String period_unit) {
        this.period_unit = period_unit;
    }

    /**
     * @return the tenure
     */
    public int getTenure() {
        return tenure;
    }

    /**
     * @param tenure the tenure to set
     */
    public void setTenure(int tenure) {
        this.tenure = tenure;
    }

    /**
     * @return the loan_amt
     */
    public float getLoan_amt() {
        return loan_amt;
    }

    /**
     * @param loan_amt the loan_amt to set
     */
    public void setLoan_amt(float loan_amt) {
        this.loan_amt = loan_amt;
    }

    /**
     * @return the rate
     */
    public float getRate() {
        return rate;
    }

    /**
     * @param rate the rate to set
     */
    public void setRate(float rate) {
        this.rate = rate;
    }
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
