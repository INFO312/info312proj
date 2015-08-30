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
    
    private static final String insertPersonSQL = "INSERT INTO Person (title, fname, mname, lname, address, email, mphone, hphone, wphone, gender, dob, salt, hash)"
                                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    
    private static final String assignCandidateSQL = "INSERT INTO Candidate (Candidate_id) VALUES (?)";
    
    private static final String authorizeUserSQL = "SELECT salt, hash FROM Person WHERE email = ?";
    
    private static final String retrieveUserSQL = "SELECT * FROM Person WHERE email = ?";
    
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
        stmt.setTimestamp(11, Util.convertStringToTimestamp(person.getDob()));
        stmt.setString(12, salt);
        stmt.setString(13, hash);
        return stmt;
    }
    
    public static PreparedStatement getAssignCandidateStmt(int id, Connection connection) throws SQLException{
        PreparedStatement stmt = connection.prepareStatement(assignCandidateSQL);
        stmt.setInt(1, id);
        return stmt;
    }
    
    public static PreparedStatement getAuthorizeUserStmt(String email, Connection connection) throws SQLException{
        PreparedStatement stmt = connection.prepareStatement(authorizeUserSQL);
        stmt.setString(1, email);
        return stmt;
    }
    
    public static PreparedStatement getRetrieveUserStmt(String email, Connection connection) throws SQLException{
        PreparedStatement stmt = connection.prepareStatement(retrieveUserSQL);
        stmt.setString(1, email);
        return stmt;
    }
    
}
