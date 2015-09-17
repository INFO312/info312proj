/*
 * Post Grad Management System Project Files
 * 2015
 * Authors: Kadin Boyle, Corey Sutton, Samuel O Connell, Hunter Stewart, Nathan Blomfield
 */
package servlets;

import dao.SystemAccessDAO;
import domain.Person;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.DateFormatter;
import resources.Passwords;
import resources.Util;

/**
 *
 * @author Kadin Boyle
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterCandidateServlet extends HttpServlet {

    //NOTE YOU MUST HAVE THE <CODE> POST </CODE>
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods. <code>GET</code> <code>POST</code> For processing form data from
     * the register form. Validates and attempts to register a user in the
     * system.
     *
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String person_id = null;

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        //Might not need this! ...
        //String passwordConfirmation = request.getParameter("passwordConfirmation");
        String title = request.getParameter("title");
        String fname = request.getParameter("fname");
        String mname = request.getParameter("mname");
        String lname = request.getParameter("lname");
        String address = request.getParameter("address");
        
        String hphone = request.getParameter("hphone");
        String mphone = request.getParameter("mphone");
        String wphone = request.getParameter("whpone");
        char gender = request.getParameter("gender").charAt(0);
        String dobstr = request.getParameter("dob") + " 00:00:00";
        Timestamp ts = Util.convertStringToTimestamp(dobstr);


        
        Person newperson = new Person(title, fname, mname, lname, address, email, hphone, mphone, wphone, gender, ts);

        //Generate a new salt for this user and conver the password string to Char array
        byte[] saltbytes = Passwords.getNextSalt();
        char[] pwd = password.toCharArray();
        
        //Hash the password and salt
        byte[] hash = Passwords.hash(pwd, saltbytes);
        String hashString = new String(hash);
        String saltString = new String(saltbytes);
        
        boolean registrationSuccessful = false;
        
        //Try to register the user
        try {
            registrationSuccessful = new SystemAccessDAO().registerCandidate(newperson, saltString, hashString);
        } catch (Exception e) {
           Logger.getLogger(RegisterCandidateServlet.class.getName()).log(Level.SEVERE, null, e);
        }
        
        HttpSession session = request.getSession();
        if(registrationSuccessful){
            session.setAttribute("registrationMsg", "Your Registration was successful! Please login below");
            response.sendRedirect("/PostGradSystem/login.jsp");
        }else{
            session.setAttribute("registrationMsg", "Your Registration failed! Please try again");
            response.sendRedirect("/PostGradSystem/register.jsp");
        }
    }
    
    /** OLD NOT USED TESTING STUFF 
         * String pstr = "password"; char[] pwd = pstr.toCharArray();
         *
         * String tempsalt = new String(saltbytes); byte[] saltbytesC =
         * tempsalt.getBytes();
         *
         * byte[] hash = Passwords.hash(pwd, saltbytes);
         *
         * String temphash = new String(hash); byte[] hashC =
         * temphash.getBytes();
         *
         * char[] pwd2 = pstr.toCharArray();
         *
         * if(Passwords.isExpectedPassword(pwd2, saltbytesC, hashC)){
         * System.out.println("ADDDD Successfull"); }
        *
         */

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
