package com.liuyan.dto;

import java.util.Date;

/**
 * Created by liuyan on 2017/7/30.
 */
public class Spittle {
    private final String message;
    private final Date time;
    private Double latitude;
    private Double longitude;
    public Spittle(String message, Date time) {
        this(message, time, null, null);
    }

    public Spittle(String message, Date time, Double latitude, Double longitude) {
        this.message = message;
        this.time = time;
        this.latitude = latitude;
        this.longitude = longitude;
    }



    public String getMessage() {
        return message;
    }

    public Date getTime() {
        return time;
    }

    public Double getLatitude() {
        return latitude;
    }

    public void setLatitude(Double latitude) {
        this.latitude = latitude;
    }

    public Double getLongitude() {
        return longitude;
    }

    public void setLongitude(Double longitude) {
        this.longitude = longitude;
    }
}
