package runners;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        features = "src/main/resources/features/", glue = {"teststeps"},
        monochrome = true,
        plugin = { "pretty", "html:target/cucumber-reports.html" }
)

public class runnerfile {
}
