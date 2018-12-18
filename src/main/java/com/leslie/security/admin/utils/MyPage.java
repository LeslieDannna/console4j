package com.leslie.security.admin.utils;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import javax.servlet.http.HttpServletRequest;
import java.io.Serializable;
import java.util.List;

/**
 * @author Leslie.Lam
 * @create 2018-12-17 14:30
 **/
public class MyPage {

    public static <T> Info<T> startPage(Excutor<T> excutor, Integer pageNum, Integer pageSize){
        pageNum = null==pageNum||pageNum<=0?1:pageNum;
        pageSize = null==pageSize||pageSize<=0?10:pageSize;
        PageHelper.startPage(pageNum,pageSize);
        PageInfo<T> pageInfo = new PageInfo(excutor.excute());
        MyPage.Info<T> pager = new MyPage.Info<>();
        pager.setRows(pageInfo.getList());
        pager.setTotal(pageInfo.getTotal());
        return pager;
    }

    public static <T>  Info<T> startPage(Excutor<T> excutor, StartPage page){
        return startPage(excutor,page.getPageNum(),page.getPageSize());
    }

    public static <T>  Info<T> startPage(Excutor<T> excutor){
        HttpServletRequest request = AppContextHelper.getRequest();
        String pn = request.getParameter("page");
        int pageNum = (null==pn||"".equals(pn))?1:Integer.parseInt(pn);
        String ps = request.getParameter("size");
        int pageSize = (null==ps||"".equals(ps))?10:Integer.parseInt(ps);
        return startPage(excutor,pageNum,pageSize);
    }

    public interface Excutor<T> {
        List<T> excute();
    }

    public static class Info<T> implements Serializable{
        private long total;

        private List<T> rows;

        public long getTotal() {
            return total;
        }

        public void setTotal(long total) {
            this.total = total;
        }

        public List<T> getRows() {
            return rows;
        }

        public void setRows(List<T> rows) {
            this.rows = rows;
        }
    }

    public static class StartPage implements Serializable {

        private Integer pageNum;

        private Integer pageSize;

        private Long timestamp;

        public StartPage() {
        }

        public StartPage(Integer pageNum, Integer pageSize, Long timestamp) {
            this.pageNum = pageNum;
            this.pageSize = pageSize;
            this.timestamp = timestamp;
        }

        public StartPage(Integer currentPage, Integer pageSize) {
            this.pageNum = currentPage;
            this.pageSize = pageSize;
        }

        public Integer getPageNum() {
            return pageNum;
        }

        public void setPageNum(Integer pageNum) {
            this.pageNum = pageNum;
        }

        public Integer getPageSize() {
            return pageSize;
        }

        public void setPageSize(Integer pageSize) {
            this.pageSize = pageSize;
        }

        public Long getTimestamp() {
            return timestamp;
        }

        public void setTimestamp(Long timestamp) {
            this.timestamp = timestamp;
        }
    }

}
