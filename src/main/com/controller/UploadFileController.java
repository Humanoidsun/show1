package controller;

import bll.KesunSuperService;
import entity.KesunAttachment;
import kesun.entity.KesunReturn;
import kesun.entity.system.User;
import org.springframework.web.bind.annotation.*;
import util.Tool;
import org.springframework.stereotype.Controller;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.annotation.Resource;
import javax.jms.Session;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


/**
 * 负责文件上传操作
 * Created by wph-pc on 2017/5/28.
 */
@Controller
public class UploadFileController extends KesunBusinessController {
    //创建上传对象
    @Resource(name="bAttachment")
    private bll.attchment.impl.KesunAttachmentServiceImpl bllAttach;
    private PrintWriter out;
    /*上传文件服务器保存地址*/
    private String getSavePath(HttpServletRequest request, HttpServletResponse response) throws Exception{
        ServletContext servletContext=request.getSession().getServletContext();
        String realPath = servletContext.getRealPath("uploadfiles");
        return realPath;
    }
    private List<KesunAttachment> doUploadFile(CommonsMultipartFile files[], HttpServletRequest request, HttpServletResponse response)
    {
        response.setContentType("text/html;charset=UTF-8");

        if(files==null || files.length==0) return null;

        String path=request.getSession().getServletContext().getRealPath("/uploadfiles");
        /*判断目录是否存在，如果不存在，则创建*/
        File dir = new File(path);
        if (!dir.exists())
            dir.mkdirs();

        List<KesunAttachment> lFiles=new ArrayList<KesunAttachment>();//已经成功的文件名
        for (int i = 0; i < files.length; i++) {
            //创建临时文件
            KesunAttachment attch=new KesunAttachment();
            attch.setId(Tool.CreateID());
            // 获得原始文件名
            String fileName = files[i].getOriginalFilename();
            //过滤掉可执行文件
            if(fileName.substring(fileName.lastIndexOf(".")).indexOf("exe")>=0)
            {
                continue;
            }
            //设置附件原文件名
            attch.setName(fileName);
            User user= GetCurrentUser();
            attch.setUser(user);
            attch.setOrg(user.getOrg());
            attch.setActor(user.getActors().get(0));

            System.out.println("原始文件名:" + fileName);
            if (fileName.trim().equals("")) continue;
            //设置文件类型
            attch.setType(fileName.substring(fileName.lastIndexOf(".")));
            // 新文件名
            String newFileName = Tool.CreateID() +fileName.substring(fileName.lastIndexOf(".")) ;
            //设置上传后的文件名
            attch.setAddress(newFileName);

            if (!files[i].isEmpty()) {
                try {
                    FileOutputStream fos = new FileOutputStream(path+"/"
                            + newFileName);
                    InputStream in = files[i].getInputStream();
                    byte[] bytes = new byte[2048];//1024*2
                    int b = 0;
                    while ((b = in.read(bytes)) != -1) {
                        attch.setSize(attch.getSize()+b);//统计文件大小
                        fos.write(bytes,0,b);
                    }
                    fos.close();
                    in.close();
                    //保存上传信息到数据库中
                    bllAttach.setModel(attch);
                    bllAttach.add();

                } catch (Exception e) {
                    e.printStackTrace();
                    return null;
                }
            }
            lFiles.add(attch);

        }
        return lFiles;
    }
    @RequestMapping(value = "/uploadfile", method = RequestMethod.POST)
    @ResponseBody
    public Object uploadFile(@RequestParam("file") CommonsMultipartFile files[], HttpServletRequest request, HttpServletResponse response) throws IOException  {
        KesunReturn back=new KesunReturn();
        if (request.getSession().getAttribute("user")==null || request.getSession().getAttribute("user") instanceof User ==false)
        {
           back.setCode("0");
           back.setMessage("用户没有登录，不允许文件上传操作！");
           back.setObj(null);
           return back;
        }
        List<KesunAttachment> lTemp=doUploadFile(files,request,response);
        if (lTemp==null || lTemp.size()==0)
        {
            back.setMessage("没有实现任何文件上传！");
        }
        else
            back.setMessage("文件已经上传完完成，共完成了【"+lTemp.size()+"】文件上传！");
        back.setObj(lTemp);
        return back;
    }
    @Override
    public KesunSuperService getService() {
        return bllAttach;
    }

    @Override
    public Map<String, Object> getConditionParam(Map<String, Object> param) {
        return param;
    }
}
