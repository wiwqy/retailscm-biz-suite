<%@ page import='java.util.*,com.doublechaintech.retailscm.*'%>
<%@ page language="java" contentType="text/plain; charset=utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sky" tagdir="/tags"%>
<fmt:setLocale value="zh_CN"/>
<c:set var="ignoreListAccessControl" value="${true}"/>


<c:if test="${ empty companyTrainingList}" >
	<div class="row" style="font-size: 30px;">
		<div class="col-xs-12 col-md-12" style="padding-left:20px">
		 ${userContext.localeMap['@not_found']}${userContext.localeMap['company_training']}! 
		 <a href="./${ownerBeanName}Manager/addCompanyTraining/${result.id}/"><i class="fa fa-plus-square" aria-hidden="true"></i></a>
		 
		 
		 
		 </div>
	</div>

</c:if>




	

 <c:if test="${not empty companyTrainingList}" >
    
    
<%

 	SmartList list=(SmartList)request.getAttribute("companyTrainingList"); 
 	int totalCount = list.getTotalCount();
 	List pages = list.getPages();
 	pageContext.setAttribute("rowsPerPage",list.getRowsPerPage()); 
 	
 	pageContext.setAttribute("pages",pages); 
 	pageContext.setAttribute("totalCount",totalCount); 
 	//pageContext.setAttribute("accessible",list.isAccessible()); 
 	//the reason using scriptlet here is the el express is currently not able resolv common property from a subclass of list
%>
    
 	   
    <div class="row" style="font-size: 30px;">
		<div class="col-xs-12 col-md-12" style="padding-left:20px">
		<i class='fa fa-table'></i> ${userContext.localeMap['company_training']}(${totalCount})
		<a href="./${ownerBeanName}Manager/addCompanyTraining/${result.id}/"><i class="fa fa-plus-square" aria-hidden="true"></i></a>
		 
		 		 	<div class="btn-group" role="group" aria-label="Button group with nested dropdown">		
	<c:forEach var="action" items="${result.actionList}">
		<c:if test="${'companyTrainingList' eq action.actionGroup}">
		<a class="btn btn-${action.actionLevel} btn-sm" href="${action.managerBeanName}/${action.actionPath}">${userContext.localeMap[action.localeKey]}</a>
		</c:if>
	</c:forEach>
	</div><!--end of div class="btn-group" -->
	
		 
		 
		 
		 </div>
 </div>
    
    
<div class="table-responsive">


<c:set var="currentPageNumber" value="1"/>	



<nav aria-label="Page navigation example">
  <ul class="pagination">
<c:forEach var="page" items="${pages}"> 
<c:set var="classType" value=""/>
<c:if test='${page.selected}' >
<c:set var="classType" value="active"/>
<c:set var="currentPageNumber" value="${page.pageNumber}"/>
</c:if>


	<li class="page-item ${classType}">
		<a href='#${ownerBeanName}Manager/load${ownerClassName}/${result.id}/${companyTrainingListName};${companyTrainingListName}CurrentPage=${page.pageNumber};${companyTrainingListName}RowsPerPage=${rowsPerPage}/' 
			class='page-link page-action '>${page.title}</a>
	</li>
</c:forEach>
 </ul>
</nav>


   


	<table class="table table-striped" pageToken='companyTrainingListCurrentPage=${currentPageNumber}'>
		<thead><tr>
		<c:if test="${param.referName ne 'id'}">
	<th>${userContext.localeMap['company_training.id']}</th>
</c:if>
<c:if test="${param.referName ne 'title'}">
	<th>${userContext.localeMap['company_training.title']}</th>
</c:if>
<c:if test="${param.referName ne 'company'}">
	<th>${userContext.localeMap['company_training.company']}</th>
</c:if>
<c:if test="${param.referName ne 'instructor'}">
	<th>${userContext.localeMap['company_training.instructor']}</th>
</c:if>
<c:if test="${param.referName ne 'trainingCourseType'}">
	<th>${userContext.localeMap['company_training.training_course_type']}</th>
</c:if>
<c:if test="${param.referName ne 'timeStart'}">
	<th>${userContext.localeMap['company_training.time_start']}</th>
</c:if>
<c:if test="${param.referName ne 'durationHours'}">
	<th>${userContext.localeMap['company_training.duration_hours']}</th>
</c:if>
<th>${userContext.localeMap['@action']}</th>
		</tr></thead>
		<tbody>
			
			<c:forEach var="item" items="${companyTrainingList}">
				<tr currentVersion='${item.version}' id="companyTraining-${item.id}" ><td><a class="link-action-removed" href="./companyTrainingManager/view/${item.id}/"> ${item.id}</a></td>
