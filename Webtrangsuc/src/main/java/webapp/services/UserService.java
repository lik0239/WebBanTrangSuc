package webapp.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public void createUser(String username, String password) {
        String sql = "INSERT INTO member (username, password, enabled) VALUES (?, ?, ?)";
        jdbcTemplate.update(sql, username, password, true);
    }
}
