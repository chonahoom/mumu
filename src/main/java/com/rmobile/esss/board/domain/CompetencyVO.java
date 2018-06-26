package com.rmobile.esss.board.domain;

public class CompetencyVO {
    private Integer competencyNumber;
    private Integer historyNumber;
    private Integer competencyTitle;
    private String overallPerformanceComment;
    private Integer competencyRate;

    public Integer getCompetencyNumber() {
        return competencyNumber;
    }

    public void setCompetencyNumber(Integer competencyNumber) {
        this.competencyNumber = competencyNumber;
    }

    public Integer getHistoryNumber() {
        return historyNumber;
    }

    public void setHistoryNumber(Integer historyNumber) {
        this.historyNumber = historyNumber;
    }

    public Integer getCompetencyTitle() {
        return competencyTitle;
    }

    public void setCompetencyTitle(Integer competencyTitle) {
        this.competencyTitle = competencyTitle;
    }

    public String getOverallPerformanceComment() {
        return overallPerformanceComment;
    }

    public void setOverallPerformanceComment(String overallPerformanceComment) {
        this.overallPerformanceComment = overallPerformanceComment;
    }

    public Integer getCompetencyRate() {
        return competencyRate;
    }

    public void setCompetencyRate(Integer competencyRate) {
        this.competencyRate = competencyRate;
    }

    @Override
    public String toString() {
        return "CompetencyVO{" +
                "competencyNumber=" + competencyNumber +
                ", historyNumber=" + historyNumber +
                ", competencyTitle=" + competencyTitle +
                ", overallPerformanceComment='" + overallPerformanceComment + '\'' +
                ", competencyRate=" + competencyRate +
                '}';
    }
}
