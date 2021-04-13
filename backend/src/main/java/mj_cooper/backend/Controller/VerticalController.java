package mj_cooper.backend.Controller;

import mj_cooper.backend.domain.Todo;
import mj_cooper.backend.domain.User;
import mj_cooper.backend.domain.Vertical;
import mj_cooper.backend.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/verticals")
public class VerticalController {

    @Autowired
    UserRepository userRepository;

    public VerticalController() {
    }

    @GetMapping
    public List<Vertical> getAllVerticals() {
        User user = userRepository.findById(1L).get();

        return user.getVerticals();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Vertical> getTodoById(@PathVariable(value = "id") final Long id) {

        User user = userRepository.findById(1L).get();

        return ResponseEntity.ok().body(user.getVertical(id));
    }

//    @PutMapping("/{id}")
//    @ResponseStatus(HttpStatus.OK)
//    public void updateTodo(@RequestBody final Vertical vertical,
//                           @PathVariable(value = "id") final Long id) {
//
//        User user = userRepository.findById(1L).get();
//        Vertical foundVertical = user.getVertical(id);
//
//        foundVertical.set(todo.getTitle());
//
//        userRepository.save(user);
//    }
}
