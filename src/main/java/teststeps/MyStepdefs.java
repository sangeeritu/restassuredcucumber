package teststeps;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.restassured.http.ContentType;
import io.restassured.response.ValidatableResponse;

import java.io.FileWriter;
import java.io.IOException;

import static io.restassured.RestAssured.given;

public class MyStepdefs {
    private ValidatableResponse validatableResponse;
    String responseBody= "";
    @Given("I perform the GET operation for {string}")
    public void iPerformTheGETOperationFor(String url) {
        validatableResponse = given().contentType(ContentType.JSON)
                .when().get(url).then();
        responseBody = responseBody +validatableResponse.extract().asPrettyString();
        System.out.println("Response :"+responseBody);

    }

    @And("export the response to json file {string}")
    public void exportTheResponseToJsonFile(String filename) {
        try {
            FileWriter file = new FileWriter("/Users/sangeel/IdeaProjects/restassuredcucumber/src/main/resources/responseData/"+filename+".json");
            file.write(responseBody);
            file.flush();
            file.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Then("I should see the status code {string}")
    public void iShouldSeeTheStatusCode(String statusCode) {
        validatableResponse.assertThat().statusCode(Integer.parseInt(statusCode));
        System.out.println("Status code : "+Integer.parseInt(statusCode));

    }
}
