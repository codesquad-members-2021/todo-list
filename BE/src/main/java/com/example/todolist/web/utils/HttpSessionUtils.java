package com.example.todolist.web.utils;

import com.example.todolist.domain.user.User;
import com.example.todolist.exception.IllegalUserAccessException;

import javax.servlet.http.HttpSession;

public class HttpSessionUtils {
    public static final String USER_SESSION_KEY ="sessionUser";

    public static void isLoginUser(HttpSession session) {
        if(session.getAttribute(USER_SESSION_KEY) == null) {
            throw new IllegalUserAccessException();
        }
    }

    public static User getUserFromSession(HttpSession session) {
        isLoginUser(session);
        return (User) session.getAttribute(USER_SESSION_KEY);
    }
}
