/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package KhaiPT.Registration;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Acer
 */
public class CartObj implements Serializable{
    private String customerID;
    private Map<String, Integer> items;

    public String getCustomerID() {
        return customerID;
    }

    public void setCustomerID(String customerID) {
        this.customerID = customerID;
    }

    public Map<String, Integer> getItems() {
        return items;
    }

    public void setItems(Map<String, Integer> items) {
        this.items = items;
    }

    public CartObj() {
    }

    public CartObj(String customerID, Map<String, Integer> items) {
        this.customerID = customerID;
        this.items = items;
    }
    
    public void addItemToCart (String title){
        if(this.items == null){
            items = new HashMap<>();
        }
        int quantity = 1;
        if(items.containsKey(title)){
            quantity = items.get(title) + 1;
        }
        items.put(title, quantity);
    }
    
    public void removeItemFromCart(String title){
        if(this.items != null){
            if(this.items.containsKey(title)){
                this.items.remove(title);
                if(this.items.isEmpty()){
                    this.items = null;
                }
            }
        }
    }
}
