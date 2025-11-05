package webapp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class UserRegistration {
    public static void main(String[] args) {
        String username = "user1";
        String password = "123";
        String url = "jdbc:sqlserver://localhost:1433;databaseName=webbantrangsuc;TrustServerCertificate=true";
        String dbUsername = "sa";
        String dbPassword = "123";

        try (Connection connection = DriverManager.getConnection(url, dbUsername, dbPassword)) {
            String sql = "INSERT INTO member (username, password, enabled) VALUES (?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, username);
                statement.setString(2, password);
                statement.setBoolean(3, true);
                statement.executeUpdate();
                System.out.println("User registered successfully!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
