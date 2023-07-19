/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import dao.teacherDao;
import dao.teachesDao;
import entities.User;
import helper.ConnectionProvider;
import helper.Enrollment;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.util.ArrayList;
/**
 *
 * @author shahmdmesbahulislam
 */
public class teacherRegisteredCourseServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet teacherRegisteredCourseServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            HttpSession s = request.getSession();
            User user = (User) s.getAttribute("current_user");
//            out.println(user.getName());
//            out.println(user.getEmail());
            String teacherName = user.getName();
            String teacherEmail = user.getEmail();
            teacherDao dao = new teacherDao(ConnectionProvider.getConnection());
            int tId = dao.gettId(teacherName, teacherEmail);
            
            teachesDao dao1 = new teachesDao(ConnectionProvider.getConnection());
            ArrayList<Enrollment> en1 = dao1.getInformationAboutEnrolledCoursesByTeacherId(tId);
//            for(Enrollment c:en1){
//                out.println(c.getTeacherName());
//                out.println(c.getCourseTitle());
//                out.println(c.getCourseCode());
//                out.println(c.getCourseCredit());
//                out.println(c.getCourseType());
//                out.println("Devider..........");
//            }
//            out.println(tId);
            out.println("</body>");
            out.println("</html>");
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
