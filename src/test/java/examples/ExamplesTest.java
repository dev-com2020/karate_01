package examples;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class ExamplesTest {
    @Test
    void testParallel() {
        Results results = Runner.path("classpath:examples")
                .parallel(5);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
    @Test
    void testProd() {
        Results results = Runner.path("classpath:examples")
                .karateEnv("prod")
                .parallel(2);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
}
