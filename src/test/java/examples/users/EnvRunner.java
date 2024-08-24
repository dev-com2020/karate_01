package examples.users;

import com.intuit.karate.junit5.Karate;

public class EnvRunner {

    @Karate.Test
    Karate dev() {
        return Karate.run("env-demo").karateEnv("dev").relativeTo(getClass());
    }

    @Karate.Test
    Karate prod() {
        return Karate.run("env-demo").karateEnv("prod").relativeTo(getClass());
    }
}
