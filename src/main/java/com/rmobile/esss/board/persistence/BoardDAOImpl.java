package com.rmobile.esss.board.persistence;

import com.rmobile.esss.board.domain.BoardVO;
import com.rmobile.esss.board.domain.CompetencyVO;
import com.rmobile.esss.board.domain.ContentVO;
import com.rmobile.esss.commons.paging.Criteria;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

@Repository
public class BoardDAOImpl implements BoardDAO {

    @Inject
    private SqlSession sqlSession;

    private static final String NAMESPACE = "com.rmobile.esss.mapper.BoardMapper";

    @Override
    public void create(BoardVO boardVO, ContentVO contentVO, CompetencyVO competencyVO) {
        String historyTitlePuzzle;
        String term_context;
        String version_contenxt;


        switch (boardVO.getHistoryTerm()) {
            case 0:
                term_context = " 1H(Oct-Mar) ";
                break;
            case 1:
                term_context = " 2H(Apr-Sep) ";
                break;
            default:
                term_context = " ";
                break;
        }
        switch (boardVO.getHistoryVersion()) {
            case 0:
                version_contenxt = " - [Goal Setting]";
                break;
            case 1:
                version_contenxt = " - [Mid-term Evaluation]";
                break;
            case 2:
                version_contenxt = " - [Final Evaluation]";
                break;
            default:
                version_contenxt = " ";
                break;
        }


        //assembling title : ex) Evaluation 2018 1H(Oct-Mar) nahoom.jo - submitted
        historyTitlePuzzle = "Evaluation " + boardVO.getHistoryYear() + term_context + boardVO.getHistoryWriterName() + version_contenxt;
        boardVO.setHistoryTitle(historyTitlePuzzle);

        sqlSession.insert(NAMESPACE + ".create", boardVO);

        //disassembling contentVO
        for (int i = 0; i < contentVO.getTaskTypeTemp().size(); i++) {
            contentVO.setTaskType(contentVO.getTaskTypeTemp().get(i));
            contentVO.setTaskWeight(contentVO.getTaskWeightTemp().get(i));
            contentVO.setTaskDate(contentVO.getTaskDateTemp().get(i));
            contentVO.setTaskGoalTitle(contentVO.getTaskGoalTitleTemp().get(i));
            contentVO.setTaskGoalDescription(contentVO.getTaskGoalDescriptionTemp().get(i));
            contentVO.setTaskRate(contentVO.getTaskRateTemp().get(i));
            contentVO.setTaskEvaluationComment(contentVO.getTaskEvaluationCommentTemp().get(i));
            contentVO.setTaskNumber(i);

            sqlSession.insert(NAMESPACE + ".inputContent", contentVO);
        }
        sqlSession.insert(NAMESPACE + ".insertCompetency", competencyVO);
        sqlSession.selectOne(NAMESPACE + ".getHistoryNumber", boardVO);


    }

    // read
    @Override
    public BoardVO findByHistoryNumber(Integer historyNumber) {
        return sqlSession.selectOne(NAMESPACE + ".read", historyNumber);
    }

    @Override
    public List<ContentVO> readContent(Integer historyNumber) {
        return sqlSession.selectList(NAMESPACE + ".readContent", historyNumber);
    }

    @Override
    public CompetencyVO readCompentencies(Integer historyNumber) {
        return sqlSession.selectOne(NAMESPACE + ".readCompetencies", historyNumber);
    }

    // update
    @Override
    public void update(BoardVO boardVO, ContentVO contentVO, CompetencyVO competencyVO) {
        sqlSession.update(NAMESPACE + ".update", boardVO);

        for (int i = 0; i < contentVO.getTaskTypeTemp().size(); i++) {
            contentVO.setContentNumber(contentVO.getContentNumberTemp().get(i));
            contentVO.setTaskType(contentVO.getTaskTypeTemp().get(i));
            contentVO.setTaskWeight(contentVO.getTaskWeightTemp().get(i));
            contentVO.setTaskDate(contentVO.getTaskDateTemp().get(i));
            contentVO.setTaskGoalTitle(contentVO.getTaskGoalTitleTemp().get(i));
            contentVO.setTaskGoalDescription(contentVO.getTaskGoalDescriptionTemp().get(i));
            contentVO.setTaskRate(contentVO.getTaskRateTemp().get(i));
            contentVO.setTaskEvaluationComment(contentVO.getTaskEvaluationCommentTemp().get(i));
            contentVO.setTaskNumber(i);
            sqlSession.update(NAMESPACE + ".contentUpdate", contentVO);
        }
        competencyVO.setHistoryNumber(contentVO.getHistoryNumber());
        sqlSession.update(NAMESPACE + ".competencyUpdate", competencyVO);

    }

    // delete
    @Override
    public void delete(Integer historyNumber) {
        sqlSession.delete(NAMESPACE + ".historyDelete", historyNumber);
        sqlSession.delete(NAMESPACE + ".contentDelete", historyNumber);
        sqlSession.delete(NAMESPACE + ".competencyDelete", historyNumber);

    }



    // read - list (paging)
    @Override
    public List<BoardVO> list(Criteria criteria) {
        return sqlSession.selectList(NAMESPACE + ".listPaging", criteria);
    }

    // read - list (count)
    @Override
    public int listCount(Criteria criteria) {
        return sqlSession.selectOne(NAMESPACE + ".listCount", criteria);
    }


}
