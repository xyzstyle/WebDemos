package com.xyz;

public class Circle {
    private int radius;

    public Circle() {
        radius = 1;
    }

    public int getRadius() {
        return radius;
    }

    public void setRadius(int radius) {
        this.radius = radius;
    }

    public double getCircleLength() {
        return 2.0 * Math.PI * radius;
    }

    public double getCircleArea() {
        return Math.PI * radius * radius;
    }
}
