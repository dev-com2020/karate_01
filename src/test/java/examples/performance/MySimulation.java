//package examples.performance;
//import com.intuit.karate.gatling.PreDef;
//import io.gatling.core.Predef;
//import io.gatling.javaapi.core.ScenarioBuilder;
//import io.gatling.javaapi.core.Simulation;
//import io.gatling.javaapi.core.CoreDsl;
//import io.gatling.javaapi.core.structure.Scenario;
//
//import java.time.Duration;
//
//public class MySimulation extends Simulation {
//    {
//        var protocol = PreDef.karateProtocol();
//        protocol.nameResolver((req,ctx) -> req.getHeader("karate-name"));
//        protocol.runner().karateEnv("perf");
//
//        ScenarioBuilder myScenario = CoreDsl.scenario("Mój scenariusz")
//            .exec(PredDef.karateFeature("classpath:examples/performance/performance.feature"));
//        setUp(
//                myScenario.injectOpen(
//                        CoreDsl.rampUsers(100).during(Duration.ofSeconds(10))
//                ).protocol(protocol)
//        );
//    }
//}
