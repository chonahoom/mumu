package com.rmobile.esss.user.controller;

import com.rmobile.esss.user.domain.LoginDTO;
import com.rmobile.esss.user.domain.MemberVO;
import com.rmobile.esss.user.domain.UserVO;
import com.rmobile.esss.user.service.UserService;
import com.rmobile.esss.commons.util.RSACreateAndDecryption;
import com.rmobile.esss.commons.util.RSAUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.security.PrivateKey;
import java.util.Date;
import java.util.List;
import java.util.Objects;

@Controller
@RequestMapping("/user")
public class UserController {
    @Inject
    private UserService userService;

    //go to register page
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String regiesterGET() {
        return "user/register";
    }

    //register processing
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String regsterPOST(UserVO userVO, RedirectAttributes redirectAttributes) {
        // id confirm
        if (userService.checkExistingID(userVO) == "exist") {
            redirectAttributes.addFlashAttribute("msg", "EXISTIED");
            return "redirect:/user/register";
        }

        userService.register(userVO);
        redirectAttributes.addFlashAttribute("msg", "REGISTERED");

        return "redirect:/user/login";
    }

    //go to edit member information page
    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String userInfoModifyGET() {
        return "user/edit";
    }

    // edit member information processing
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String userInfoModify(UserVO userVO, HttpSession session, RedirectAttributes redirectAttributes) {

        userService.modifyUser(userVO);
        session.setAttribute("userLoginInfo", userVO);
        redirectAttributes.addFlashAttribute("msg", "SUCCESS");
        return "redirect:/";
    }

    //go to login page
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginGET(@ModelAttribute("loginDTO") LoginDTO loginDTO) {
        return "user/login";
    }

    //login processing
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String loginPOST(LoginDTO loginDTO, HttpSession session, Model model, RedirectAttributes redirectAttributes) {
        // Employee Number, Password confirm
        UserVO userVO = userService.login(loginDTO);

        //incorrect information
        if (userVO == null) {
            redirectAttributes.addFlashAttribute("msg", "FAILURE");
            return "redirect:/user/login";
        }

        //correct information
        model.addAttribute("userVO", userVO);
        session.setAttribute("userLoginInfo", userVO);

        //15hour
        int amount = 60 * 60 * 15;
        Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));

        userService.keepLogin(userVO.getEmployeeNumber(), session.getId(), sessionLimit);


        return "home";

    }


    //memeber list
    @RequestMapping(value = "/member-sheet-historys", method = RequestMethod.GET)
    public String getMemberListByLoginEmployeeNumber(HttpSession session, Model model) {
        RSACreateAndDecryption rsaCreateAndDecryption = new RSACreateAndDecryption();
        PrivateKey key = (PrivateKey) session.getAttribute("RSAprivateKey");

        // Create key
        RSAUtil rsaUtilObj = new RSAUtil();
        rsaCreateAndDecryption.createRSA(key, session, rsaUtilObj, model);


        Object userObj = session.getAttribute("userLoginInfo");
        UserVO userVO = (UserVO) userObj;
        final MemberVO loginMember = MemberVO.build(userVO);

        userService.inputSubmembers(loginMember);

        model.addAttribute("memberVO", loginMember);

        return "board/members";
    }

    // login processing
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        Object object = session.getAttribute("userLoginInfo");
        if (object != null) {
            UserVO userVO = (UserVO) object;
            // delete session information
            session.removeAttribute("userLoginInfo");
            // reset session information
            session.invalidate();
            userService.keepLogin(userVO.getEmployeeNumber(), session.getId(), new Date());
        }
        return "user/login";
    }


}
