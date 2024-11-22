package login.dao;

import java.sql.*;
import login.bean.LoginBean;

public class LoginDao {
    private String url = "jdbc:postgresql://ep-spring-lake-a114bnaa.ap-southeast-1.aws.neon.tech/jadAssignment1?sslmode=require";
    private String user = "neondb_owner";
    private String password = "TRJNu3Qtckm6";

    private Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("org.postgresql.Driver");
        return DriverManager.getConnection(url, user, password);
    }

    public boolean validate(LoginBean loginBean) throws SQLException, ClassNotFoundException {
        boolean status = false;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                 "SELECT * FROM users WHERE username = ? and password = ?")) {
            preparedStatement.setString(1, loginBean.getUsername());
            preparedStatement.setString(2, loginBean.getPassword());
            ResultSet rs = preparedStatement.executeQuery();
            status = rs.next();
        } catch (SQLException e) {
            printSQLException(e);
        }
        return status;
    }
    
    public void storeUserToken(String username, String token) throws SQLException, ClassNotFoundException {
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(
                 "UPDATE users SET remember_me_token = ? WHERE username = ?")) {
            statement.setString(1, token);
            statement.setString(2, username);
            statement.executeUpdate();
        }catch(SQLException e) {
        	printSQLException(e);
        }
    }
    
    public String getUsernameByToken(String token) throws SQLException, ClassNotFoundException {
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(
                 "SELECT username FROM users WHERE remember_me_token = ?")) {
            statement.setString(1, token);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getString("username");
            }
        }
        catch(SQLException e) {
        	printSQLException(e);
        }
        return null;
    }

    public String getUserIdByUsername(String username) throws SQLException, ClassNotFoundException {
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(
                 "SELECT id FROM users WHERE username = ?")) {
            statement.setString(1, username);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getString("id");
            }
        }
        catch(SQLException e) {
        	printSQLException(e);
        }
        return null;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
