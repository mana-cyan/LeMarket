package com.lemarket.controller.account;

import com.google.gson.JsonObject;
import com.lemarket.data.dao.UsersMapper;
import com.lemarket.data.reponseObject.EmailCheckStatus;
import com.lemarket.data.reponseObject.UsernameCheckStatus;
import com.lemarket.service.account.*;
import com.lemarket.service.utils.SaltFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.ByteArrayOutputStream;
import java.io.IOException;

@Controller
public class AccountController {

    private final EmailChecker emailChecker;

    private final TokenSetter tokenSetter;

    private final UsernameChecker usernameChecker;

    private final UsersMapper usersMapper;

    @Autowired
    public AccountController(EmailChecker emailChecker, TokenSetter tokenSetter, UsernameChecker usernameChecker, UsersMapper usersMapper) {
        this.emailChecker = emailChecker;
        this.tokenSetter = tokenSetter;
        this.usernameChecker = usernameChecker;
        this.usersMapper = usersMapper;
    }

    @RequestMapping(value = "/checkEmail", method = RequestMethod.GET)
    @ResponseBody
    public EmailCheckStatus checkEmail(@RequestBody String email){
        EmailCheckStatus emailCheckStatus = null;
        if(email !=null && !"".equals(email.trim())) {
            emailCheckStatus = emailChecker.checkEmailStatus(email.trim());
        }
        return emailCheckStatus;
    }

    /**
     * 检查用户名是否存在
     * @param username 用户名
     * @return status
     */
    @RequestMapping(value = "/checkUsername", method = RequestMethod.GET)
    @ResponseBody
    public UsernameCheckStatus checkUsername(@RequestBody String username){
        UsernameCheckStatus usernameCheckStatus = null;
        if(username != null && !"".equals(username.trim())){
            usernameCheckStatus = usernameChecker.checkUsernameStatus(username.trim());
        }
        return usernameCheckStatus;
    }

    /**
     * 响应验证码页面
     * @return null
     */
    @RequestMapping(value="/validateCode")
    public String validateCode(HttpServletRequest request, HttpServletResponse response) throws Exception{
        // 设置响应的类型格式为图片格式
        response.setContentType("image/jpeg");
        response.setDateHeader("Expires", 0);

        HttpSession session = request.getSession();

        //生成验证码
        ValidateCode vCode = new ValidateCode(120,40,5,100);
        //将图片流转化为图片
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        vCode.write(byteArrayOutputStream);
        byte[] imageBitArray = byteArrayOutputStream.toByteArray();
        byteArrayOutputStream.close();
        String imageB64 = javax.xml.bind.DatatypeConverter.printBase64Binary(imageBitArray);
        //验证码存入session
        session.setAttribute("code", vCode.getCode().toLowerCase());
        //验证图片返回前端
        response.getWriter().write(imageB64);
        return null;
    }

    /**
     * 检查验证码是否正确
     * @return {status:SUCCESS/ERROR}
     */
    @RequestMapping(value="/checkValidateCode", method = RequestMethod.GET)
    public String checkValidateCode(HttpServletRequest request, HttpServletResponse response){
        //获取session中存储的当前validateCode
        String code = (String)request.getSession().getAttribute("code");
        String validateCodeText = request.getParameter("validateCodeText");
        //检查验证码是否正确
        String answer = "ERROR";
        if(validateCodeText != null && code != null){
            if(validateCodeText.toLowerCase().equals(code))
                answer = "SUCCESS";
        }

        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("status", answer);
        try {
            response.getWriter().write(jsonObject.toString());
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    @RequestMapping(value = "/getSalt", method = RequestMethod.GET)
    public String getSalt(HttpServletRequest request, HttpServletResponse response) throws Exception{
        //获取salt
        String salt = SaltFactory.genSalt();
        //存入json
        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("salt",salt);
        //存入session
        HttpSession session = request.getSession();
        session.setAttribute("salt", salt);
        //返回
        response.getWriter().write(jsonObject.toString());
        return null;
    }

    @RequestMapping(value = "/test", method = RequestMethod.GET)
    @ResponseBody
    public String test(Model model) {
        usersMapper.selectByUsername("test");
        tokenSetter.newOrGetTokenByUsername("test");
        return "test";
    }

}
