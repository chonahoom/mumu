package com.rmobile.esss.commons.util;

import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.security.PrivateKey;

public class RSACreateAndDecryption {
    public String takePrivateKey (RedirectAttributes redirectAttributes, PrivateKey key) {
        if (key == null) {
            redirectAttributes.addFlashAttribute("msg", "UNNATURALNESS");
            return "redirect:/";
        }
        return "";
    }

    public String resetPrivateKey(RedirectAttributes redirectAttributes,HttpSession session, String historyNumber,PrivateKey key){
        session.removeAttribute("RSAprivateKey");
        RSAUtil rsaUtil = new RSAUtil();
        // decryption
        try {
            historyNumber = rsaUtil.getDecryptText(key, historyNumber);
            return historyNumber;
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("msg", "UNNATURALNESS");
            return "redirect:/";
        }

    }

    public void createRSA(PrivateKey key, HttpSession session, RSAUtil rsaUtilObj, Model model){
        if (key != null) { // delete private key
            session.removeAttribute("RSAprivateKey");
        }

        RSA rsa = rsaUtilObj.createRSA();
        model.addAttribute("modulus", rsa.getModulus());
        model.addAttribute("exponent", rsa.getExponent());
        session.setAttribute("RSAprivateKey", rsa.getPrivateKey());
    }




}
