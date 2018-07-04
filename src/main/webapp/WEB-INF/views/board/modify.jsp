<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<%@ include file="../include/head.jsp" %>
<script>
    //setting select values
    window.onload = function () {
        if ("${sessionScope.userLoginInfo.name}" === '')
            location.href = "/user/login";
        var taskTypeTempValue = document.getElementsByName("taskTypeTemp");
        var taskWeightValue = document.getElementsByName("taskWeightTemp");
        var taskRateValue = document.getElementsByName("taskRateTemp");
        var taskDateStartValue = document.getElementsByName("taskDateStartTemp");
        var taskDateEndValue = document.getElementsByName("taskDateEndTemp");
        var competencyTItleValue = document.getElementsByName("competencyTitle");
        var competencyRateValue = document.getElementsByName("competencyRate");
        var historyYearValue = document.getElementById("historyYear");
        var historyTermValue = document.getElementById("historyTerm");
        var historyVersionValue = document.getElementById("historyVersion");
        var contentVOArr = [];
        var competencyTitle = <c:out value="${competencyVO.competencyTitle}"/>;
        var competencyRate = <c:out value="${competencyVO.competencyRate}"/>;
        competencyTItleValue[0].value = competencyTitle;
        competencyRateValue[0].value = competencyRate;

        historyYearValue.value = ${boardVO.historyYear};
        historyTermValue.value = ${boardVO.historyTerm};
        historyVersionValue.value = ${boardVO.historyVersion};

        //the access way to attribute in javascript
        <c:forEach var="contentVO" varStatus="i" items="${contentVO}">
        stringDate = "${contentVO.taskDate}";
        contentVOArr.push({
            taskWeight: ${contentVO.taskWeight},
            taskType: ${contentVO.taskType},
            taskRate: ${contentVO.taskRate},
            taskDate: stringDate.split(' ~ ')
        });
        </c:forEach>
        //contentVO
        for (var contentCnt = 0; contentCnt < contentVOArr.length; contentCnt++) {
            taskTypeTempValue[contentCnt].value = contentVOArr[contentCnt].taskType;
            taskWeightValue[contentCnt].value = contentVOArr[contentCnt].taskWeight;
            taskRateValue[contentCnt].value = contentVOArr[contentCnt].taskRate;
            taskDateStartValue[contentCnt].value = contentVOArr[contentCnt].taskDate[0];
            taskDateEndValue[contentCnt].value = contentVOArr[contentCnt].taskDate[1];
        }
    }
