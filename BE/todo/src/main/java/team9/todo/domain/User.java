package team9.todo.domain;

import org.springframework.data.annotation.Id;

import java.time.LocalDate;

public class User {
    @Id
    private Long id;

    private String email;
    private String name;
    private LocalDate createdDate;

    public void setEmail(String email) {
        this.email = email;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", email='" + email + '\'' +
                ", name='" + name + '\'' +
                ", createdDate=" + createdDate +
                '}';
    }
}
