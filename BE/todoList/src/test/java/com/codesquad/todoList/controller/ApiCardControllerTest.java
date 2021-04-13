package com.codesquad.todoList.controller;

import com.codesquad.todoList.entity.Card;
import com.codesquad.todoList.entity.Columns;
import com.codesquad.todoList.error.ErrorCode;
import com.codesquad.todoList.error.ErrorResponse;
import com.codesquad.todoList.service.ColumnService;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.web.servlet.MockMvc;
import sun.nio.cs.UTF_8;

import java.time.LocalDateTime;
import java.util.List;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;


@SpringBootTest
@AutoConfigureMockMvc
public class ApiCardControllerTest {

    @Autowired
    MockMvc mockMvc;

    @Autowired
    ColumnService columnService;

    @Autowired
    ObjectMapper objectMapper;

    @BeforeEach
    void each() {
        Columns columns =  new Columns();
        columns.setName("TODO");
        columnService.addColumn(columns);
    }

    @Test
    @DisplayName("정상적으로 카드를 추가할시 HTTP_STATUS 200 이 나오는지 확인한다.")
    void addCard() throws Exception {

        String content = "{ \"title\" : \"GOOD\", \"content\" : \"good\", \"author\" : \"web\" }";

        mockMvc.perform(post("/columns/1/cards")
                .content(content)
                .contentType(MediaType.APPLICATION_JSON)
                .accept(MediaType.APPLICATION_JSON))
                .andDo(print())
                .andExpect(status().isOk());
    }

    @Test
    @DisplayName("카드의 Title 이 없을시 Bad Request 가 나오는지 확인한다.")
    void blankCardTitleTest() throws Exception {
        String content = "{ \"title\" : \"\", \"content\" : \"good\", \"author\" : \"web\" }";

        mockMvc.perform(post("/columns/1/cards")
                .content(content)
                .contentType(MediaType.APPLICATION_JSON)
                .accept(MediaType.APPLICATION_JSON))
                .andDo(print())
                .andExpect(status().isBadRequest());
    }

    @Test
    @DisplayName("카드의 Title 이 50 자리를 초과할시 Bad Request 가 나오는지 확인한다.")
    void MaxCardTitleTest() throws Exception {

        StringBuilder maxContent = new StringBuilder();

        for(int i = 0; i <50; i++) {
            maxContent.append(i);
        }

        String content = "{ \"title\" : \""+maxContent.toString()+"\", \"content\" : \"good\", \"author\" : \"web\" }";

        mockMvc.perform(post("/columns/1/cards")
                .content(content)
                .contentType(MediaType.APPLICATION_JSON)
                .accept(MediaType.APPLICATION_JSON))
                .andDo(print())
                .andExpect(status().isBadRequest());
    }

    @Test
    @DisplayName("카드의 Content 이 없을시 Bad Request 가 나오는지 확인한다.")
    void blankCardContentTest() throws Exception {
        String content = "{ \"title\" : \"GOOD\", \"content\" : \"\", \"author\" : \"web\" }";

        mockMvc.perform(post("/columns/1/cards")
                .content(content)
                .contentType(MediaType.APPLICATION_JSON)
                .accept(MediaType.APPLICATION_JSON))
                .andDo(print())
                .andExpect(status().isBadRequest());
    }

    @Test
    @DisplayName("카드의 Content 이 500 초과할시 Bad Request 가 나오는지 확인한다.")
    void maxCardContentTest() throws Exception {

        StringBuilder maxContent = new StringBuilder();

        for(int i = 0; i <250; i++) {
            maxContent.append(i);
        }

        String content = "{ \"title\" : \"GOOD\", \"content\" : \""+maxContent.toString()+"\", \"author\" : \"web\" }";

        mockMvc.perform(post("/columns/1/cards")
                .content(content)
                .contentType(MediaType.APPLICATION_JSON)
                .accept(MediaType.APPLICATION_JSON))
                .andDo(print())
                .andExpect(status().isBadRequest());
    }

    @Test
    @DisplayName("카드의 Author 가 없을시 Bad Request 가 나오는지 확인한다.")
    void blankCardAuthorTest() throws Exception {
        String content = "{ \"title\" : \"GOOD\", \"content\" : \"good\", \"author\" : \"\" }";

        mockMvc.perform(post("/columns/1/cards")
                .content(content)
                .contentType(MediaType.APPLICATION_JSON)
                .accept(MediaType.APPLICATION_JSON))
                .andDo(print())
                .andExpect(status().isBadRequest());
    }

    @Test
    @DisplayName("카드의 Author 가 30자리 이상일시 Bad Request 가 나오는지 확인한다.")
    void maxCardAuthorTest() throws Exception {
        StringBuilder maxContent = new StringBuilder();

        for(int i = 0; i <25; i++) {
            maxContent.append(i);
        }

        String content = "{ \"title\" : \"GOOD\", \"content\" : \"good\", \"author\" : \""+maxContent.toString()+"\" }";

        mockMvc.perform(post("/columns/1/cards")
                .content(content)
                .contentType(MediaType.APPLICATION_JSON)
                .accept(MediaType.APPLICATION_JSON))
                .andDo(print())
                .andExpect(status().isBadRequest());
    }

    @Test
    @DisplayName("카드가 정상적으로 수정되는지 확인한다.")
    void updateCard() throws Exception {

        columnService.addCard(1L, Card.of("BEFORE", "good", "roach"));

        String updateContent = "{ \"title\" : \"UPDATE\", \"content\" : \"good\", \"author\" : \"roach\" }";

        mockMvc.perform(put("/columns/1/cards/1")
                .content(updateContent)
                .contentType(MediaType.APPLICATION_JSON)
                .accept(MediaType.APPLICATION_JSON))
                .andDo(print())
                .andExpect(status().isOk());
    }

    @Test
    @DisplayName("카드가 업데이트간 업데이트할 카드를 찾지 못할시 NotFoundError 가 발생하는지 확인한다.")
    void noteFoundCard() throws Exception {

        columnService.addCard(1L, Card.of("BEFORE", "good", "roach"));

        String updateContent = "{ \"title\" : \"UPDATE\", \"content\" : \"good\", \"author\" : \"roach\" }";

        mockMvc.perform(put("/columns/1/cards/100")
                .content(updateContent)
                .contentType(MediaType.APPLICATION_JSON)
                .accept(MediaType.APPLICATION_JSON))
                .andDo(print())
                .andExpect(status().isNotFound());
    }

    @Test
    @DisplayName("카드가 정상적으로 삭제되는지 확인한다.")
    void deleteCard() throws Exception {
        columnService.addCard(1L, Card.of("BEFORE", "good", "roach"));
        mockMvc.perform(delete("/columns/1/cards/1")).andExpect(status().isOk());
    }

}
