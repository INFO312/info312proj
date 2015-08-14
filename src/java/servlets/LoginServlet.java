/*
 * Post Grad Management System Project Files
 * 2015
 * Authors: Kadin Boyle, Corey Sutton, Samuel O Connell, Hunter Stewart, Nathan Blomfield
 */
package servlets;

//Import dao and jdbc dao here...
import dao.LoginJdbcDAO;
import domain.Person;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Kadin Boyle
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

   /**
    * Processes requests for both HTTP
    * <code>GET</code> and
    * <code>POST</code> methods.
    *
    * @param request servlet request
    * @param response servlet response
    * @throws ServletException if a servlet-specific error occurs
    * @throws IOException if an I/O error occurs
    */
   protected void processRequest(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
      String username = request.getParameter("username");
      String password = request.getParameter("password");
      
      //Is the person a staff member or student?
      String type = request.getParameter("type");
 
      Person user = new LoginJdbcDAO().logIn(username, password);
      
      //If we managed to login..
      if (user != null) {
         HttpSession session = request.getSession();
         //Set the session attribute so that we can retrieve the current User,AND
         //their type when navigating across pages i.e USER or STAFF.
         session.setAttribute("currentuser", user);
         session.setAttribute("usertype", type); //Set to staff or student..

         // get the requested page from the session if they tried to access a page for
         // which they were not authorized.
         String requestedPath = (String) session.getAttribute("requestedPath");
         if (requestedPath != null) {
            // if it was set then remove it from the session
            session.removeAttribute("requestedPath");
            // and redirect to that page
            response.sendRedirect(requestedPath);
         } else {
        // if not go to the home page
            response.sendRedirect("/PostGradSystem/");
         }
      } else {
         // Login Unauthorized
         response.sendError(HttpServletResponse.SC_UNAUTHORIZED,
                 "Log in failed. Try again.");
      }
   }

   // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
   /**
    * Handles the HTTP
    * <code>GET</code> method.
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
    * Handles the HTTP
    * <code>POST</code> method.
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
