package com.rmobile.esss.board.domain;

import java.util.Date;

public class BoardVO {
    private Integer historyNumber;
    private String historyWriter;
    private String historyWriterName;
    private String historyTitle;
    private Integer historyTerm;
    private Integer historyVersion;
    private Integer historyYear;
    private Date historyUpdatedDate;


    public Integer getHistoryNumber() {
        return historyNumber;
    }

    public void setHistoryNumber(Integer historyNumber) {
        this.historyNumber = historyNumber;
    }

    public String getHistoryWriter() {
        return historyWriter;
    }

    public void setHistoryWriter(String historyWriter) {
        this.historyWriter = historyWriter;
    }

    public String getHistoryWriterName() {
        return historyWriterName;
    }

    public void setHistoryWriterName(String historyWriterName) {
        this.historyWriterName = historyWriterName;
    }

    public String getHistoryTitle() {
        return historyTitle;
    }

    public void setHistoryTitle(String historyTitle) {
        this.historyTitle = historyTitle;
    }

    public Integer getHistoryTerm() {
        return historyTerm;
    }

    public void setHistoryTerm(Integer historyTerm) {
        this.historyTerm = historyTerm;
    }

    public Integer getHistoryVersion() {
        return historyVersion;
    }

    public void setHistoryVersion(Integer historyVersion) {
        this.historyVersion = historyVersion;
    }

    public Integer getHistoryYear() {
        return historyYear;
    }

    public void setHistoryYear(Integer historyYear) {
        this.historyYear = historyYear;
    }

    public Date getHistoryUpdatedDate() {
        return historyUpdatedDate;
    }

    public void setHistoryUpdatedDate(Date historyUpdatedDate) {
        this.historyUpdatedDate = historyUpdatedDate;
    }

    @Override
    public String toString() {
        return "BoardVO{" +
                "historyNumber=" + historyNumber +
                ", historyWriter='" + historyWriter + '\'' +
                ", historyTitle='" + historyTitle + '\'' +
                ", historyTerm=" + historyTerm +
                ", historyVersion=" + historyVersion +
                ", historyYear=" + historyYear +
                ", historyUpdatedDate=" + historyUpdatedDate +
                '}';
    }
}
