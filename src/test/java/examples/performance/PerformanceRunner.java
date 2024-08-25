package examples.performance;

import com.intuit.karate.junit5.Karate;

public class PerformanceRunner {

    @Karate.Test
    Karate testUI() {
        return Karate.run("performance").relativeTo(getClass());
    }
}
