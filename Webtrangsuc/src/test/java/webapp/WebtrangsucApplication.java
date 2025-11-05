package webapp;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class WebtrangsucApplication implements CommandLineRunner {

    private static final Logger logger = LoggerFactory.getLogger(WebtrangsucApplication.class);

    public static void main(String[] args) {
        SpringApplication.run(WebtrangsucApplication.class, args);
    }

    @Override
    public void run(String... args) throws Exception {
        logger.trace("This is a TRACE level message");
        logger.debug("This is a DEBUG level message");
        logger.info("This is an INFO level message");
        logger.warn("This is a WARN level message");
        logger.error("This is an ERROR level message");
    }
}
