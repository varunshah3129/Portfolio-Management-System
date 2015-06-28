/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Client;

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
 * @author NaKs
 */
public class ChangePswdServlet extends HttpServlet {

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
            ChangePswdBean bean = new ChangePswdBean();
			
			bean.setOpassword(request.getParameter("opassword"));
			bean.setNpassword(request.getParameter("npassword"));
                        bean.setUsername(request.getParameter("username"));
			
			bean = ChangePswdDAO.changepswd(bean);
			
			System.out.println(bean);
			
			if(bean.isValid())
			{
				HttpSession session = request.getSession(true);
				Integer i = (Integer)session.getAttribute("id");
				if(i==null)
				{
					i = new Integer(0);
					session.setAttribute("Client", bean);
					System.out.println("Valid");
					
					//RequestDispatcher d = request.getRequestDispatcher("/Client/client_login.jsp");
					//d.forward(request, response);
                                        response.sendRedirect("/Major_Project/pages/client_home.jsp");
				}
				else
				{
					i = new Integer(i.intValue()+1);
                                        System.out.println("valid 1");
					//RequestDispatcher d = request.getRequestDispatcher("/Client/client_login.jsp");
					//d.forward(request, response);
                                        response.sendRedirect("/Major_Project/pages/client_home.jsp");
				}
				session.setAttribute("id", i);
			}
			else
			{
				System.out.println("Not Valid");
				
                                response.sendRedirect("/Major_Project/Client/changepswd.jsp");
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
