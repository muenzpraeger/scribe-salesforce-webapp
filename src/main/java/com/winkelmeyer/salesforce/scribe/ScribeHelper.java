package com.winkelmeyer.salesforce.scribe;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import com.github.scribejava.apis.SalesforceApi;
import com.github.scribejava.apis.salesforce.SalesforceToken;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

public class ScribeHelper {

    private static String ENV_OAUTH_CONSUMER_KEY = "OAUTH_CONSUMER_KEY";
    private static String ENV_OAUTH_CONSUMER_SECRET = "OAUTH_CONSUMER_SECRET";

    public static ScribeHelper INSTANCE;

    private OAuth20Service service;
    private SalesforceToken accessToken;

    public ScribeHelper() {
    }

    public static ScribeHelper getInstance() {
        if (INSTANCE == null) {
            INSTANCE = new ScribeHelper();
        }
        return INSTANCE;
    }

    public String getAuthorizationUrl(String url) {
        service = new ServiceBuilder()
                .apiKey(System.getenv(ENV_OAUTH_CONSUMER_KEY))
                .apiSecret(System.getenv(ENV_OAUTH_CONSUMER_SECRET))
                .callback(url)
                .build(SalesforceApi.instance());

        return service.getAuthorizationUrl();
    }

    public String getAccessToken(String code) throws IOException {
        accessToken = (SalesforceToken) service.getAccessToken(code);
        return accessToken.getAccessToken();
    }

    public String getAccountData() throws IOException {
        String soqlQuery = "";
        try {
            soqlQuery = URLEncoder.encode("Select Id, Name from Account LIMIT 10", "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        String url = accessToken.getInstanceUrl() + "/services/data/v37.0/query?q=" + soqlQuery;
        final OAuthRequest request = new OAuthRequest(Verb.GET, url, service);
        request.addHeader("Authorization", "Bearer " + accessToken.getAccessToken());
        final Response response = request.send();
        return response.getBody();
    }

    public String getUserData() throws IOException {
        String url = accessToken.getInstanceUrl() + "/services/oauth2/userinfo";
        final OAuthRequest request = new OAuthRequest(Verb.GET, url, service);
        request.addHeader("Authorization", "Bearer " + accessToken.getAccessToken());
        final Response response = request.send();
        return response.getBody();
    }

}
