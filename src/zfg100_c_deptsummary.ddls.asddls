@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Department Salary Summary'
@Metadata.ignorePropagatedAnnotations: true

define view entity ZFG100_C_DEPTSUMMARY 
  as select from ZFG100_R_EMPLOYEE
{
    -- 1. The field we group by
    DepartmentId,
    
    -- 2. Count the number of employees
    count(*)                                     as EmployeeCount,
    
    -- 3. Total Salary (Sum)
    -- We must cast CURR to DEC to perform aggregation in some environments
    @Semantics.amount.currencyCode: 'CurrencyCode'
    sum( cast( AnnualSalary as abap.dec(15,2) ) ) as TotalSalary,
    
    -- 4. Average Salary
    @Semantics.amount.currencyCode: 'CurrencyCode'
    avg( cast( AnnualSalary as abap.dec(15,2) ) as abap.dec(15,2) ) as AverageSalary,
    
    CurrencyCode
}
-- Mandatory: Group by all fields that are NOT aggregates
group by 
    DepartmentId, 
    CurrencyCode
