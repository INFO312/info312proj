/*
 * Post Grad Management System Project Files
 * 2015
 * Authors: Kadin Boyle, Corey Sutton, Samuel O Connell, Hunter Stewart, Nathan Blomfield
 */
package dao;

import domain.Person;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import resources.CustomSQL;
import resources.Passwords;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Kadin
 */
public class SystemAccessDAO {

    private Connection conn = null;
    private String dburl = "jdbc:mysql://localhost/info312?user=root&password=password";

    public SystemAccessDAO() {
        LoadDriver();

    }

    // Notice, do not import com.mysql.jdbc.*
    // or dao will shit itself
    public static void LoadDriver() {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
        } catch (Exception ex) {
            System.out.println("ERROR> ERROR");
        }
    }
    
    public Boolean personExists(String id) throws SQLException{
        conn = DriverManager.getConnection(dburl);
        PreparedStatement existsStatement = conn.prepareStatement("SELECT * FROM Person WHERE person_id = ?");
        ResultSet rs_authorize = existsStatement.executeQuery();
        if(rs_authorize.next()){
            return true;
        }
        conn.close();
        return false;
    }

    /**
     * Logs a user in if credentials are valid CURRENTLY processes password in
     * this method, although could be moved to Servlet, but this would require
     * two different DAO methods?
     *
     */
    public Person logInCandidate(String email, String password) throws SQLException {
        Person person = null;
        conn = DriverManager.getConnection(dburl);

        PreparedStatement authorizeStatement = CustomSQL.getAuthorizeCandidateStmt(email, conn);
        ResultSet rs_authorize = authorizeStatement.executeQuery();

        //If we managed to get the salt and hash for this user
        if (rs_authorize.next()) {
            //Convert to bytes, MAY NEED TO BE UTF-8?
            byte[] salt = rs_authorize.getString("salt").getBytes();
            byte[] expectedHash = rs_authorize.getString("hash").getBytes();

            //If the password they entered is correct (re hash the password with the salt stored
            //in the db, and if the new hash == the expected hash, then credentials are valid
            //NOTE: .toCharArray() is neccessary for isExpectedPassword to function
            if (Passwords.isExpectedPassword(password.toCharArray(), salt, expectedHash)) {
                PreparedStatement retrieveUserStatement = CustomSQL.getRetrieveUserStmt(email, conn);
                ResultSet rs_person = retrieveUserStatement.executeQuery();
                //Parse a Person object from the result set
                if (rs_person.next()) {
                    person = new Person(rs_person);
                }
            }
        }
        conn.close();
        return person;
    }

    /**
     * Logs a user in if credentials are valid CURRENTLY processes password in
     * this method, although could be moved to Servlet, but this would require
     * two different DAO methods?
     */
    public Person logInStaff(String email, String password) throws SQLException {
        Person person = null;
        conn = DriverManager.getConnection(dburl);

        PreparedStatement authorizeStatement = CustomSQL.getAuthorizeStaffStmt(email, conn);
        ResultSet rs_authorize = authorizeStatement.executeQuery();

        //If we managed to get the salt and hash for this user
        if (rs_authorize.next()) {

            //Convert to bytes, MAY NEED TO BE UTF-8?
            byte[] salt = rs_authorize.getString("salt").getBytes();
            byte[] expectedHash = rs_authorize.getString("hash").getBytes();

            //If the password they entered is correct (re hash the password with the salt stored
            //in the db, and if the new hash == the expected hash, then credentials are valid
            if (Passwords.isExpectedPassword(password.toCharArray(), salt, expectedHash)) {
                PreparedStatement retrieveUserStatement = CustomSQL.getRetrieveUserStmt(email, conn);
                ResultSet rs_person = retrieveUserStatement.executeQuery();
                //Parse a Person object from the result set
                if (rs_person.next()) {
                    person = new Person(rs_person);
                }
            }
        }
        conn.close();
        return person;
    }

    /**
     *
     *
     * @param newPerson The newly created Person object passed from the
     * RegisterServlet
     * @param email Users Email
     * @param salt
     * @param hash
     * @throws SQLException
     */
    public boolean registerCandidate(Person person, String salt, String hash) throws SQLException {
        conn = DriverManager.getConnection(dburl);
        //Insert a new person into the database stmt 
        try {
            PreparedStatement stmt = CustomSQL.getRegisterPersonStmt(person, person.getEmail(), salt, hash, conn);
            conn.setAutoCommit(false);
            //Execute first statement
            if (stmt.executeUpdate() == 0) {
                System.out.println("Creating a new user failed! No rows have been altered");
                conn.close();
                return false;
            }
            try (ResultSet autokeys = stmt.getGeneratedKeys()) {
                if (autokeys.next()) {
                    person.setPersonId(autokeys.getInt(1), "candidate");
                } else {
                    conn.close();
                    System.out.println("Failed to get auto generated keys!");
                    return false;
                }
            }

            //Now we assign the newly created persons id as a candidate_id (FK) in the candidate table
            PreparedStatement assignIdStatement = conn.prepareStatement(CustomSQL.assignCandidateIDSQL);
            assignIdStatement.setInt(1, person.getPersonid());
            assignIdStatement.setString(2, salt);
            assignIdStatement.setString(3, hash);
            //Execute second statement on candidate table
            if (assignIdStatement.executeUpdate() == 0) {
                System.out.println("Failed to assign person_id as candidate_id in the Candidate table!");
                conn.close();
                return false;
            }
        } catch (java.sql.SQLException e) {
            Logger.getLogger(SystemAccessDAO.class.getName()).log(Level.SEVERE, null, e);
            return false;
        }

        conn.commit();
        conn.close();
        return true;
    }

    /**
     *
     *
     * @param newPerson The newly created Person object passed from the
     * RegisterServlet
     * @param email Users Email
     * @param salt
     * @param hash
     * @throws SQLException
     */
    public boolean registerStaff(Person person, String salt, String hash, String publications, String otherInformation, ArrayList<String> qualifications) throws SQLException {
        conn = DriverManager.getConnection(dburl);
        //Insert a new person into the database stmt 
        try {
            PreparedStatement stmt = CustomSQL.getRegisterPersonStmt(person, person.getEmail(), salt, hash, conn);
            conn.setAutoCommit(false);
            //Execute first statement
            if (stmt.executeUpdate() == 0) {
                System.out.println("Creating a new user failed! No rows have been altered");
                conn.close();
                return false;
            }
            try (ResultSet autokeys = stmt.getGeneratedKeys()) {
                if (autokeys.next()) {
                    person.setPersonId(autokeys.getInt(1), "candidate");
                } else {
                    conn.close();
                    System.out.println("Failed to get auto generated keys!");
                    return false;
                }
            }

            //Now we assign the newly created persons id as a candidate_id (FK) in the candidate table
            PreparedStatement assignIdStatement = conn.prepareStatement(CustomSQL.assignStaffIDSQL);
            assignIdStatement.setInt(1, person.getPersonid());
            assignIdStatement.setString(2, salt);
            assignIdStatement.setString(3, hash);
            //Execute second statement on candidate table
            if (assignIdStatement.executeUpdate() == 0) { //If failed to assigned staff_id ..
                System.out.println("Failed to assign staff_id as staff_id in the Staff table!");
                conn.close();
                return false;
            }else{ //Success
                //Now insert there qualification shit
                
                //Now insert there publication shit
                
                //Lolcano
            }
        } catch (java.sql.SQLException e) {
            Logger.getLogger(SystemAccessDAO.class.getName()).log(Level.SEVERE, null, e);
            return false;
        }

        conn.commit();
        conn.close();
        return true;
    }

    
}