</script>
<link rel="stylesheet" href="/dist/css/board/date.css">
<body class="hold-transition skin-red-light sidebar-mini layout-boxed">
<div class="wrapper">
    <%-- Main Header --%>
    <%@ include file="../include/main_header.jsp" %>
    <%-- Left side column --%>
    <%@ include file="../include/left_column.jsp" %>
    <%-- Content Wrapper. Contains page content --%>
    <div class="content-wrapper">
        <%-- Content Header (Page header) --%>
        <section class="content-header">
            <h1>
                Modify
                <small></small>
            </h1>
        </section>
        <%-- Main content --%>
        <section class="content container-fluid">
            <div class="col-lg-12">
                <div class="box box-primary">
                    <form role="form" method="post" action="<c:url value="/board/modify"/>">
                        <div class="box-header with-border">
                            <label for="historyYear" style="width:100%">Title Setting *</label>
                            <div class="form-group col-sm-4">
                                <select class="form-control" name="historyYear" id="historyYear">
                                    <option value="2022">2022</option>
                                    <option value="2021">2021</option>
                                    <option value="2020">2020</option>
                                    <option value="2019">2019</option>
                                    <option value="2018">2018</option>
                                    <option value="2017">2017</option>
                                    <option value="2016">2016</option>
                                    <option value="2015">2015</option>
                                    <option value="2014">2014</option>
                                    <option value="2013">2013</option>
                                    <option value="2012">2012</option>
                                    <option value="2011">2011</option>
                                    <option value="2010">2010</option>
                                    <option value="2009">2009</option>
                                    <option value="2008">2008</option>
                                </select>
                            </div>
                            <div class="form-group col-sm-4">
                                <select class="form-control" name="historyTerm" id="historyTerm">
                                    <option value="0">Oct-Mar</option>
                                    <option value="1">Apr-Sep</option>
                                </select>
                            </div>
                            <div class="form-group col-sm-4">
                                <select class="form-control" name="historyVersion" id="historyVersion">
                                    <option value="0">Goal Setting</option>
                                    <option value="1">Mid-term Evaluation</option>
                                    <option value="2">Final Evaluation</option>
                                </select>
                            </div>

                        </div>
                        <div class="box-body">
                            <%--value setting for paging--%>
                            <input type="hidden" name="page" value="${criteria.page}">
                            <input type="hidden" name="perPageNum" value="${criteria.perPageNum}">
                            <%--****************************************************ADD ZONE START*****************************************************--%>
                            <c:forEach var="contentVO" varStatus="i" items="${contentVO}">
                                <input type="hidden" name="contentNumberTemp" value="${contentVO.contentNumber}">
                                <input type="hidden" name="historyNumber" value="${contentVO.historyNumber}">
                                <label style="background-color: #9cc2cb; width: 100%;"><span
                                        id="task_cnt">TASK <b>${contentVO.taskNumber+1}</b></span></label>
                                <div class="form-group col-sm-3">
                                    <select class="form-control" name="taskTypeTemp" id="taskTypeTemp">
                                        <option value="0">Main</option>
                                        <option value="1">Additional</option>
                                    </select>
                                </div>
                                <div class="form-group col-sm-6">
                                    <div class="input-daterange input-group form-group" id="mydate">
                                        <input type="text" class="input-sm form-control" name="taskDateStartTemp" placeholder="start date"  onfocus="(this.type='date')" id="start" value="" style="height: 34px">
                                        <span class="input-group-addon">to</span>
                                        <input type="text" class="input-sm form-control" name="taskDateEndTemp" placeholder="end date" onfocus="(this.type='date')" id="end" value="" style="height: 34px">
                                    </div>
                                </div>
                                <div class="form-group col-sm-3">
                                    <select class="form-control" name="taskWeightTemp" id="taskWeight">
                                        <option value="0">Weight ( %)</option>
                                        <option value="100">100%</option>
                                        <option value="95">95%</option>
                                        <option value="90">90%</option>
                                        <option value="85">85%</option>
                                        <option value="80">80%</option>
                                        <option value="75">75%</option>
                                        <option value="70">70%</option>
                                        <option value="65">65%</option>
                                        <option value="60">60%</option>
                                        <option value="55">55%</option>
                                        <option value="50">50%</option>
                                        <option value="45">45%</option>
                                        <option value="40">40%</option>
                                        <option value="35">35%</option>
                                        <option value="30">30%</option>
                                        <option value="25">25%</option>
                                        <option value="20">20%</option>
                                        <option value="15">15%</option>
                                        <option value="10">10%</option>
                                        <option value="5">5%</option>
                                    </select>
                                </div>
                                <div class="form-group col-sm-12">
                                    <label for="taskGoalTitle">Goal Title</label>
                                    <input type="text" class="form-control" name="taskGoalTitleTemp" id="taskGoalTitle"
                                           value="${contentVO.taskGoalTitle}">
                                </div>
                                <div class="form-group col-sm-12">
                                    <label for="taskGoalDescription">Goal Description</label>
                                    <textarea class="form-control" name="taskGoalDescriptionTemp"
                                              id="taskGoalDescription" placeholder=" " rows="15"
                                              style="resize: none">${fn:replace(fn:replace(fn:escapeXml(contentVO.taskGoalDescription), newLine, "<br/>") , " ", "&nbsp;")}</textarea>
                                </div>
                                <div class="form-group col-sm-12">
                                    <label for="taskEvaluationComment">Evaluation comments by Self</label>
                                    <textarea class="form-control" name="taskEvaluationCommentTemp"
                                              id="taskEvaluationComment" placeholder=" " rows="5"
                                              style="resize: none">${fn:replace(fn:replace(fn:escapeXml(contentVO.taskEvaluationComment), newLine, "<br/>") , " ", "&nbsp;")}</textarea>
                                </div>
                                <div class="form-group col-sm col-sm-12">
                                    <label for="taskRate">Rating by Self</label>
                                    <select class="form-control" name="taskRateTemp" id="taskRate">
                                        <option value="0"> - </option>
                                        <option value="7">7.0 - 140% and above of expected level</option>
                                        <option value="6">6.0 - Between 120% - 140% of expected level</option>
                                        <option value="5">5.0 - Between 110% - 120% of expected level</option>
                                        <option value="4">4.0 - Between 100% - 110% of expected level</option>
                                        <option value="3">3.0 - Between 90% - 100% of expected level</option>
                                        <option value="2">2.0 - Between 80% - 90% of expected level</option>
                                        <option value="1">1.0 - Less than 80% of expected level</option>
                                    </select>
                                </div>
                                <br/>
                            </c:forEach>
                            <%--****************************************************ADD ZONE END*****************************************************--%>
                            <div class="form-group col-sm-12" id="competency_area">
                                <br/><br/>
                                <hr>
                                <label for="taskCompetency" style="background-color: #DC143C; width: 100%;">
                                    <span>　COMPETENCY</span></label>
                                <label for="taskCompetency">Goal Setting Comments for competencies</label>
                                <textarea class="form-control" name="taskCompetency" id="taskCompetency" rows="8"
                                          style="resize: none">${fn:replace(fn:replace(fn:escapeXml(contentVO[0].taskCompetency), newLine, "<br/>") , " ", "&nbsp;")}</textarea>
                                <div class="form-group col-sm">
                                    <label for="competencyTitle">Five Principles</label>
                                    <select class="form-control" name="competencyTitle" id="competencyTitle">
                                        <option value="0"> - </option>
                                        <option value="5">Always Improve, Always Advance</option>
                                        <option value="4">Passionately Professional</option>
                                        <option value="3">Hypothesize → Practice → Validate → Shikumika</option>
                                        <option value="2">Maximize Customer Satisfaction</option>
                                        <option value="1">Speed!! Speed! Speed!!</option>
                                    </select>
                                </div>
                                <div class="form-group col-sm">
                                    <label for="competencyRate">Rating by Self (principle)</label>
                                    <select class="form-control" name="competencyRate" id="competencyRate">
                                        <option value="0"> - </option>
                                        <option value="5">5.0 - Consistently meets expectations required at the next
                                            grade
                                            level or higher.
                                        </option>
                                        <option value="4">4.0 - Meets expectations in one’s current grade and sometimes
                                            exceeds expectations at the next grade level.
                                        </option>
                                        <option value="3">3.0 - Consistently meets expectations required in one's grade.
                                        </option>
                                        <option value="2">2.0 - Inconsistently meets expectations required in one's
                                            grade.
                                        </option>
                                        <option value="1">1.0 - Performance is at a level which is one grade below or
                                            more
                                            their current level.
                                        </option>
                                    </select>
                                </div>
                                <input type="hidden" name="historyWriter" id="historyWriter" value="${sessionScope.userLoginInfo.employeeNumber}">
                                <input type="hidden" name="historyWriterName" value="${sessionScope.userLoginInfo.name}">
                                <div class="form-group">
                                    <label for="overallPerformanceComment">Overall performance Comments</label>
                                    <textarea class="form-control" name="overallPerformanceComment"
                                              id="overallPerformanceComment" rows="8"
                                              style="resize: none">${fn:replace(fn:replace(fn:escapeXml(competencyVO.overallPerformanceComment), newLine, "<br/>") , " ", "&nbsp;")}
                                    </textarea>
                                </div>
                            </div>
                        </div>
                    </form>
                    <div class="box-footer">
                        <div class="custom-control custom-checkbox" style="text-align: right">
                            <label class="custom-control-label" for="checkboxCreateSheet" style="color:#990000">Create a new evaluation sheet
                                with your edits </label>
                            <input type="checkbox" class="custom-control-input" id="checkboxCreateSheet">
                            <input type="hidden" id="checkValue" value="unchecked">
                            <hr>
                        </div>

                        <button type="submit" class="btn btn-success doneBtn pull-right"><i class="fa fa-edit"></i> save</button>
                        <button type="submit" class="btn btn-danger cancelBtn"><i class="fa fa-arrow-left"></i> Cancel
                        </button>
                    </div>
                </div>
            </div>
        </section>
        <%-- /.content --%>
    </div>
    <%-- /.content-wrapper --%>
    <%-- Main Footer --%>
    <%@ include file="../include/main_footer.jsp" %>
</div>
<%-- ./wrapper --%>
<%@ include file="../include/plugin_js.jsp" %>
<script src="/dist/js/board/modifyGuideFrame.js"></script>
</body>
</html>