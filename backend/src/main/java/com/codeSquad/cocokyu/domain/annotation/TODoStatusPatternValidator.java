package com.codeSquad.cocokyu.domain.annotation;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class TODoStatusPatternValidator implements ConstraintValidator<ToDoStatusPattern, Enum<?>> {
    private Pattern pattern = Pattern.compile("TODO|DOING|DONE|DELETED");

    @Override
    public boolean isValid(Enum<?> value, ConstraintValidatorContext context) {
        if (value == null) {
            return false;
        }
        Matcher m = pattern.matcher(value.name());
        return m.matches();
    }
}
