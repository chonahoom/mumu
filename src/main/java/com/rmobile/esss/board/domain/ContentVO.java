package com.rmobile.esss.board.domain;

import java.util.ArrayList;

// 게시글 도메인 객체 클래스
public class ContentVO {

    private Integer contentNumber;
    private Integer historyNumber;
    private Integer taskNumber;
    private Integer taskType;
    private Integer taskWeight;
    private String taskDate;
    private String taskGoalTitle;
    private String taskGoalDescription;
    private String taskCompetency;
    private Integer taskRate;
    private String taskEvaluationComment;

    //For view data. (belows data is formed ArrayList)
    private ArrayList<Integer> contentNumberTemp = new ArrayList<>();
    private ArrayList<Integer> taskTypeTemp = new ArrayList<>();
    private ArrayList<Integer> taskWeightTemp = new ArrayList<>();
    private ArrayList<Integer> taskRateTemp = new ArrayList<>();
    private ArrayList<String> taskDateTemp = new ArrayList<>();
    private ArrayList<String> taskGoalTitleTemp = new ArrayList<>();
    private ArrayList<String> taskGoalDescriptionTemp = new ArrayList<>();
    private ArrayList<String> taskEvaluationCommentTemp = new ArrayList<>();

    public Integer getContentNumber() {
        return contentNumber;
    }

    public void setContentNumber(Integer contentNumber) {
        this.contentNumber = contentNumber;
    }

    public Integer getHistoryNumber() {
        return historyNumber;
    }

    public void setHistoryNumber(Integer historyNumber) {
        this.historyNumber = historyNumber;
    }

    public Integer getTaskNumber() {
        return taskNumber;
    }

    public void setTaskNumber(Integer taskNumber) {
        this.taskNumber = taskNumber;
    }

    public Integer getTaskType() {
        return taskType;
    }

    public void setTaskType(Integer taskType) {
        this.taskType = taskType;
    }

    public Integer getTaskWeight() {
        return taskWeight;
    }

    public void setTaskWeight(Integer taskWeight) {
        this.taskWeight = taskWeight;
    }

    public String getTaskDate() {
        return taskDate;
    }

    public void setTaskDate(String taskDate) {
        this.taskDate = taskDate;
    }

    public String getTaskGoalTitle() {
        return taskGoalTitle;
    }

    public void setTaskGoalTitle(String taskGoalTitle) {
        this.taskGoalTitle = taskGoalTitle;
    }

    public String getTaskGoalDescription() {
        return taskGoalDescription;
    }

    public void setTaskGoalDescription(String taskGoalDescription) {
        this.taskGoalDescription = taskGoalDescription;
    }

    public String getTaskCompetency() {
        return taskCompetency;
    }

    public void setTaskCompetency(String taskCompetency) {
        this.taskCompetency = taskCompetency;
    }

    public Integer getTaskRate() {
        return taskRate;
    }

    public void setTaskRate(Integer taskRate) {
        this.taskRate = taskRate;
    }

    public String getTaskEvaluationComment() {
        return taskEvaluationComment;
    }

    public void setTaskEvaluationComment(String taskEvaluationComment) {
        this.taskEvaluationComment = taskEvaluationComment;
    }

    public ArrayList<Integer> getContentNumberTemp() {
        return contentNumberTemp;
    }

    public void setContentNumberTemp(ArrayList<Integer> contentNumberTemp) {
        this.contentNumberTemp = contentNumberTemp;
    }

    public ArrayList<Integer> getTaskTypeTemp() {
        return taskTypeTemp;
    }

    public void setTaskTypeTemp(ArrayList<Integer> taskTypeTemp) {
        this.taskTypeTemp = taskTypeTemp;
    }

    public ArrayList<Integer> getTaskWeightTemp() {
        return taskWeightTemp;
    }

    public void setTaskWeightTemp(ArrayList<Integer> taskWeightTemp) {
        this.taskWeightTemp = taskWeightTemp;
    }

    public ArrayList<Integer> getTaskRateTemp() {
        return taskRateTemp;
    }

    public void setTaskRateTemp(ArrayList<Integer> taskRateTemp) {
        this.taskRateTemp = taskRateTemp;
    }

    public ArrayList<String> getTaskDateTemp() {
        return taskDateTemp;
    }

    public void setTaskDateTemp(ArrayList<String> taskDateTemp) {
        this.taskDateTemp = taskDateTemp;
    }

    public ArrayList<String> getTaskGoalTitleTemp() {
        return taskGoalTitleTemp;
    }

    public void setTaskGoalTitleTemp(ArrayList<String> taskGoalTitleTemp) {
        this.taskGoalTitleTemp = taskGoalTitleTemp;
    }

    public ArrayList<String> getTaskGoalDescriptionTemp() {
        return taskGoalDescriptionTemp;
    }

    public void setTaskGoalDescriptionTemp(ArrayList<String> taskGoalDescriptionTemp) {
        this.taskGoalDescriptionTemp = taskGoalDescriptionTemp;
    }

    public ArrayList<String> getTaskEvaluationCommentTemp() {
        return taskEvaluationCommentTemp;
    }

    public void setTaskEvaluationCommentTemp(ArrayList<String> taskEvaluationCommentTemp) {
        this.taskEvaluationCommentTemp = taskEvaluationCommentTemp;
    }

    @Override
    public String toString() {
        return "ContentVO{" +
                "contentNumber=" + contentNumber +
                ",historyNumber=" + historyNumber +
                ",taskNumber=" + taskNumber +
                ",taskType=" + taskType +
                ",taskWeight=" + taskWeight +
                ", taskDate='" + taskDate + '\'' +
                ", taskGoalTitle='" + taskGoalTitle + '\'' +
                ", taskGoalDescription='" + taskGoalDescription + '\'' +
                ", taskCompetency='" + taskCompetency + '\'' +
                ",taskRate=" + taskRate +
                ", taskEvaluationComment='" + taskEvaluationComment + '\'' +
                '}';
    }
}
