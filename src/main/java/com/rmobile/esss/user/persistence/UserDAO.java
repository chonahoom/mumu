package com.rmobile.esss.user.persistence;

import com.rmobile.esss.user.domain.LoginDTO;
import com.rmobile.esss.user.domain.MemberVO;
import com.rmobile.esss.user.domain.UserVO;

import java.util.Date;
import java.util.List;

public interface UserDAO {

    String checkExistingID(UserVO userVO);

    void register(UserVO userVO);

    void updateUser(UserVO userVO);

    UserVO login(LoginDTO loginDTO);

    void keepLogin(int employeeNumber, String sessionId, Date next);

    List<MemberVO> getMembers(int employeeNumber);

}
