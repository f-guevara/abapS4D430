@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee with Calculations'
@Metadata.ignorePropagatedAnnotations: true

define view entity ZFG100_C_EMPLOYEECALC 
  as select from ZFG100_R_EMPLOYEE
{
    key EmployeeId,
    FirstName,
    LastName,
    
    -- 1. String Concatenation: Full Name
    concat_with_space(FirstName, LastName, 1) as FullName,
    
    -- 2. Arithmetic: Salary with a 10% raise
    @Semantics.amount.currencyCode: 'CurrencyCode'
    cast( AnnualSalary as abap.dec(15,2) ) * cast( 1.1 as abap.dec(3,2) ) as IncreasedSalary,
    
    CurrencyCode,
    
    -- 3. Case Expression: Salary Category
    case 
      when AnnualSalary > 90000 then 'High'
      when AnnualSalary > 60000 then 'Medium'
      else 'Low'
    end                                       as SalaryCategory
}
