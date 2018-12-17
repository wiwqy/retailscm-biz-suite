import { get,postForm,PREFIX,joinParameters,joinPostParameters } from '../../axios/tools'


const view = (targetObjectId) => {
  return get({
    url: `${PREFIX}leaveTypeManager/view/${targetObjectId}/`,
  })
}



const load = (targetObjectId, parameters) => {
  const parametersExpr = joinParameters(parameters)
  return get({
    url: `${PREFIX}leaveTypeManager/loadLeaveType/${targetObjectId}/${parametersExpr}/`,
  })
}



const requestCandidateCompany = (ownerClass, id, filterKey, pageNo) => {
 
  const url = `${PREFIX}leaveTypeManager/requestCandidateCompany/ownerClass/id/filterKey/pageNo/`
  const requestParameters = {id, ownerClass,filterKey, pageNo}
  return postForm({url,requestParameters})
}	

const transferToAnotherCompany = (id, parameters) => {
  //const parametersExpr = joinParameters(parameters)
  const url = `${PREFIX}leaveTypeManager/transferToAnotherCompany/id/anotherCompanyId/`
  const requestParameters = {id, ...parameters}
  return postForm({url,requestParameters})
}







const addEmployeeLeave = (targetObjectId, parameters) => {
  const url = `${PREFIX}leaveTypeManager/addEmployeeLeave/leaveTypeId/whoId/leaveDurationHour/remark/tokensExpr/`
  const leaveTypeId = targetObjectId
  const requestParameters = { ...parameters, leaveTypeId, tokensExpr: 'none' }
  return postForm({ url,requestParameters})
}

const updateEmployeeLeave = (targetObjectId, parameters) => {
  const url = `${PREFIX}leaveTypeManager/updateEmployeeLeaveProperties/leaveTypeId/id/leaveDurationHour/remark/tokensExpr/`
  const leaveTypeId = targetObjectId
  const requestParameters = { ...parameters, leaveTypeId, tokensExpr: 'none' }
  return postForm({ url,requestParameters})
}

const removeEmployeeLeaveList = (targetObjectId, parameters) => {
  const url = `${PREFIX}leaveTypeManager/removeEmployeeLeaveList/leaveTypeId/employeeLeaveIds/tokensExpr/`
  const requestParameters = { ...parameters, leaveTypeId: targetObjectId, tokensExpr: 'none' }
  return postForm({ url,requestParameters})
}


const LeaveTypeService = { view,
  load,
  addEmployeeLeave,
  updateEmployeeLeave,
  removeEmployeeLeaveList,
  requestCandidateCompany,
  transferToAnotherCompany }
export default LeaveTypeService

