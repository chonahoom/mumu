package com.rmobile.esss.commons.paging;


public class Criteria {


    private int page;
    // Number of articles per page
    private int perPageNum;

    private Integer employeeNumber;

    public String getMemberName() {
        return memberName;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }

    private String memberName;

    public Integer getEmployeeNumber() {
        return employeeNumber;
    }

    public void setEmployeeNumber(Integer employeeNumber) {
        this.employeeNumber = employeeNumber;
    }


    // constructor : page Number 1, Number of articles per page 15
    public Criteria() {
        this.page = 1;
        this.perPageNum = 15;
    }

    public void setPage(int page) {

        if (page <= 0) {
            this.page = 1;
            return;
        }
        this.page = page;
    }

    public int getPage() {
        return page;
    }

    // For MyBatis SQLMapper
    public int getPageStart() {
        return (this.page - 1) * perPageNum;
    }

    // For MyBatis SQLMapper
    public int getPerPageNum() {
        return this.perPageNum;
    }

    @Override
    public String toString() {
        return "Criteria{" +
                "page=" + page +
                ", perPageNum=" + perPageNum +
                ", employeeNumber='" + employeeNumber + '\'' +
                ", memberName='" + memberName + '\'' +
                '}';
    }
}
