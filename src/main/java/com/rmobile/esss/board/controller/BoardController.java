package com.rmobile.esss.board.controller;

import com.rmobile.esss.board.domain.BoardVO;
import com.rmobile.esss.board.domain.CompetencyVO;
import com.rmobile.esss.board.domain.ContentVO;
import com.rmobile.esss.board.domain.MatchingVO;
import com.rmobile.esss.board.service.BoardService;
import com.rmobile.esss.commons.paging.Criteria;
import com.rmobile.esss.commons.paging.PageMaker;
import com.rmobile.esss.commons.util.RSACreateAndDecryption;
import com.rmobile.esss.commons.util.RSAUtil;
import com.rmobile.esss.user.domain.UserVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.security.PrivateKey;

@Controller
@RequestMapping("/board")
public class BoardController {

    @Inject
    private BoardService boardService;

    // input sheet page
    @RequestMapping(value = "/sheets", method = RequestMethod.GET)
    public String registerSheetGET() {

        return "board/sheets";
    }


    // input processing
    @RequestMapping(value = "/sheets", method = RequestMethod.POST)
    public String registerPOST(@ModelAttribute("boardVO") BoardVO boardVO, @ModelAttribute("contentVO") ContentVO contentVO, @ModelAttribute("competencyVO") CompetencyVO competencyVO, RedirectAttributes redirectAttributes) {

        boardService.registerSheet(boardVO, contentVO, competencyVO);
        boardVO.setHistoryNumber(contentVO.getHistoryNumber());
        competencyVO.setHistoryNumber(contentVO.getHistoryNumber());
        redirectAttributes.addFlashAttribute("msg", "INSERTED");

        return "redirect:/board/sheet-historys";
    }


    // view
    @RequestMapping(value = "/views", method = RequestMethod.GET)
    public String view(@RequestParam("historyNumber") String historyNumber,
                       @ModelAttribute("criteria") Criteria criteria, MatchingVO matchingVO, Model model, HttpSession session, RedirectAttributes redirectAttributes) {
        RSACreateAndDecryption rsaCreateAndDecryption = new RSACreateAndDecryption();

        // Take private key
        PrivateKey key = (PrivateKey) session.getAttribute("RSAprivateKey");
        rsaCreateAndDecryption.takePrivateKey(redirectAttributes, key);

        // Reset value of private key
        historyNumber = rsaCreateAndDecryption.resetPrivateKey(redirectAttributes, session, historyNumber, key);
        if(historyNumber == "redirect:/")
            return "redirect:/";

        // Create key
        RSAUtil rsaUtilObj = new RSAUtil();
        rsaCreateAndDecryption.createRSA(key, session, rsaUtilObj, model);

        CompetencyVO competencyVO = boardService.findCompentenciesByHistoryNumber(Integer.parseInt(historyNumber));

        matchingVO.setCompetencyTitle(competencyVO.getCompetencyTitle());
        matchingVO.setCompetencyRate(competencyVO.getCompetencyRate());

        for (ContentVO contentVO : boardService.readContent(Integer.parseInt(historyNumber))) {
            matchingVO.setTaskType(contentVO.getTaskType());
            matchingVO.setTaskRate(contentVO.getTaskRate());
        }

        model.addAttribute("boardVO", boardService.findByHistoryNumber(Integer.parseInt(historyNumber)));
        model.addAttribute("contentVO", boardService.readContent(Integer.parseInt(historyNumber)));
        model.addAttribute("competencyVO", boardService.findCompentenciesByHistoryNumber(Integer.parseInt(historyNumber)));
        model.addAttribute("matchingVO", matchingVO);
        return "board/views";
    }


    // modify page
    @RequestMapping(value = "/modify", method = RequestMethod.GET)
    public String modifyGET(@RequestParam("historyNumber") String historyNumber,
                            @ModelAttribute("criteria") Criteria criteria, Model model, HttpSession session, RedirectAttributes redirectAttributes) {
        RSACreateAndDecryption rsaCreateAndDecryption = new RSACreateAndDecryption();

        // Take private key
        PrivateKey key = (PrivateKey) session.getAttribute("RSAprivateKey");
        rsaCreateAndDecryption.takePrivateKey(redirectAttributes, key);

        // Reset value of private key
        historyNumber = rsaCreateAndDecryption.resetPrivateKey(redirectAttributes, session, historyNumber, key);
        if(historyNumber == "redirect:/")
            return "redirect:/";

        model.addAttribute("boardVO", boardService.findByHistoryNumber(Integer.parseInt(historyNumber)));
        model.addAttribute("contentVO", boardService.readContent(Integer.parseInt(historyNumber)));
        model.addAttribute("competencyVO", boardService.findCompentenciesByHistoryNumber(Integer.parseInt(historyNumber)));

        return "board/modify";
    }


