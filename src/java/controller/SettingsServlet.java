/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import DAO.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import utils.MailSender;

/**
 *
 * @author Admin
 */
public class SettingsServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SettingsServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SettingsServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("user_id");
        
        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        UserDAO userDao = new UserDAO();
        User user = userDao.getUserById(userId);
        
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");
        String newEmail = request.getParameter("email");
        
        // Kiểm tra mật khẩu hiện tại
        if (currentPassword != null && !user.getPasswordHash().equals(currentPassword)) {
            request.setAttribute("error", "Mật khẩu hiện tại không đúng!");
            request.getRequestDispatcher("settings.jsp").forward(request, response);
            return;
        }
        
        // Kiểm tra xác nhận mật khẩu mới
        if (newPassword != null && !newPassword.equals(confirmPassword)) {
            request.setAttribute("error", "Mật khẩu mới không khớp!");
            request.getRequestDispatcher("settings.jsp").forward(request, response);
            return;
        }
        
        // Cập nhật mật khẩu nếu có thay đổi
        if (newPassword != null && !newPassword.isEmpty()) {
            userDao.changePassword(Integer.parseInt(userId), newPassword);
            request.setAttribute("success", "Đổi mật khẩu thành công!");
        }
        
        // Xử lý thay đổi email
        if (newEmail != null && !newEmail.equals(user.getEmail())) {
            int otpCode = (int) (Math.random() * 900000) + 100000;
            session.setAttribute("otp_code", otpCode);
            session.setAttribute("new_email", newEmail);
            
            // Gửi email xác nhận
            MailSender.sendVerificationEmail(newEmail, "Mã xác nhận email của bạn là: " + otpCode);
            request.setAttribute("info", "Mã xác nhận đã được gửi đến email mới.");
            request.getRequestDispatcher("verifyEmail.jsp").forward(request, response);
            return;
        }
        
        request.getRequestDispatcher("settings.jsp").forward(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
