package com.example.todolist.web;

import com.example.todolist.domain.timeline.Timeline;
import com.example.todolist.domain.timeline.TimelineRepository;
import com.example.todolist.domain.user.UserRepository;
import com.example.todolist.domain.user.User;
import com.example.todolist.domain.work.Work;
import com.example.todolist.domain.work.WorkRepository;
import org.springframework.web.bind.annotation.*;


@RestController
public class UserController {

    private final UserRepository userRepository;
    private final WorkRepository workRepository;
    private final TimelineRepository timelineRepository;

    public UserController(UserRepository userRepository, WorkRepository workRepository, TimelineRepository timelineRepository) {
        this.userRepository = userRepository;
        this.workRepository = workRepository;
        this.timelineRepository = timelineRepository;
    }

    User user = new User("eno", "1234", "enojung", "naver");


    @GetMapping("/test")
    public User test() {
        User saveUser = userRepository.save(user);
        System.out.println(saveUser);
        System.out.println("userRepository.findById(1L)" + userRepository.findById(1L).get());
        return saveUser;
    }

    @GetMapping("/worktest")
    public Work test2() {
        Work work = new Work("firstwork", "dodododo", 2, user.getId());
        Work saveWork = workRepository.save(work);
        System.out.println(saveWork);
        String description = saveWork.getTitle() + " status : " + saveWork.getStatus();
        Timeline timeline = new Timeline(description, 1L);
        Timeline saveTimeline = timelineRepository.save(timeline);
        System.out.println("workRepository.findById(1L) = " + workRepository.findById(1L).get());
        System.out.println("savetimeline : " + saveTimeline);
        System.out.println("timelineRepository.findById(1L).get() = " + timelineRepository.findById(1L).get());
        return saveWork;
    }




}
