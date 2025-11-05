package webapp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;

@SpringBootApplication
@EntityScan(basePackages = "webapp.models")
public class WebtrangsucApplication {

	public static void main(String[] args) {
		SpringApplication.run(WebtrangsucApplication.class, args);
	}

}
