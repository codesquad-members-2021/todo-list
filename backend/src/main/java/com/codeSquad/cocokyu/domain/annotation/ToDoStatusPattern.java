package com.codeSquad.cocokyu.domain.annotation;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import static java.lang.annotation.ElementType.FIELD;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

@Target({FIELD})
@Retention(RUNTIME)
@Constraint(validatedBy = TODoStatusPatternValidator.class)
public @interface ToDoStatusPattern {

    String message() default "must match \"{regexp}\"";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}
