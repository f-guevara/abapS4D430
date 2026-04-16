@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Employee View - Exercise 11'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true

define view entity ZFG100_R_EMPLOYEE
  as select from zfg100employ

  -- Task 2: Define Association to Department
  -- Cardinality [1..1] because every employee belongs to exactly one department
  association [1..1] to ZFG100_R_DEPARTMENT as _Department 
    on $projection.DepartmentId = _Department.Id

{
    key id                    as EmployeeId,
    first_name                as FirstName,
    last_name                 as LastName,
    birth_date                as BirthDate,
    entry_date                as EntryDate,
    department_id             as DepartmentId,

    @Semantics.amount.currencyCode: 'CurrencyCode'
    annual_salary             as AnnualSalary,
    currency_code             as CurrencyCode,

    -- Administrative fields
    created_by                as CreatedBy,
    created_at                as CreatedAt,
    local_last_changed_by     as LocalLastChangedBy,
    local_last_changed_at     as LocalLastChangedAt,
    last_changed_at           as LastChangedAt,
    
    

    -- Task 2: Expose Association
    _Department
}
