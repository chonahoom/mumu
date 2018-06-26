package com.rmobile.esss.user.persistence;

import com.rmobile.esss.user.domain.LoginDTO;
import com.rmobile.esss.user.domain.MemberVO;
import com.rmobile.esss.user.domain.UserVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class UserDAOImpl implements UserDAO {

    @Inject
    private SqlSession sqlSession;

    private static final String NAMESPACE = "com.rmobile.esss.mapper.UserMapper";

    @Override
    public String checkExistingID(UserVO userVO) {
        Object o = sqlSession.selectOne(NAMESPACE + ".checkExistingId", userVO);
        if (o != null) {
            return "exist";
        } else {
            return "pass";
        }

    }

    //register
    @Override
    public void register(UserVO userVO) {
        sqlSession.insert(NAMESPACE + ".register", userVO);
    }

    //update user information
    @Override
    public void updateUser(UserVO userVO) {
        sqlSession.update(NAMESPACE + ".updateUser", userVO);
    }


    //login
    @Override
    public UserVO login(LoginDTO loginDTO) {
        return sqlSession.selectOne(NAMESPACE + ".login", loginDTO);
    }

    //read - members
    @Override
    public List<MemberVO> getMembers(int employeeNumber) {
        return sqlSession.selectList(NAMESPACE + ".getMembers", employeeNumber);
    }

    //keeping login status
    @Override
    public void keepLogin(int employeeNumber, String sessionId, Date next) {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("employeeNumber", employeeNumber);
        paramMap.put("sessionId", sessionId);
        paramMap.put("next", next);

        sqlSession.update(NAMESPACE + ".keepLogin", paramMap);
    }
}
