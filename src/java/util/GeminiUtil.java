package util;

import java.io.InputStream;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.Properties;

public class GeminiUtil {

    public static String getRecommendation(String description)
    {
        try {

            Properties props =
                    new Properties();

            InputStream input =
                    GeminiUtil.class
                    .getClassLoader()
                    .getResourceAsStream(
                            "config.properties");

            props.load(input);

            String apiKey =
                    props.getProperty(
                            "gemini.api.key");

            String prompt =
                    "You are an animal rescue expert. "
                    + "Analyze this rescue situation and provide:\n"
                    + "1. Severity Level\n"
                    + "2. Recommended Actions\n\n"
                    + description;

            String json =
                    """
                    {
                      "contents": [
                        {
                          "parts": [
                            {
                              "text": "%s"
                            }
                          ]
                        }
                      ]
                    }
                    """.formatted(
                            prompt.replace("\"", "\\\""));

            HttpRequest request =
                    HttpRequest.newBuilder()
                            .uri(
                                    URI.create(
                                    "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key="
                                    + apiKey))
                            .header(
                                    "Content-Type",
                                    "application/json")
                            .POST(
                                    HttpRequest
                                    .BodyPublishers
                                    .ofString(json))
                            .build();

            HttpClient client =
                    HttpClient.newHttpClient();

            HttpResponse<String> response =
                    client.send(
                            request,
                            HttpResponse.BodyHandlers
                                    .ofString());

            return response.body();

        }
        catch(Exception e)
        {
            e.printStackTrace();
            return "AI Service Unavailable";
        }
    }
}