/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Client;

import java.awt.HeadlessException;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;


/**
 *
 * @author Vatsal
 */
public class ClientRegistrationServlet extends HttpServlet {

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
            throws ServletException, IOException, HeadlessException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /*
             * TODO output your page here. You may use following sample code.
             */
            ClientBean bean = new ClientBean();
            HttpSession session = request.getSession(true);
            Integer i = (Integer) session.getAttribute("edit");

            bean.setFname(request.getParameter("fname"));
            bean.setLname(request.getParameter("lname"));


            bean.setPassword(request.getParameter("password"));
            bean.setCpassword(request.getParameter("cpassword"));


            bean.setUid(request.getParameter("uid"));
            bean.setGender(request.getParameter("gender"));


            bean.setEmail(request.getParameter("email"));
            bean.setMno(Long.parseLong(request.getParameter("mno")));
            bean.setDob(request.getParameter("dob"));
            bean.setOccupation(request.getParameter("occupation"));
            bean.setCountry(request.getParameter("country"));
            bean.setCity(request.getParameter("city"));
            bean.setState(request.getParameter("state"));
            bean = ClientRegistrationDAO.registration(bean);
            System.out.println(bean);

            if (bean.isValid()) {
                response.sendRedirect("/Major_Project/pages/client_home.jsp");
                System.out.println("Successfully Created!");
               // JOptionPane.showMessageDialog(null, "Successfully Completed");
            } else {
                response.sendRedirect("/Major_Project/Client/registration.html");
                System.out.println("Failed!");
               // JOptionPane.showMessageDialog(null, "Please Try Again");

            }
        } finally {
            out.close();
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
            throws ServletException, IOException,HeadlessException {
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
            throws ServletException, IOException,HeadlessException {
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
