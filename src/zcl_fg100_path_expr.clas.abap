CLASS zcl_fg100_path_expr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.

CLASS zcl_fg100_path_expr IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    SELECT FROM zfg100_c_employeequery
      FIELDS
        EmployeeId,
        FirstName,
        LastName,
        DepartmentDescription,
        AssistantName,

        \_Department\_Head-LastName AS HeadName
      INTO TABLE @DATA(lt_employees)
      UP TO 100 ROWS.


    out->write( lt_employees ).

  ENDMETHOD.
ENDCLASS.
