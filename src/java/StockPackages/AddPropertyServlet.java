/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package StockPackages;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 *
 * @author Vatsal
 */
public class AddPropertyServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /*
             * TODO output your page here. You may use following sample code.
             */
            AddPropertyBean bean=new AddPropertyBean();
            bean.setProp_name(request.getParameter("prop_name"));
            bean.setLocation(request.getParameter("location"));
            bean.setPrice(Float.parseFloat(request.getParameter("price")));
            bean.setLatest_price(Float.parseFloat((request.getParameter("latest_price"))));
            bean.setDate(request.getParameter("date"));
             bean.setUid(request.getParameter("uid"));
            bean=AddPropertyDAO.PropertyAdd(bean);
             if(bean.isValid())
            {
                System.out.println("valid");
                response.sendRedirect("/Major_Project/portfolio_jsps/property.jsp");
            }
            else
            {
                System.out.println("invalid");
                response.sendRedirect("/Major_Project/portfolio_jsps/property.jsp");
                JOptionPane.showMessageDialog(null, "Field values cannot be added..");

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
