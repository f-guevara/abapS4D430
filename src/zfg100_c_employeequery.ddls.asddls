@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee Query with Path Expressions'
@Metadata.ignorePropagatedAnnotations: true

define view entity ZFG100_C_EMPLOYEEQUERY 
  as select from ZFG100_R_EMPLOYEE
{
    key EmployeeId,
    FirstName,
    LastName,
    DepartmentId,
    
    -- Task 1.4: Path expression to Department Description
    _Department.Description as DepartmentDescription,
    
    -- Task 1.6: Path expression to Assistant's Last Name
    -- Logic: Employee -> _Department -> _Assistant -> LastName
    _Department._Assistant.LastName as AssistantName,
    
    /* Expose association so ABAP SQL can use it in Task 2 */
    _Department
}
