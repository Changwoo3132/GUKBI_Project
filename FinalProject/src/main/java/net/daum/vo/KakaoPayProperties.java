package net.daum.vo;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Component
@ConfigurationProperties(prefix = "kakao")
public class KakaoPayProperties {
    private String clientId;
    private String clientSecret;
    private String secretKey;
    private String secretKeyDev;

    // Getters and Setters
    public String getClientId() {
        return clientId;
    }

    public void setClientId(String clientId) {
        this.clientId = clientId;
    }

    public String getClientSecret() {
        return clientSecret;
    }

    public void setClientSecret(String clientSecret) {
        this.clientSecret = clientSecret;
    }

    public String getSecretKey() {
        return secretKey;
    }

    public void setSecretKey(String secretKey) {
        this.secretKey = secretKey;
    }

    public String getSecretKeyDev() {
        return secretKeyDev;
    }

    public void setSecretKeyDev(String secretKeyDev) {
        this.secretKeyDev = secretKeyDev;
    }
}