<c:if test="${param.referName ne 'title'}">	<td contenteditable='true' class='edit-value'  propertyToChange='title' storedCellValue='${item.title}' prefix='${ownerBeanName}Manager/updateCompanyTraining/${result.id}/${item.id}/'>${item.title}</td>
</c:if><c:if test="${param.referName ne 'company'}">
	<td class="select_candidate_td"
			data-candidate-method="./companyTrainingManager/requestCandidateCompany/${ownerBeanName}/${item.id}/"
			data-switch-method="./companyTrainingManager/transferToAnotherCompany/${item.id}/"
			data-link-template="./retailStoreCountryCenterManager/view/${'$'}{ID}/">
		<span class="display_span">
			<c:if test="${not empty  item.company}">
			<a href='./retailStoreCountryCenterManager/view/${item.company.id}/'>${item.company.displayName}</a>
			</c:if>
			<c:if test="${empty  item.company}">
			<a href='#'></a>
			</c:if>
			<button class="btn btn-link candidate-action">...</button>
		</span>
		<div class="candidate_span" style="display:none;">
			<input type="text" data-provide="typeahead" class="input-sm form-control candidate-filter-input" autocomplete="off" />
		</div>
	</td>
</c:if>
<c:if test="${param.referName ne 'instructor'}">
	<td class="select_candidate_td"
			data-candidate-method="./companyTrainingManager/requestCandidateInstructor/${ownerBeanName}/${item.id}/"
			data-switch-method="./companyTrainingManager/transferToAnotherInstructor/${item.id}/"
			data-link-template="./instructorManager/view/${'$'}{ID}/">
		<span class="display_span">
			<c:if test="${not empty  item.instructor}">
			<a href='./instructorManager/view/${item.instructor.id}/'>${item.instructor.displayName}</a>
			</c:if>
			<c:if test="${empty  item.instructor}">
			<a href='#'></a>
			</c:if>
			<button class="btn btn-link candidate-action">...</button>
		</span>
		<div class="candidate_span" style="display:none;">
			<input type="text" data-provide="typeahead" class="input-sm form-control candidate-filter-input" autocomplete="off" />
		</div>
	</td>
</c:if>
<c:if test="${param.referName ne 'trainingCourseType'}">
	<td class="select_candidate_td"
			data-candidate-method="./companyTrainingManager/requestCandidateTrainingCourseType/${ownerBeanName}/${item.id}/"
			data-switch-method="./companyTrainingManager/transferToAnotherTrainingCourseType/${item.id}/"
			data-link-template="./trainingCourseTypeManager/view/${'$'}{ID}/">
		<span class="display_span">
			<c:if test="${not empty  item.trainingCourseType}">
			<a href='./trainingCourseTypeManager/view/${item.trainingCourseType.id}/'>${item.trainingCourseType.displayName}</a>
			</c:if>
			<c:if test="${empty  item.trainingCourseType}">
			<a href='#'></a>
			</c:if>
			<button class="btn btn-link candidate-action">...</button>
		</span>
		<div class="candidate_span" style="display:none;">
			<input type="text" data-provide="typeahead" class="input-sm form-control candidate-filter-input" autocomplete="off" />
		</div>
	</td>
</c:if>
<c:if test="${param.referName ne 'timeStart'}">	<td contenteditable='true' class='edit-value'  propertyToChange='timeStart' storedCellValue='${item.timeStart}' prefix='${ownerBeanName}Manager/updateCompanyTraining/${result.id}/${item.id}/'><fmt:formatDate pattern="yyyy-MM-dd" value="${item.timeStart}" /></td>
</c:if><c:if test="${param.referName ne 'durationHours'}">	<td contenteditable='true' class='edit-value'  propertyToChange='durationHours' storedCellValue='${item.durationHours}' prefix='${ownerBeanName}Manager/updateCompanyTraining/${result.id}/${item.id}/'>${item.durationHours}</td>
</c:if>
				<td>

				<a href='#${ownerBeanName}Manager/removeCompanyTraining/${result.id}/${item.id}/' class='delete-action btn btn-danger btn-xs'><i class="fa fa-trash-o fa-lg"></i> ${userContext.localeMap['@delete']}</a>
				<a href='#${ownerBeanName}Manager/copyCompanyTrainingFrom/${result.id}/${item.id}/' class='copy-action btn btn-success btn-xs'><i class="fa fa-files-o fa-lg"></i> ${userContext.localeMap['@copy']} </a>

				</td>
				</tr>
			</c:forEach>
		
		</tbody>
	</table>	
	

</div></c:if>


