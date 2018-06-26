package com.rmobile.esss.board.service;

import com.rmobile.esss.board.domain.BoardVO;
import com.rmobile.esss.board.domain.CompetencyVO;
import com.rmobile.esss.board.domain.ContentVO;
import com.rmobile.esss.board.persistence.BoardDAO;
import com.rmobile.esss.commons.paging.Criteria;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import java.util.List;

@Service
public class BoardServiceImpl implements BoardService {

    @Inject
    private BoardDAO boardDAO;

    // create
    @Override
    public void registerSheet(BoardVO boardVO, ContentVO contentVO, CompetencyVO competencyVO) {
        boardDAO.create(boardVO, contentVO, competencyVO);
    }

    // read
    @Transactional(isolation = Isolation.READ_COMMITTED)
    @Override
    public BoardVO findByHistoryNumber(Integer historyNumber) {
        return boardDAO.findByHistoryNumber(historyNumber);

    }

    @Override
    public List<ContentVO> readContent(Integer historyNumber) {
        return boardDAO.readContent(historyNumber);
    }

    @Override
    public CompetencyVO findCompentenciesByHistoryNumber(Integer historyNumber) {
        return boardDAO.readCompentencies(historyNumber);
    }


    // update
    @Override
    public void modify(BoardVO boardVO, ContentVO contentVO, CompetencyVO competencyVO) {
        boardDAO.update(boardVO, contentVO, competencyVO);
    }

    // delete
    @Override
    public void remove(Integer historyNumber) {
        boardDAO.delete(historyNumber);
    }


    // read - list (paging)
    @Override
    public List<BoardVO> list(Criteria criteria) {
        return boardDAO.list(criteria);
    }

    // read - list (count)
    @Override
    public int listCount(Criteria criteria) {
        return boardDAO.listCount(criteria);
    }

}
