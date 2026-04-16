@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Department View - Exercise 11'
@Metadata.ignorePropagatedAnnotations: true

define view entity ZFG100_R_DEPARTMENT
  as select from zfg100depment

  -- Task 3: Define More Associations
  -- 1. Association for all employees assigned to this department
  association [0..*] to ZFG100_R_EMPLOYEE as _Employee 
    on $projection.Id = _Employee.DepartmentId

  -- 2. Association for the department head (Optional 0..1)
  association [0..1] to ZFG100_R_EMPLOYEE as _Head     
    on $projection.DepartmentHead = _Head.EmployeeId

  -- 3. Association for the department assistant (Mandatory 1..1)
  association [1..1] to ZFG100_R_EMPLOYEE as _Assistant 
    on $projection.DepartmentAssistant = _Assistant.EmployeeId

{
    key id                   as Id,
    description              as Description,
    department_head          as DepartmentHead,
    department_assistant     as DepartmentAssistant,

    -- Administrative fields
    created_by               as CreatedBy,
    created_at               as CreatedAt,
    local_last_changed_by    as LocalLastChangedBy,
    local_last_changed_at    as LocalLastChangedAt,
    last_changed_at          as LastChangedAt,

    -- Task 3: Expose Associations
    _Employee,
    _Head,
    _Assistant
}
