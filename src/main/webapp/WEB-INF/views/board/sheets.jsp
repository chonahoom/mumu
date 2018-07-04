<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<%--head.jsp--%>
<%@ include file="../include/head.jsp" %>
<script src="http://code.jquery.com/jquery-3.2.0.min.js"></script>
<script src="/dist/js/board/sheetsAddRemoveAndValueCheck.js"></script>
<script>
    window.onload = function(){
        if("${sessionScope.userLoginInfo.name}" ==='')
            location.href="/user/login";
        addSheet();
    }
</script>
<link rel="stylesheet" href="/dist/css/board/date.css">
<body class="hold-transition skin-red-light sidebar-mini layout-boxed">
<div class="wrapper">
    <%-- Main Header --%>
    <%@ include file="../include/main_header.jsp" %>
    <%-- Left side column. contains the logo and sidebar --%>
    <%@ include file="../include/left_column.jsp" %>
    <%-- Content Wrapper. Contains page content --%>
    <div class="content-wrapper">
        <%-- Content Header (Page header) --%>
        <section class="content-header">
            <h1>
                Evaluation Sheet
            </h1>
        </section>
        <%-- Main content --%>
        <section class="content container-fluid">
            <div class="col-lg-12">
                <form role="form" method="post" name="evaluationForm" action="<c:url value="/board/sheets"/>">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <label for="historyYear" style="width:100%">Title Setting </label>
                            <div class="form-group col-sm-4">
                                <select class="form-control" name="historyYear" id="historyYear">
                                    <option value="2022">2022</option>
                                    <option value="2021">2021</option>
                                    <option value="2020">2020</option>
                                    <option value="2019">2019</option>
                                    <option value="2018" selected>2018</option>
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
                                    <option value="0" selected>Goal Setting</option>
                                    <option value="1">Mid-term Evaluation</option>
                                    <option value="2">Final Evaluation</option>
                                </select>
                            </div>
                        </div>
                        <%--****************************************************ADD ZONE START*****************************************************--%>
                        <div class="box-body" id="box-body-pr">
                            <div id="box-body">
                                <label for="box-body" style="background-color: #9cc2cb; width: 100%;"><span
                                        id="task_cnt">　TASK</span></label>
                                <div class="form-group col-sm-3">
                                    <select class="form-control" name="taskTypeTemp" id="taskTypeTemp">
                                        <option value="0">Main</option>
                                        <option value="1">Additional</option>
                                    </select>
                                </div>
                                <div class="form-group col-sm-6">
                                    <div class="input-daterange input-group form-group" id="mydate">
                                        <input type="text" class="input-sm form-control taskDateStartTemp" name="taskDateStartTemp" placeholder="start date"  onfocus="(this.type='date')" id="start" value="" style="height: 34px">
                                        <span class="input-group-addon">to</span>
                                        <input type="text" class="input-sm form-control taskDateEndTemp" name="taskDateEndTemp" placeholder="end date" onfocus="(this.type='date')" id="end" value="" style="height: 34px">
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
                                <div class="form-group form-group col-sm-12">
                                    <label for="taskGoalTitle">Goal Title </label>
                                    <input type="text" class="form-control" name="taskGoalTitleTemp" id="taskGoalTitle">
                                </div>
                                <div class="form-group col-sm-12">
                                    <label for="taskGoalDescription">Goal Description</label>
                                    <textarea class="form-control" name="taskGoalDescriptionTemp" id="taskGoalDescription" rows="15"
                                              style="resize: none">[Issue. Gap]


[Target]


[Tasks '-':Must. '+']
</textarea>
                                </div>
                                <div class="form-group col-sm-12">
                                    <label for="taskEvaluationComment">Evaluation comments by Self</label>
                                    <textarea class="form-control" name="taskEvaluationCommentTemp" id="taskEvaluationComment" placeholder=" " rows="8"
                                              style="resize: none">[Result]

[Keep]

[Problem]

[Try]
</textarea>
                                </div>
                                <div class="form-group col-sm-12">
                                    <label for="taskRate">Rating by Self (evaluation)</label>
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
                            </div>
                            <div class="form-group">
                                <input type="hidden" name="historyWriter" id="historyWriter"
                                       value="${sessionScope.userLoginInfo.employeeNumber}">
                                <input type="hidden" name="historyWriterName" value="${sessionScope.userLoginInfo.name}">
                            </div>
                            <div id="remove_img">
                                <img onclick="removeSheet()" src="/dist/img/remove.png" style="width:20px; margin-left:8px; margin-right:10px; float:right; cursor: pointer;" alt="remove image">
                            </div>
                            <div id="add_img">
                                <img onclick="addSheet()" src="/dist/img/add.png" style="width:20px;  float:right; cursor: pointer;" alt="add image">
                            </div>
                            <%--****************************************************ADD ZONE END*****************************************************--%>
                            <div class="form-group col-sm-12" id="competency_area">
                                <br/><br/>
                                <hr>
                                <label for="taskCompetency" style="background-color: #DC143C; width: 100%;">
                                    <span>　COMPETENCY</span></label>
                                <label for="taskCompetency">Goal Setting Comments for competencies</label>
                                <textarea class="form-control" name="taskCompetency" id="taskCompetency" rows="10"
                                          style="resize: none">[Issue, Gap]


[Target]


[Tasks '-':Must, '+']
</textarea>
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
                                            grade level or higher.
                                        </option>
                                        <option value="4">4.0 - Meets expectations in one’s current grade and sometimes
                                            exceeds expectations at the next grade level.
                                        </option>
                                        <option value="3">3.0 - Consistently meets expectations required in one's
                                            grade.
                                        </option>
                                        <option value="2">2.0 - Inconsistently meets expectations required in one's
                                            grade.
                                        </option>
                                        <option value="1">1.0 - Performance is at a level which is one grade below or
                                            more their current level.
                                        </option>
                                    </select>
                                </div>
                                <div class="form-group col-sm">
                                    <label for="overallPerformanceComment">Overall performance Comments</label>
                                    <textarea class="form-control" name="overallPerformanceComment"
                                              id="overallPerformanceComment" placeholder=" " rows="8"
                                              style="resize: none">[Result]

[Keep]

[Problem]

[Try]
</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="box-footer">
                            <input type="button" class="btn btn-danger" id="resetBtn" value="reset">
                            <input type="button" class="btn btn-success " onclick="checkFormValidity()" value=" save " style="float: right">
                        </div>
                    </div>
                </form>
            </div>
        </section>
        <%-- /.content --%>
    </div>
    <%-- /.content-wrapper --%>
    <%-- Main Footer --%>
    <%@ include file="../include/main_footer.jsp" %>
</div>
<%-- ./wrapper --%>
<%--plugin_js.jsp--%>
<%@ include file="../include/plugin_js.jsp" %>
<script src="/dist/js/board/sheetsValueResetSetting.js"></script>
<script>
</script>
</body>
</html>