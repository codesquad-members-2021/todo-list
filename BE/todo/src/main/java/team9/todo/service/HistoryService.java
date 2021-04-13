package team9.todo.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team9.todo.domain.HistoryWithCardTitle;
import team9.todo.domain.User;
import team9.todo.repository.HistoryWithCardTitleRepository;

import java.util.List;

@Service
public class HistoryService {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    private final HistoryWithCardTitleRepository historyWithCardTitleRepository;

    @Autowired
    public HistoryService(HistoryWithCardTitleRepository historyWithCardTitleRepository) {
        this.historyWithCardTitleRepository = historyWithCardTitleRepository;
    }

    public List<HistoryWithCardTitle> getHistoryOfUser(User user) {
        logger.debug("history 목록 요청");
        List<HistoryWithCardTitle> historyList = historyWithCardTitleRepository.findAllByUserId(user.getId());
        return historyList;
    }
}
