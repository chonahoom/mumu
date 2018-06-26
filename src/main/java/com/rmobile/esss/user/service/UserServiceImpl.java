package com.rmobile.esss.user.service;

import com.rmobile.esss.user.domain.LoginDTO;
import com.rmobile.esss.user.domain.MemberVO;
import com.rmobile.esss.user.domain.UserVO;
import com.rmobile.esss.user.persistence.UserDAO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import javax.inject.Inject;
import java.util.Date;
import java.util.List;
import java.util.Objects;


@Service
public class UserServiceImpl implements UserService {
    @Inject
    private UserDAO userDAO;

    @Override
    public String checkExistingID(UserVO userVO){
        return userDAO.checkExistingID(userVO);
    }

    @Override
    public void register(UserVO userVO) {
        userDAO.register(userVO);
    }

    @Override
    public void modifyUser(UserVO userVO) {
        userDAO.updateUser(userVO);
    }

    @Transactional
    @Override
    public UserVO login(LoginDTO loginDTO) {
        return userDAO.login(loginDTO);
    }

    @Override
    public void keepLogin(int employeeNumber, String sessionId, Date next) {
        userDAO.keepLogin(employeeNumber, sessionId, next);
    }

    @Override
    public List<MemberVO> getMembersByEmployeeNumber(int employeeNumber) {
        return userDAO.getMembers(employeeNumber);
    }

    @Override
    public void inputSubmembers(MemberVO memberVO){
        if (Objects.isNull(memberVO)) {
            return;
        }
        int employeeNumber = memberVO.getEmployeeNumber();
        List<MemberVO> submembers = getMembersByEmployeeNumber(employeeNumber);
        if (CollectionUtils.isEmpty(submembers)) {
            return;
        }

        memberVO.setMembers(submembers);
        submembers.forEach(this::inputSubmembers);
    }




}
