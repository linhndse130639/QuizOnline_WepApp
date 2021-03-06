/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package linhnd.controllers;

import java.io.IOException;
import java.util.concurrent.ThreadLocalRandom;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import linhnd.daos.AccountDAO;
import linhnd.dtos.Account;
import linhnd.utils.JavaMailUtil;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.log4j.Logger;

/**
 *
 * @author PC
 */
@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

    static Logger LOGGER = Logger.getLogger(LoginController.class);

    private static final String ERROR = "login.jsp";
    private static final String STUDENT = "StudentController";
    private static final String ADMIN = "AdminController";
    private static final String AUTHENTICATE_PAGE = "authenticaAccount.jsp";
    private static final int MAX = 99999;
    private static final int MIN = 10000;

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
        String url = ERROR;
        try {
            String email = request.getParameter("txtEmail");
            String password = request.getParameter("txtPassword");

            if (email.equals("") || password.equals("")) {
                request.setAttribute("ERRORLOGIN", "Email and Password can't blank");
            } else {
                AccountDAO dao = new AccountDAO();
                String passwordSha256 = DigestUtils.sha256Hex(password);
                String role = dao.checkLogin(email, passwordSha256);
                String statusAccount = dao.getStatusAccount(email);
                if (role.equals("failed")) {
                    request.setAttribute("ERRORLOGIN", "Account not found !");
                } else {
                    HttpSession session = request.getSession();
                    String name = dao.getName(email);
                    Account acount = dao.getAccount(email);
                    session.setAttribute("NAME", name);
                    session.setAttribute("EMAIL", email);
                    session.setAttribute("ACCOUNT", acount);
                    if (role.equals("Student")) {
                        if (statusAccount.equals("New")) {
                            int randomCode = ThreadLocalRandom.current().nextInt(MIN, MAX + 1);
                            String randomCodeString = String.valueOf(randomCode);
                            JavaMailUtil.sendMail(email, randomCodeString);
                            session.setAttribute("RANDOM_CODE", randomCodeString);
                            url = AUTHENTICATE_PAGE;
                        } else if (statusAccount.equals("Activated")) {
                            url = STUDENT;
                        }
                    } else if (role.equals("Admin")) {
                        url = ADMIN;
                    } else {
                        request.setAttribute("ERRORLOGIN", "Account not found !");
                    }
                }
            }
        } catch (Exception e) {
            LOGGER.fatal(e);
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
