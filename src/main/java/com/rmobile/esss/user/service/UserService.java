package com.rmobile.esss.user.service;

import com.rmobile.esss.user.domain.LoginDTO;
import com.rmobile.esss.user.domain.MemberVO;
import com.rmobile.esss.user.domain.UserVO;

import java.util.Date;
import java.util.List;

public interface UserService {
    String checkExistingID(UserVO userVO);

    void register(UserVO userVO);

    void modifyUser(UserVO userVO);

    UserVO login(LoginDTO loginDTO);

    void keepLogin(int employeeNumber, String sessionId, Date next);

    List<MemberVO> getMembersByEmployeeNumber(int employeeNumber);

    void inputSubmembers(MemberVO memberVO);
}
