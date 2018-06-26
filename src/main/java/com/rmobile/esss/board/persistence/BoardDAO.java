package com.rmobile.esss.board.persistence;

import com.rmobile.esss.board.domain.BoardVO;
import com.rmobile.esss.board.domain.CompetencyVO;
import com.rmobile.esss.board.domain.ContentVO;
import com.rmobile.esss.commons.paging.Criteria;

import java.util.List;

public interface BoardDAO {

    // create
    void create(BoardVO boardVO, ContentVO contentVO, CompetencyVO competencyVO);

    // read
    BoardVO findByHistoryNumber(Integer historyNumber);

    List<ContentVO> readContent(Integer historyNumber);

    CompetencyVO readCompentencies(Integer historyNumber);

    // update
    void update(BoardVO boardVO, ContentVO contentVO, CompetencyVO competencyVO);

    // delete
    void delete(Integer historyNumber);



    // read - list(paging)
    List<BoardVO> list(Criteria criteria);

    // read - list(count)
    int listCount(Criteria criteria);


}
