CLASS zcl_fg100_calc_run DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.

CLASS zcl_fg100_calc_run IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    SELECT FROM zfg100_c_employeecalc
      FIELDS
        FullName,
        IncreasedSalary,
        CurrencyCode,
        SalaryCategory
      INTO TABLE @DATA(lt_calc)
      UP TO 10 ROWS.

    out->write( lt_calc ).

  ENDMETHOD.
ENDCLASS.
