package team9.todo.utils;

import team9.todo.domain.User;

import javax.servlet.http.HttpSession;

public class HttpSessionUtils {
    private static final String USER_KEY = "sessionedUser";

    private HttpSessionUtils() {
    }

    public static boolean hasUser(HttpSession session) {
        Object userObject = session.getAttribute(USER_KEY);
        return userObject != null && userObject instanceof User;
    }

    public static void addUser(HttpSession session, User user) {
        session.setAttribute(USER_KEY, user);
    }

    public static User getUser(HttpSession session) {
        //추후에 로그인기능이 완성되면 사용할 코드입니다.
        /*
        Object userObject = session.getAttribute(USER_KEY);
        if (hasUser(session)) {
            return (User) userObject;
        }
        throw new NotAuthorizedException();
        */

        User user = new User("test", "test");
        user.setId(1L);
        return user;
    }

    public static boolean isAuthorized(Long userId, HttpSession session) {
        User user = getUser(session);
        return userId == user.getId();
    }
}
