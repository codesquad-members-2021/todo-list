package team10.todolist;

import org.springframework.context.annotation.Bean;
import team10.todolist.repository.CardJdbcRepository;
import team10.todolist.repository.CardRepository;

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
    public CardRepository boardRepository() {
        //return new MemoryMemberRepository();
        return new CardJdbcRepository(dataSource);
    }

}
