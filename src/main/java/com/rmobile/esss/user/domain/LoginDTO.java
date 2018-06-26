package com.rmobile.esss.user.domain;

public class LoginDTO {

    private int employeeNumber;
    private String password;
    private String name;

    public int getEmployeeNumber() {
        return employeeNumber;
    }

    public void setEmployeeNumber(int employeeNumber) {
        this.employeeNumber = employeeNumber;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String toString() {
        return "LoginDTO{" +
                "employeeNumber='" + employeeNumber + '\'' +
                ", password'" + password + '\'' +
                ", name'" + name + '\'' +
                '}';
    }
}
