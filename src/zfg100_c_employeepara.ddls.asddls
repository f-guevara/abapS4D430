@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee with Parameters'
@Metadata.ignorePropagatedAnnotations: true

-- Define the parameters here
define view entity ZFG100_C_EMPLOYEEPARA 
  with parameters 
    p_target_curr : abap.cuky,  -- Target Currency (e.g., EUR)
    p_ex_rate     : abap.dec(10,5)      -- Exchange Rate
  as select from ZFG100_R_EMPLOYEE
{
    key EmployeeId,
    FirstName,
    LastName,
    
    -- Original Salary
    @Semantics.amount.currencyCode: 'CurrencyCode'
    AnnualSalary,
    CurrencyCode,
    
    -- Calculated Salary in Target Currency
    -- We use $parameters.Name to access the user input
    @Semantics.amount.currencyCode: 'TargetCurrency'
    cast( AnnualSalary as abap.dec(15,2) ) * $parameters.p_ex_rate as ConvertedSalary,
    
    -- We show the target currency as a field
    $parameters.p_target_curr                                      as TargetCurrency
}
