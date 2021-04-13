package team9.todo.exception;

public class NotAuthorizedException extends RuntimeException {
    public NotAuthorizedException() {
        super("권한이 없습니다.");
    }

    public NotAuthorizedException(String message) {
        super(message);
    }
}
