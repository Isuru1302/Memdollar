package passwordHashing;

import java.util.*;

public class randomString {

    public static String randomString() {
        String randomString = "";

        int leftLimit = 97;
        int rightLimit = 122;
        int targetStringLength = 10;
        Random random = new Random();

        StringBuilder builder = new StringBuilder(targetStringLength);

        for (int i = 0; i < targetStringLength; i++) {
            int randomLimitedInt = leftLimit + (int) (random.nextFloat() * (rightLimit - leftLimit + 1));
            builder.append((char) randomLimitedInt);
        }
        
        randomString = builder.toString();

        return randomString;
    }
}
