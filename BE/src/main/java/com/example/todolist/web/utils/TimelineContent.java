package com.example.todolist.web.utils;

import com.example.todolist.domain.work.Work;
import com.example.todolist.web.dto.MoveWorkRequestDTO;

public class TimelineContent {

    final static String SAVE = " 등록하였습니다.";
    final static String UPDATE = " 수하였습니다.";
    final static String DELETE = " 삭제하였습니다.";
    final static String MOVE = " 이동하였습니다.";
    final static String TODO = "해야할 일";
    final static String DOING = "하고 있는 일";
    final static String DONE = "완료한 일";


    public static String makeTimelineContent(Work work, String method) {
        StringBuilder contentBuilder = new StringBuilder();
        contentBuilder.append(getStatus(work.getStatus()) + "에 ");
        contentBuilder.append(verifyJongsung(work.getTitle(), "을", "를"));


        switch(method) {
            case "save" :
                contentBuilder.append(SAVE);
            case "update" :
                contentBuilder.append(UPDATE);
            case "delete" :
                contentBuilder.append(DELETE);
        }

        return contentBuilder.toString();
    }

    public static String moveContent(Work work, MoveWorkRequestDTO workDTO) {
        StringBuilder contentBuilder = new StringBuilder();
        contentBuilder.append(verifyJongsung(work.getTitle(), "을", "를"));
        contentBuilder.append(" " + getStatus(work.getStatus()) + "에서 ");
        contentBuilder.append(getStatus(workDTO.toEntity().getStatus()) + "로 " + MOVE);
        return contentBuilder.toString();
    }

    public static String getStatus(Status status) {
        switch(status) {
            case TODO :
                return  TODO;
            case DOING :
                return DOING;
            case DONE :
                return  DONE;
            default :
                return "";
        }
    }

    public static final String verifyJongsung(String title, String firstValue, String secondValue) {
        char lastTitle = title.charAt(title.length() - 1);
        //한글의 제일 처음과 끝의 범위밖일 경우는 오류
        if (lastTitle < 0xAC00 || lastTitle > 0xD7A3) {
           return title;
        }
        String seletedValue = (lastTitle - 0xAC00) % 28 > 0 ? firstValue : secondValue;

        return title + seletedValue;
    }


}
