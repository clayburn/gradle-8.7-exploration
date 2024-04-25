package com.example;

public class Java22Features {
    @SuppressWarnings("DataFlowIssue")
    public static void main(String[] args) {
        Object obj = "Hello";

        String result = switch (obj) {
            case String s -> "String: " + s;
            case Integer i -> "Integer: " + i;
            default -> "Other";
        };

        System.out.println(result);
    }
}
