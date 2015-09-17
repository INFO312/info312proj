/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package resources;

import domain.Person;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;



/**
 *
 * @author Kadin
 */
public class CustomSQL {
    
    public static final String insertPersonSQL = "INSERT INTO Person (title, fname, mname, lname, address, email, mphone, hphone, wphone, gender, dob)"
                                    + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    
    public static final String assignCandidateIDSQL = "INSERT INTO Candidate (Candidate_id, salt, hash) VALUES (?, ?, ?)";
    
    public static final String assignStaffIDSQL = "INSERT INTO Staff (Staff_id, salt, hash) VALUES (?, ?, ?)";
    
    public static final String authorizeCandidateSQL = "SELECT salt, hash FROM candidate_login WHERE email = ?";
    
    public static final String authorizeStaffSQL = "SELECT salt, hash FROM Staff_Login WHERE email = ?";
    
    public static final String retrieveUserSQL = "SELECT * FROM Person WHERE email = ?";
    
    //Returns the prepared statement for inserting a person into the database
    public static PreparedStatement getRegisterPersonStmt(Person person, String email, String salt, String hash, Connection connection) throws SQLException{
        PreparedStatement stmt = connection.prepareStatement(insertPersonSQL, PreparedStatement.RETURN_GENERATED_KEYS);
        stmt.setString(1, person.getTitle());
        stmt.setString(2, person.getFirstname());
        stmt.setString(3, person.getMname());
        stmt.setString(4, person.getLname());
        stmt.setString(5, person.getAddress());
        stmt.setString(6, person.getEmail());
        stmt.setString(7, person.getMphone());
        stmt.setString(8, person.getHphone());
        stmt.setString(9, person.getWphone());
        stmt.setString(10, String.valueOf(person.getGender()));
        stmt.setTimestamp(11, person.getDobAsDateTimestamp());
        return stmt;
    }
    
    public static PreparedStatement getAssignCandidateStmt(int id, Connection connection) throws SQLException{
        PreparedStatement stmt = connection.prepareStatement(assignCandidateIDSQL);
        stmt.setInt(1, id);
        return stmt;
    }
    
    public static PreparedStatement getAuthorizeCandidateStmt(String email, Connection connection) throws SQLException{
        PreparedStatement stmt = connection.prepareStatement(authorizeCandidateSQL);
        stmt.setString(1, email);
        return stmt;
    }
    
    public static PreparedStatement getAssignStaffStmt(int id, Connection connection) throws SQLException{
        PreparedStatement stmt = connection.prepareStatement(assignStaffIDSQL);
        stmt.setInt(1, id);
        return stmt;
    }
    
    public static PreparedStatement getAuthorizeStaffStmt(String email, Connection connection) throws SQLException{
        PreparedStatement stmt = connection.prepareStatement(authorizeStaffSQL);
        stmt.setString(1, email);
        return stmt;
    }
    
    public static PreparedStatement getRetrieveUserStmt(String email, Connection connection) throws SQLException{
        PreparedStatement stmt = connection.prepareStatement(retrieveUserSQL);
        stmt.setString(1, email);
        return stmt;
    }
    
}
