package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by wph-pc on 2019/5/2.
 */
@Controller
public class IndexController {
    @RequestMapping("index")
    public String index(){
        return "../index";
    }
    @RequestMapping("studentindex")
    public String studentIdex(){
        return "../studentindex";
    }
    @RequestMapping("teacherindex")
    public String teacherIndex(){
        return "../teacherindex";
    }
    @RequestMapping("teachertaskindex")
    public String teacherTaskIndex(){
        return "teacher/teachertaskindex";
    }
    @RequestMapping("teacherproject")
    public String teacherProjectIndex(){
        return "teacher/teacherproject";
    }
    @RequestMapping("myproject")
    public String myProjectByStudent(){
        return "student/myproject";
    }
    @RequestMapping("exit")
    public String exit(){
        return "../login";
    }
}
