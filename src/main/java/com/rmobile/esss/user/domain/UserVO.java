package com.rmobile.esss.user.domain;

public class UserVO {

    private Integer employeeNumber;
    private String name;
    private String password;
    private Integer supervisorNumber;


    public int getEmployeeNumber() {
        return employeeNumber;
    }

    public void setEmployeeNumber(int employeeNumber) {
        this.employeeNumber = employeeNumber;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getSupervisorNumber() {
        return supervisorNumber;
    }

    public void setSupervisorNumber(int supervisorNumber) {
        this.supervisorNumber = supervisorNumber;
    }


    @Override
    public String toString() {
        return "UserVO{" +
                "employeeNumber='" + employeeNumber + '\'' +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", supervisorNumber=" + supervisorNumber +
                '}';
    }
}
