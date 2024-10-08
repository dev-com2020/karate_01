package examples.users;

import com.intuit.karate.junit5.Karate;

public class UserRunner {

    @Karate.Test
    Karate testUsers() {
        return Karate.run("users").relativeTo(getClass());
    }

    @Karate.Test
    Karate testPosts() {
        return Karate.run("posts").relativeTo(getClass());
    }

    @Karate.Test
    Karate testSmokeUsers() {
        return Karate.run("users").relativeTo(getClass()).tags("smoke");
    }

}
