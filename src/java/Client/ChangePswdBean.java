/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Client;

/**
 *
 * @author NaKs
 */
public class ChangePswdBean {
    private String opassword,npassword,username;
    private boolean valid;

    /**
     * @return the opassword
     */
    public String getOpassword() {
        return opassword;
    }

    /**
     * @param opassword the opassword to set
     */
    public void setOpassword(String opassword) {
        this.opassword = opassword;
    }

    /**
     * @return the npassword
     */
    public String getNpassword() {
        return npassword;
    }

    /**
     * @param npassword the npassword to set
     */
    public void setNpassword(String npassword) {
        this.npassword = npassword;
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
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

   
    
}
