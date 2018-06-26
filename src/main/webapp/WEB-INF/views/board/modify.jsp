<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<%@ include file="../include/head.jsp" %>
<script>
    //setting select values
    window.onload = function () {
        if("${sessionScope.userLoginInfo.name}" === '')
            location.href="/user/login";
        var taskTypeTempValue = document.getElementsByName("taskTypeTemp");
        var taskWeightValue = document.getElementsByName("taskWeightTemp");
        var taskRateValue = document.getElementsByName("taskRateTemp");
        var competencyTItleValue = document.getElementsByName("competencyTitle");
        var competencyRateValue = document.getElementsByName("competencyRate");
        var contentVOArr = [];
        var competencyTitle = <c:out value="${competencyVO.competencyTitle}"/>;
        var competencyRate = <c:out value="${competencyVO.competencyRate}"/>;
        competencyTItleValue[0].value = competencyTitle;
        competencyRateValue[0].value = competencyRate;
        //the access way to attribute in javascript
        <c:forEach var="contentVO" varStatus="i" items="${contentVO}">
        contentVOArr.push({
            taskWeight: ${contentVO.taskWeight},
            taskType: ${contentVO.taskType},
            taskRate: ${contentVO.taskRate}
        });
        </c:forEach>
        //contentVO
        for (var contentCnt = 0; contentCnt < contentVOArr.length; contentCnt++) {
            taskTypeTempValue[contentCnt].value = contentVOArr[contentCnt].taskType;
            taskWeightValue[contentCnt].value = contentVOArr[contentCnt].taskWeight;
            taskRateValue[contentCnt].value = contentVOArr[contentCnt].taskRate;
        }
    }
</script>
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
            <ol class="breadcrumb">
                <li><a href="<c:url value="/board/sheet-historys"/>"><i class="fa fa-dashboard"></i>my history</a></li>
                <li class="active">modify</li>
            </ol>
        </section>
        <%-- Main content --%>
        <section class="content container-fluid">
            <div class="col-lg-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">
                            <label for="taskGoalTitle">Evaluation Sheet Title</label>
                        </h3>
                        <form role="form" method="post" action="<c:url value="/board/modify"/>">
                            <label for="historyTitle"></label>
                            <input type="text" class="form-control" name="historyTitle" id="historyTitle" value="${boardVO.historyTitle}">
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
                            <div class="form-group col-sm-4">
                                <select class="form-control" name="taskTypeTemp" id="taskTypeTemp">
                                    <option value="0">Main</option>
                                    <option value="1">Additional</option>
                                </select>
                            </div>
                            <div class="form-group col-sm-4">
                                <input type="text" class="form-control" name="taskDateTemp" id="taskDate"
                                       placeholder="YYYY-MM-DD ~ YYYY-MM-DD" value="${contentVO.taskDate}">
                            </div>
                            <div class="form-group col-sm-4">
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
                            <div class="form-group">
                                <label for="taskGoalTitle">Goal Title</label>
                                <input type="text" class="form-control" name="taskGoalTitleTemp" id="taskGoalTitle" value="${contentVO.taskGoalTitle}">
                            </div>
                            <div class="form-group test">
                                <label for="taskGoalDescription">Goal Description</label>
                                <textarea class="form-control" name="taskGoalDescriptionTemp" id="taskGoalDescription" placeholder=" " rows="15" style="resize: none">${fn:replace(fn:replace(fn:escapeXml(contentVO.taskGoalDescription), newLine, "<br/>") , " ", "&nbsp;")}</textarea>
                            </div>
                            <div class="form-group">
                                <label for="taskEvaluationComment">Evaluation comments by Self</label>
                                <textarea class="form-control" name="taskEvaluationCommentTemp" id="taskEvaluationComment" placeholder=" " rows="5" style="resize: none">${fn:replace(fn:replace(fn:escapeXml(contentVO.taskEvaluationComment), newLine, "<br/>") , " ", "&nbsp;")}</textarea>
                            </div>
                            <div class="form-group col-sm">
                                <label for="taskRate">Rating by Self</label>
                                <select class="form-control" name="taskRateTemp" id="taskRate">
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
                        <div class="form-group" id="competency_area">
                            <br/><br/>
                            <hr>
                            <label for="taskCompetency" style="background-color: #DC143C; width: 100%;">
                                <span>　COMPETENCY</span></label>
                            <label for="taskCompetency">Goal Setting Comments for competencies</label>
                            <textarea class="form-control" name="taskCompetency" id="taskCompetency" rows="8" style="resize: none">${fn:replace(fn:replace(fn:escapeXml(contentVO[0].taskCompetency), newLine, "<br/>") , " ", "&nbsp;")}</textarea>
                            <div class="form-group col-sm">
                                <label for="competencyTitle">Five Principles</label>
                                <select class="form-control" name="competencyTitle" id="competencyTitle">
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
                                    <option value="5">5.0 - Consistently meets expectations required at the next grade
                                        level or higher.
                                    </option>
                                    <option value="4">4.0 - Meets expectations in one’s current grade and sometimes
                                        exceeds expectations at the next grade level.
                                    </option>
                                    <option value="3">3.0 - Consistently meets expectations required in one's grade.
                                    </option>
                                    <option value="2">2.0 - Inconsistently meets expectations required in one's grade.
                                    </option>
                                    <option value="1">1.0 - Performance is at a level which is one grade below or more
                                        their current level.
                                    </option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="overallPerformanceComment">Overall performance Comments</label>
                                <textarea class="form-control" name="overallPerformanceComment" id="overallPerformanceComment" rows="8" style="resize: none">${fn:replace(fn:replace(fn:escapeXml(competencyVO.overallPerformanceComment), newLine, "<br/>") , " ", "&nbsp;")}
                                </textarea>
                            </div>
                        </div>
                    </div>
                    </form>
                    <div class="box-footer">
                        <button type="submit" class="btn btn-warning doneBtn"><i class="fa fa-edit"></i> Done</button>
                        <button type="submit" class="btn btn-danger cancelBtn"><i class="fa fa-arrow-left"></i> Cancel
                        </button>
                        <button type="submit" class="btn btn-primary listBtn pull-right"><i class="fa fa-list"></i> List
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
<script>
    $(document).ready(function () {
        var formObj = $("form[role='form']");
        // click Done button
        $(".doneBtn").on("click", function () {
            formObj.attr("action", "/board/modify");
            formObj.attr("method", "post");
            formObj.submit();
        });
        // click Cancel button
        $(".cancelBtn").on("click", function () {
            history.go(-1);
        });
        // click List button
        $(".listBtn").on("click", function () {
            self.location = "/board/sheet-historys?page=${criteria.page}&perPageNum=${criteria.perPageNum}";
        });
    });
</script>
</body>
</html>