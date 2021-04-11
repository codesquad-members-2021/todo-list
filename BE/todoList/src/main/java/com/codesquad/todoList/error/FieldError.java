package com.codesquad.todoList.error;

import lombok.AllArgsConstructor;
import lombok.Getter;
import org.springframework.validation.BindingResult;

import java.util.List;
import java.util.stream.Collectors;

@Getter
@AllArgsConstructor
public class FieldError {

    private final String field;
    private final String value;
    private final String reason;

    public static FieldError of(String field, String value, String reason) {
        return new FieldError(field, value, reason);
    }

    public static FieldError of(org.springframework.validation.FieldError fieldError) {
        return FieldError.of(
                fieldError.getField(),
                fieldError.getRejectedValue() == null ? "" : fieldError.getRejectedValue().toString(),
                fieldError.getDefaultMessage()
        );
    }

    public static List<FieldError> of(BindingResult bindingResult) {
        return bindingResult.getFieldErrors().stream()
                .map(FieldError::of)
                .collect(Collectors.toList());
    }

}
