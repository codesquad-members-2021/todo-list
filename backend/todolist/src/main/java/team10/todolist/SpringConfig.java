package team10.todolist;

import org.springframework.context.annotation.Bean;
import team10.todolist.repository.BoardJdbcRepository;
import team10.todolist.repository.BoardRepository;

import javax.sql.DataSource;

public class SpringConfig {
    private final DataSource dataSource;
    public SpringConfig(DataSource dataSource) { this.dataSource = dataSource;
    }
    //@Bean
    //public MemberService memberService() {
    //    return new MemberService(memberRepository());
    //}
    @Bean
    public BoardRepository boardRepository() {
        //return new MemoryMemberRepository();
        return new BoardJdbcRepository(dataSource);
    }

}
