package com.codesquad.todo.web.util;

public class VerifyUtil {

    private VerifyUtil() {
    }

    public static boolean isEmpty(String testString) {
        return testString == null || testString.isEmpty();
    }
}
