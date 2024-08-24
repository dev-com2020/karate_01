package examples.ui;

import com.intuit.karate.junit5.Karate;

public class UiRunner {

    @Karate.Test
    Karate testUI() {
        return Karate.run("ui").relativeTo(getClass());
    }
}
