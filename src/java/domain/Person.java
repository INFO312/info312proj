/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package domain;

/**
 *
 * @author Kadin
 */
public class Person {
    
    private String person_id;
    private String title;
    private String firstname;
    private String mname;
    private String lname;
    private String address;
    private String email;
    private String hphone;
    private String mphone;
    private String wphone;
    private char gender;
    private String dob;
    
    public Person(){
        
    }

    public Person(String person_id, String title, String firstname, String mname, String lname, String address, String email, String hphone, String mphone, String wphone, char gender, String dob) {
        this.person_id = person_id;
        this.title = title;
        this.firstname = firstname;
        this.mname = mname;
        this.lname = lname;
        this.address = address;
        this.email = email;
        this.hphone = hphone;
        this.mphone = mphone;
        this.wphone = wphone;
        this.gender = gender;
        this.dob = dob;
    }

    public String getPerson_id() {
        return person_id;
    }

    public void setPerson_id(String person_id) {
        this.person_id = person_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getHphone() {
        return hphone;
    }

    public void setHphone(String hphone) {
        this.hphone = hphone;
    }

    public String getMphone() {
        return mphone;
    }

    public void setMphone(String mphone) {
        this.mphone = mphone;
    }

    public String getWphone() {
        return wphone;
    }

    public void setWphone(String wphone) {
        this.wphone = wphone;
    }

    public char getGender() {
        return gender;
    }

    public void setGender(char gender) {
        this.gender = gender;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }
    
    
    
}
