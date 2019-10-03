package controller.attachment.impl;

import bll.KesunSuperService;
import controller.KesunBusinessController;
import controller.attachment.IKesunAttachment;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * Created by wph-pc on 2019/3/26.
 */
@Controller
@RequestMapping("attachment")
public class KesunAttachmentController extends KesunBusinessController implements IKesunAttachment {
    @Resource(name="bAttachment")
    private bll.attchment.impl.KesunAttachmentServiceImpl bll;
    @Override
    public KesunSuperService getService() {
        return bll;
    }
}
