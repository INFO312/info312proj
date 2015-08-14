/*
 * Post Grad Management System Project Files
 * 2015
 * Authors: Kadin Boyle, Corey Sutton, Samuel O Connell, Hunter Stewart, Nathan Blomfield
 */
package servlets;

import domain.Person;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kadin Boyle
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * For processing form data from the register form. Validates and attempts
     * to register a user in the system.
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
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String title = request.getParameter("title");
        String fname = request.getParameter("fname");
        String mname = request.getParameter("mname");
        String lname = request.getParameter("lname");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String hphone = request.getParameter("hphone");
        String mphone = request.getParameter("mphone");
        String wphone = request.getParameter("whpone");
        char gender = (char)Integer.parseInt(request.getParameter("gender"));
        String dob = request.getParameter("dob");
        
        
        Person newperson = new Person(person_id, title, fname, mname, lname, address, email, hphone, mphone, wphone, gender, dob);
           
    }
}
