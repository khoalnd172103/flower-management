/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.servlet;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import sample.dao.PlantDAO;

/**
 *
 * @author Admin
 */
@WebServlet("/uploadFile")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class CreatePlantServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static final String UPLOAD_DIRECTORY = "C:\\Users\\Admin\\Documents\\NetBeansProjects\\FlowerMangement\\web\\images";

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            // Upload file get from ChatGPT
            String fileName = "";
            Part filePart = request.getPart("file");
            File uploadDir = new File(UPLOAD_DIRECTORY);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }
            fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
            InputStream fileContent = filePart.getInputStream();

            // Check if file already exists
            File existingFile = new File(uploadDir.getAbsolutePath() + File.separator + fileName);
            if (existingFile.exists()) {
                // Append number to filename to avoid overwriting existing file
                int i = 1;
                while (existingFile.exists()) {
                    fileName = i + "_" + fileName;
                    existingFile = new File(uploadDir.getAbsolutePath() + File.separator + fileName);
                    i++;
                }
            }

            // saves the file to the server
            Path filePath = Paths.get(uploadDir.getAbsolutePath() + File.separator + fileName);
            Files.copy(fileContent, filePath);
            fileContent.close();
            // end of get file data

            String name = request.getParameter("txtPlantName");
            int price = new Integer(request.getParameter("numberPrice"));
            String desc = request.getParameter("txtPlantDesc");
            String status = request.getParameter("status");
            int intStatus = 1;
            if (status.equals("inAvailable")) {
                intStatus = 0;
            }
            String cateid = request.getParameter("cateid");
            int result = PlantDAO.insertPlant(name, price, "images/" + fileName + "", desc, intStatus, cateid);
            if(result > 0) {
                response.sendRedirect("ManagePlant.jsp");
            } else {
                response.sendRedirect("ManagePlant.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
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
