package webapp;

import javax.sql.DataSource;

import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableWebSecurity
@EnableTransactionManagement


@EnableJpaRepositories(basePackages = "webapp.models") 
@EntityScan(basePackages = "webapp.models")
public class SecurityConfig {
  
    @Bean
    public DataSource dataSource() {
        DataSourceBuilder dataSourceBuilder = DataSourceBuilder.create();
        dataSourceBuilder.driverClassName("com.mysql.cj.jdbc.Driver"); 
        dataSourceBuilder.url("jdbc:mysql://localhost:3306/webbantrangsuc?useSSL=false&serverTimezone=UTC");
        dataSourceBuilder.username("root");
        dataSourceBuilder.password("");
        return dataSourceBuilder.build();
    }

    @Bean
    public JdbcUserDetailsManager userDetailsService(DataSource dataSource) {
        JdbcUserDetailsManager userDetailsManager = new JdbcUserDetailsManager(dataSource);
        String usersQuery = "SELECT username, password, enabled FROM member WHERE username = ?";
        userDetailsManager.setUsersByUsernameQuery(usersQuery);

        String authoritiesQuery = "SELECT m.username, r.name FROM member m " +
                "JOIN user_roles ur ON m.id = ur.user_id " +
                "JOIN role r ON ur.role_id = r.id WHERE m.username = ?"; 
        userDetailsManager.setAuthoritiesByUsernameQuery(authoritiesQuery);
        
        return userDetailsManager;
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new PasswordEncoder() {
            @Override
            public String encode(CharSequence rawPassword) {
                return rawPassword.toString();
            }

            @Override
            public boolean matches(CharSequence rawPassword, String encodedPassword) {
                return rawPassword.toString().equals(encodedPassword);
            }
        };
    }

    @Bean
    public DaoAuthenticationProvider authenticationProvider(JdbcUserDetailsManager userDetailsService) {
        DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
        provider.setUserDetailsService(userDetailsService);
        provider.setPasswordEncoder(passwordEncoder());
        return provider;
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
            .authorizeHttpRequests(authorizeRequests -> 
                authorizeRequests
                    .requestMatchers("/login", "/register", "/index", "/coloshop-master/**", "/static/**", "/images/**").permitAll()
                    .anyRequest().authenticated()
            )
            .formLogin(formLogin -> 
                formLogin
                    .loginPage("/login")
                    .defaultSuccessUrl("/index", true)  
                    .permitAll()
            )
            .logout(logout -> 
                logout.permitAll()
            )
            .csrf(csrf -> csrf.disable()); 
    
        return http.build();
    }
    
}
