/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import dao.SystemAccessDAO;
import domain.Person;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import resources.Passwords;
import resources.Util;
/**
 *
 * @author csutton
 */
@WebServlet(name = "CreateDepartmentMemeberServelet", urlPatterns = {"/CreateDepartmentMemeberServelet"})
public class RegisterStaffServlet extends HttpServlet {
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       String title = request.getParameter("title"); 
       String fname = request.getParameter("fname");
       String mname = request.getParameter("mname");
       String lname = request.getParameter("lname");
       String access = request.getParameter("access");
       char gender = request.getParameter("gender").charAt(0);
       String password = request.getParameter("password");
       String email = request.getParameter("email");
       String mphone = request.getParameter("mphone");
       String hphone = request.getParameter("hphone");
       String wphone = request.getParameter("wphone");
       String dobstr = request.getParameter("dob") + " 00:00:00";
        Timestamp ts = Util.convertStringToTimestamp(dobstr);
       
       String address = request.getParameter("address");
       
       
       String publications = request.getParameter("publications");
       String otherInformation = request.getParameter("otherInformation");
       
       // Find the amount of expected qualifications and add to array
       // while checking if any are empty
       ArrayList<String> qualifications = new ArrayList<>();
       int qualificationCount = Integer.parseInt(request.getParameter("qualificationCounter"));
       for(int i = 0; i < qualificationCount; i ++) {
           String qualification = request.getParameter("qualification" + i);
           if(qualification != "") {
               qualifications.add(qualification);
           }
       }
       
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
            registrationSuccessful = new SystemAccessDAO().registerStaff(newperson, saltString, hashString, publications, otherInformation, qualifications);
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
