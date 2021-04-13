package com.example.todolist.web.utils;

import com.example.todolist.domain.user.User;

import javax.servlet.http.HttpSession;

public class HttpSessionUtils {
    public static final String USER_SESSION_KEY ="sessionedUser";

    public static void isLoginUser(HttpSession session) {
        if(session.getAttribute(USER_SESSION_KEY) == null) {
            throw new IllegalArgumentException();
        }
    }

    public static User getUserFromSession(HttpSession session) {
        isLoginUser(session);
        return (User) session.getAttribute(USER_SESSION_KEY);
    }
}
