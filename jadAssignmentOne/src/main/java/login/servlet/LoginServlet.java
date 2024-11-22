package login.servlet;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
import java.security.SecureRandom;
import java.util.Base64;

import login.bean.LoginBean;
import login.dao.LoginDao;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LoginDao loginDao;

    public void init() {
        loginDao = new LoginDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String rememberMe = request.getParameter("rememberMe"); 
        LoginBean loginBean = new LoginBean();
        loginBean.setUsername(username);
        loginBean.setPassword(password);

        try {
            if (loginDao.validate(loginBean)) {
                HttpSession session = request.getSession();
                session.setAttribute("userID", loginDao.getUserIdByUsername(username));

                if ("on".equals(rememberMe)) {
                    String token = generateSecureToken();
                    loginDao.storeUserToken(username, token); 
                    Cookie cookie = new Cookie("rememberMe", token);
                    cookie.setHttpOnly(true);
                    cookie.setMaxAge(604800);
                    cookie.setPath("/");
//                    cookie.setSecure(true); 
                    response.addCookie(cookie);
                }else {
                	System.out.print("Error in Cookie");
                }

                response.sendRedirect("jsp/home.jsp");
            } else {
                response.sendRedirect("jsp/login.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Login failed due to server error.");
        }
    }

    private String generateSecureToken() {
        SecureRandom random = new SecureRandom();
        byte[] bytes = new byte[30];
        random.nextBytes(bytes);
        return Base64.getUrlEncoder().withoutPadding().encodeToString(bytes);
    }
}