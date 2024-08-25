package examples.intercept;

import com.intuit.karate.junit5.Karate;

public class InterceptRunner {

    @Karate.Test
    Karate testUI() {
        return Karate.run("intercept").relativeTo(getClass());
    }
}