    // modify processing
    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String modifyPOST(@ModelAttribute("BoardVO") BoardVO boardVO, @ModelAttribute("ContentVO") ContentVO contentVO, @ModelAttribute("CompetencyVO") CompetencyVO competencyVO,
                             Criteria criteria, RedirectAttributes redirectAttributes, HttpSession session, Model model) {
        RSACreateAndDecryption rsaCreateAndDecryption = new RSACreateAndDecryption();
        PrivateKey key = (PrivateKey) session.getAttribute("RSAprivateKey");

        // Reset value of private key
        session.removeAttribute("RSAprivateKey");

        // Create key
        RSAUtil rsaUtilObj = new RSAUtil();
        rsaCreateAndDecryption.createRSA(key, session, rsaUtilObj, model);


        boardService.modify(boardVO, contentVO, competencyVO);
        redirectAttributes.addFlashAttribute("msg", "MODIFIED");
        redirectAttributes.addAttribute("historyNumber", boardVO.getHistoryNumber());
        redirectAttributes.addAttribute("page", criteria.getPage());
        redirectAttributes.addAttribute("perPageNum", criteria.getPerPageNum());

        return "redirect:/board/sheet-historys";
    }


    // delete processing
    @RequestMapping(value = "/remove", method = RequestMethod.POST)
    public String remove(@RequestParam("historyNumber") Integer historyNumber,
                         Criteria criteria, RedirectAttributes redirectAttributes) {

        boardService.remove(historyNumber);
        redirectAttributes.addAttribute("page", criteria.getPage());
        redirectAttributes.addAttribute("perPageNum", criteria.getPerPageNum());
        redirectAttributes.addFlashAttribute("msg", "REMOVED");

        return "redirect:/board/sheet-historys";
    }


    // list : defalut + paging + search
    @RequestMapping(value = "/sheet-historys", method = RequestMethod.GET)
    public String historys(@ModelAttribute("criteria") Criteria criteria, HttpSession session, Model model) {
        RSACreateAndDecryption rsaCreateAndDecryption = new RSACreateAndDecryption();
        PrivateKey key = (PrivateKey) session.getAttribute("RSAprivateKey");

        // Create key
        RSAUtil rsaUtilObj = new RSAUtil();
        rsaCreateAndDecryption.createRSA(key, session, rsaUtilObj, model);

        Object userObj = session.getAttribute("userLoginInfo");
        UserVO userVO = (UserVO) userObj;

        PageMaker pageMaker = new PageMaker();
        criteria.setEmployeeNumber(userVO.getEmployeeNumber());
        pageMaker.setCriteria(criteria);
        pageMaker.setTotalCount(boardService.listCount(criteria));
        model.addAttribute("pageMaker", pageMaker);
        model.addAttribute("list", boardService.list(criteria));
        model.addAttribute("totalCount", boardService.listCount(criteria));

        return "board/historys";
    }


    //list : Supervisor clicked member's name
    @RequestMapping(value = "/member-sheet-view", method = RequestMethod.GET)
    public String members(@RequestParam("memberName") String memberNamePram, @ModelAttribute("criteria") Criteria criteria, Model model, HttpSession session, RedirectAttributes redirectAttributes) {
        RSACreateAndDecryption rsaCreateAndDecryption = new RSACreateAndDecryption();

        // Take private key
        PrivateKey key = (PrivateKey) session.getAttribute("RSAprivateKey");
        rsaCreateAndDecryption.takePrivateKey(redirectAttributes, key);

        // Reset value of private key
        session.removeAttribute("RSAprivateKey");
        RSAUtil rsaUtil = new RSAUtil();
        String memberNameResolved;

        // Decryption
        try {
            memberNameResolved = rsaUtil.getDecryptText(key, memberNamePram);
            criteria.setMemberName(memberNameResolved);
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("msg", "UNNATURALNESS");
            return "redirect:/";
        }

        // Create key
        RSAUtil rsaUtilObj = new RSAUtil();
        rsaCreateAndDecryption.createRSA(key, session, rsaUtilObj, model);

        PageMaker pageMaker = new PageMaker();
        pageMaker.setCriteria(criteria);
        pageMaker.setTotalCount(boardService.listCount(criteria));

        model.addAttribute("pageMaker", pageMaker);
        model.addAttribute("list", boardService.list(criteria));
        model.addAttribute("totalCount", boardService.listCount(criteria));
        model.addAttribute("memberStory", criteria);


        return "board/historys";
    }

}
