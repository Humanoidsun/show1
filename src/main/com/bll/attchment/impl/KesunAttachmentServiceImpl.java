package bll.attchment.impl;

import bll.KesunSuperService;

import bll.attchment.IKesunAttachment;
import dao.IDoData;
import entity.KesunAttachment;
import kesun.entity.system.User;
import org.apache.poi.ss.usermodel.Row;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by wph-pc on 2018/11/26.
 */
@Service("bAttachment")
public class KesunAttachmentServiceImpl extends KesunSuperService implements IKesunAttachment {
    @Autowired
    private dao.inter.attachment.IKesunAttachment dao;

    public KesunAttachmentServiceImpl() {
        setModel(new KesunAttachment());
    }

    @Override
    public String getLoadoutExcelFileName() {
        return null;
    }

    @Override
    public IDoData getDAO() {
        return dao;
    }

    @Override
    public List getSaveAll(List<Row> source, User worker) {
        return null;
    }

    @Override
    public String getLoadoutExcelTemplateName() {
        return null;
    }
}
