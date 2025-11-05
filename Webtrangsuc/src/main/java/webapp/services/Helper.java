package webapp.services;

import java.security.SecureRandom;

public class Helper {
    private static final SecureRandom SECURE_RANDOM = new SecureRandom();
    private static final String PATTERN = "234567890wertyuiopasdfghjklzxcvbnm";
    public static String randomString(int len) {
        StringBuilder sb = new StringBuilder(len);
        for (int i = 0; i < len; i++) {
            sb.append(PATTERN.charAt(SECURE_RANDOM.nextInt(PATTERN.length())));
        }
        return sb.toString();
    }
}
