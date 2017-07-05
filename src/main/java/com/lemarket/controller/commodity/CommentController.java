package com.lemarket.controller.commodity;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommentController {

    @RequestMapping(value = "commentPage")
    public String commentPage() {
        return "shop/comment";
    }
}
