package com.rmobile.esss.board.domain;

import java.util.ArrayList;


public class MatchingVO {
    private ArrayList<String> taskType = new ArrayList<>();
    private ArrayList<String> taskRate = new ArrayList<>();

    private String competencyTitle;
    private String competencyRate;

    public ArrayList<String> getTaskType() {
        return taskType;
    }

    public void setTaskType(Integer taskType) {
        switch (taskType) {
            case 0:
                this.taskType.add("Main Task");
                break;
            case 1:
                this.taskType.add("Additinal Task");
                break;
            default:
                this.taskType.add(" ");
                break;
        }
    }

    public ArrayList<String> getTaskRate() {
        return taskRate;
    }

    public void setTaskRate(Integer taskRate) {
        switch (taskRate) {
            case 7:
                this.taskRate.add("7.0 - 140% and above of expected level");
                break;
            case 6:
                this.taskRate.add("6.0 - Between 120% - 140% of expected level");
                break;
            case 5:
                this.taskRate.add("5.0 - Between 110% - 120% of expected level");
                break;
            case 4:
                this.taskRate.add("4.0 - Between 100% - 110% of expected level");
                break;
            case 3:
                this.taskRate.add("3.0 - Between 90% - 100% of expected level");
                break;
            case 2:
                this.taskRate.add("2.0 - Between 80% - 90% of expected level");
                break;
            case 1:
                this.taskRate.add("1.0 - Less than 80% of expected level");
                break;
            default:
                this.taskRate.add(" ");
                break;
        }

    }

    public String getCompetencyTitle() {
        return competencyTitle;
    }

    public void setCompetencyTitle(Integer competencyTitle) {
        switch (competencyTitle) {
            case 5:
                this.competencyTitle = "Always Improve, Always Advance";
                break;
            case 4:
                this.competencyTitle = "Passionately Professional";
                break;
            case 3:
                this.competencyTitle = "Hypothesize → Practice → Validate → Shikumika";
                break;
            case 2:
                this.competencyTitle = "Maximize Customer Satisfaction";
                break;
            case 1:
                this.competencyTitle = "Speed!! Speed! Speed!!";
                break;
            default:
                this.competencyTitle = "";
                break;
        }
    }

    public String getCompetencyRate() {
        return competencyRate;
    }

    public void setCompetencyRate(Integer competencyRate) {
        switch (competencyRate) {
            case 5:
                this.competencyRate = "5.0 - Consistently meets expectations required at the next grade level or higher.";
                break;
            case 4:
                this.competencyRate = "4.0 - Meets expectations in one’s current grade and sometimes exceeds expectations at the next grade level.";
                break;
            case 3:
                this.competencyRate = "3.0 - Consistently meets expectations required in one's grade.";
                break;
            case 2:
                this.competencyRate = "2.0 - Inconsistently meets expectations required in one's grade.";
                break;
            case 1:
                this.competencyRate = "1.0 - Performance is at a level which is one grade below or more their current level.";
                break;
            default:
                this.competencyRate = "";
                break;
        }
    }

    @Override
    public String toString() {
        return "BoardVO{" +
                ",taskType=" + taskType + '\'' +
                ",taskRate=" + taskRate + '\'' +
                ",competencyTitle=" + competencyTitle + '\'' +
                ",competencyRate=" + competencyRate + '\'' +
                '}';
    }
}
