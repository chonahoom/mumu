package com.rmobile.esss.board.service;

import com.rmobile.esss.board.domain.BoardVO;
import com.rmobile.esss.board.domain.CompetencyVO;
import com.rmobile.esss.board.domain.ContentVO;
import com.rmobile.esss.commons.paging.Criteria;

import java.util.List;

public interface BoardService {

    // create
    void registerSheet(BoardVO boardVO, ContentVO contentVO, CompetencyVO competencyVO);

    // read
    BoardVO findByHistoryNumber(Integer historyNumber);

    List<ContentVO> readContent(Integer historyNumber);

    CompetencyVO findCompentenciesByHistoryNumber(Integer historyNumber);

    // update
    void modify(BoardVO boardVO, ContentVO contentVO, CompetencyVO competencyVO);

    // delete
    void remove(Integer historyNumber);

    // read - list (paging)
    List<BoardVO> list(Criteria criteria);

    // read - list (count)
    int listCount(Criteria criteria);
}
