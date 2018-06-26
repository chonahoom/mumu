package com.rmobile.esss.user.domain;


import java.util.ArrayList;
import java.util.List;

public class MemberVO {
    private int employeeNumber;
    private String name;
    private List<MemberVO> members = new ArrayList<>();

    public static MemberVO build(UserVO userVO) {
        MemberVO memberVO = new MemberVO();

        memberVO.employeeNumber = userVO.getEmployeeNumber();
        memberVO.name = userVO.getName();

        return memberVO;
    }

    public List<MemberVO> getMembers() {
        return members;
    }

    public void setMembers(List<MemberVO> members) {
        this.members.addAll(members);
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getEmployeeNumber() {
        return employeeNumber;
    }

    public void setEmployeeNumber(int employeeNumber) {
        this.employeeNumber = employeeNumber;
    }

    @Override
    public String toString() {
        return "MemberVO{" +
                ", employeeNumber='" + employeeNumber +
                ", Members='" + members +
                ", name='" + name + '\'' +
                '}';
    }
}
