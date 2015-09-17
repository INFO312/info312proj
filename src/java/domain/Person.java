/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package domain;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import resources.Util;

/**
 *
 * @author Kadin
 */
public class Person {
    
    
    //TODO: Ask samo to change "gender" in DB to char instead of varchar
    private int person_id; 
    public enum PERSON_TYPE {candidate, staff};
    private PERSON_TYPE type;

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
    private Date dob;
    private Timestamp dobts;
    

    
    public Person(){
        
    }
    
    //Parsing a person after retreiving the from the DB.
    //Note - gender must be char (.charAt(0))
    //     - date must be converted from a timestamp to string
    //       Use function i wrote in utils.
    public Person(ResultSet data) throws SQLException{
        this.person_id = data.getInt("person_id");
        this.title = data.getString("title");
        this.firstname = data.getString("fname");
        this.mname = data.getString("mname");
        this.lname = data.getString("lname");
        this.address = data.getString("address");
        this.email = data.getString("email");
        this.hphone = data.getString("hphone");
        this.mphone = data.getString("mphone");
        this.wphone = data.getString("wphone");
        this.gender = data.getString("gender").charAt(0);
        this.dob = data.getTimestamp("dob");
    }

    //Constructor
    public Person(String title, String firstname, String mname, String lname, String address, String email, String hphone, String mphone, String wphone, char gender, Timestamp dob) {
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
        this.dobts = dob;
    }
    
    public boolean setPersonId(int id, String type){
        switch(type){
            case "candidate":
                this.setType(PERSON_TYPE.candidate);
                break;
            case "staff":
                this.setType(PERSON_TYPE.staff);
                break; 
            default:
                return false;
        }
        this.person_id = id;
        return true;
    }
    
    public int getPersonid(){
        return this.person_id;
    }

    //Returns as String
    public String getType() {
        return type.toString();
    }

    public void setType(PERSON_TYPE type) {
        this.type = type;
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

    public Timestamp getDob() {
        return dobts;
    }
    
    public Timestamp getDobAsDateTimestamp(){
        return new Timestamp(getDob().getTime());
    }

    public void setDob(Timestamp dob) {
        this.dobts = dob;
    }

    @Override
    public String toString() {
        return "Person{" + "person_id=" + person_id+ ", title=" + title + ", firstname=" + firstname + ", mname=" + mname + ", lname=" + lname + ", address=" + address + ", email=" + email + ", hphone=" + hphone + ", mphone=" + mphone + ", wphone=" + wphone + ", gender=" + gender + ", dob=" + dob + '}';
    }
    
    
    
}
