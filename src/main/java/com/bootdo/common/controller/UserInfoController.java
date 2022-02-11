package com.bootdo.common.controller;
import java.util.Date;
import java.util.List;
import java.util.Map;
import com.bootdo.common.utils.ShiroUtils;
import com.bootdo.system.domain.UserDO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/userinfo")
public class UserInfoController extends BaseController{
    @ResponseBody
    @GetMapping("/getuser")
    public UserDO getUser() {
        return ShiroUtils.getUser();
    }
    @ResponseBody
    @GetMapping("/getusrid")
    public Long getUserId() {
        return getUser().getUserId();
    }
    @ResponseBody
    @GetMapping("/getusrname")
    public String getUsername() {
        return getUser().getUsername();
    }
}
