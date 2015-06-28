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
public class AddLoanServlet extends HttpServlet {

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
            AddLoanBean bean=new AddLoanBean();
            bean.setLoan_type(request.getParameter("loan_type"));
            
            bean.setLoan_amt(Float.parseFloat(request.getParameter("loan_amt")));
            bean.setRate(Float.parseFloat((request.getParameter("rate"))));
            bean.setEmi_start_date(request.getParameter("emi_start_date"));
            bean.setPeriod_unit(request.getParameter("period_unit1"));
            bean.setTenure(Integer.parseInt(request.getParameter("tenure")));
             bean.setUid(request.getParameter("uid"));
            bean=AddLoanDAO.LoanAdd(bean);
             if(bean.isValid())
            {
                System.out.println("valid");
                response.sendRedirect("/Major_Project/portfolio_jsps/loan.jsp");
            }
            else
            {
                System.out.println("invalid");
                response.sendRedirect("/Major_Project/portfolio_jsps/loan.jsp");
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
