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
public class AddStockServlet extends HttpServlet {

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
           AddStockBean bean=new AddStockBean();
            bean.setStock_name(request.getParameter("stock_name"));
            bean.setQuantity(Integer.parseInt(request.getParameter("quantity")));
            bean.setPrice(Float.parseFloat((request.getParameter("price"))));
            bean.setDate(request.getParameter("date"));
            bean.setUid(request.getParameter("uid"));
            bean=AddStockDAO.StockAdd(bean);
             if(bean.isValid())
            {
                System.out.println("valid");
                response.sendRedirect("/Major_Project/portfolio_jsps/stock.jsp");
            }
            else
            {
                System.out.println("invalid");
                response.sendRedirect("/Major_Project/portfolio_jsps/stock.jsp");
                JOptionPane.showMessageDialog(null, "Field values cannot be added..");

            
                    
                    }
             
        } 
        catch(NumberFormatException e){
        System.out.println("Error Message");
        }finally {            
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
