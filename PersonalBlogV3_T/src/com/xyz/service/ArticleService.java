package com.xyz.service;

import com.xyz.dao.ArticleDao;
import com.xyz.dao.impl.ArticleDaoImpl;
import com.xyz.model.ArticleModel;

import java.util.ArrayList;
import java.util.List;

public class ArticleService {

    private ArticleDao articleDao;
    public List<ArticleModel> queryAllArticles() {
        articleDao=new ArticleDaoImpl();
        return  articleDao.queryAllArticles();
    }

    public int getMaxPage() {
        int maxPageNumber = 1;
        int recordCounts=queryAllArticles().size();
        if (recordCounts % PageCount.ARTICLE_PAGE_COUNT == 0) {
            maxPageNumber = recordCounts / PageCount.ARTICLE_PAGE_COUNT;
        } else {
            maxPageNumber = recordCounts / PageCount.ARTICLE_PAGE_COUNT + 1;
        }
        return maxPageNumber;
    }

    public List<ArticleModel> getArticlesForPage(Integer typeID,int pageNo) {
        articleDao=new ArticleDaoImpl();
        List<ArticleModel> all;
        if (typeID == null) {
            all=queryAllArticles();
        }else {
            all = articleDao.queryArticlesForType(typeID);
        }

        List<ArticleModel>  part=new ArrayList<>();
        for(int i=(pageNo-1)*PageCount.ARTICLE_PAGE_COUNT;i<pageNo*PageCount.ARTICLE_PAGE_COUNT;i++){
            if (i >= all.size()) {
                break;
            }
            part.add(all.get(i));
        }
        return part;
    }
}
