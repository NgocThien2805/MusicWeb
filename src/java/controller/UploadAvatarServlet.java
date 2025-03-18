/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import DAO.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Paths;
import model.User;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 100 // 100MB
)
public class UploadAvatarServlet extends HttpServlet {
   
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
            out.println("<title>Servlet UploadAvatarServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UploadAvatarServlet at " + request.getContextPath () + "</h1>");
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
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    try {
        String action = request.getParameter("action");
        String userId = (String) request.getSession().getAttribute("user_id"); // Lấy ID người dùng

        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        UserDAO userDao = new UserDAO();

        // XỬ LÝ XÓA ẢNH
        if ("delete".equals(action)) {
            User user = userDao.getUserById(userId);
            String oldAvatar = user.getAvatarUrl();

            // Nếu có ảnh cũ và không phải ảnh mặc định thì xóa
            if (oldAvatar != null && !oldAvatar.equals("song_img/avatar.jpg")) {
                String uploadPath = getServletContext().getRealPath("") + File.separator + oldAvatar;
                File fileToDelete = new File(uploadPath);

                if (fileToDelete.exists()) {
                    fileToDelete.delete(); // Xóa file ảnh khỏi thư mục
                }
            }

            // Cập nhật database để đặt lại avatar mặc định
            userDao.updateAvatar(Integer.parseInt(userId), "song_img/avatar.jpg");

            response.sendRedirect("profile.jsp?success=deleted");
            return;
        }

        // XỬ LÝ UPLOAD ẢNH MỚI
        Part filePart = request.getPart("avatar"); // Lấy file từ request
        if (filePart == null || filePart.getSize() == 0) {
            response.sendRedirect("profile.jsp?error=NoFile");
            return;
        }

        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        // Lưu file mới
        filePart.write(uploadPath + File.separator + fileName);

        // Cập nhật database với đường dẫn ảnh mới
        String newAvatarPath = "uploads/" + fileName;
        userDao.updateAvatar(Integer.parseInt(userId), newAvatarPath);

        response.sendRedirect("profile.jsp?success=uploaded");
    } catch (Exception e) {
        response.sendRedirect("profile.jsp?error=Exception");
        e.printStackTrace();
    }
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