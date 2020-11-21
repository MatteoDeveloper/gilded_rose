CLASS zcl_quality DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: zif_quality.
    ALIASES: mc_one FOR zif_quality~mc_one.
    METHODS constructor
      IMPORTING
        iv_quality TYPE i.

  PRIVATE SECTION.
    CONSTANTS mc_max TYPE i VALUE 50.

    DATA: mv_quality TYPE i.

    METHODS:
      increment,
      is_valid
        RETURNING
          VALUE(rv_result) TYPE abap_bool,
      get_mv_quality RETURNING value(rv_result) TYPE i.
ENDCLASS.


CLASS zcl_quality IMPLEMENTATION.

  METHOD constructor.
    mv_quality = iv_quality.
  ENDMETHOD.

  METHOD zif_quality~read.
    rv_quality = mv_quality.
  ENDMETHOD.

  METHOD zif_quality~reset.
    CLEAR: mv_quality.
  ENDMETHOD.

  METHOD zif_quality~update.
    IF is_valid( ).
      increment( ).
    ENDIF.
  ENDMETHOD.

  METHOD is_valid.
    rv_result = xsdbool( get_mv_quality(  ) < mc_max ).
  ENDMETHOD.

  METHOD increment.
    mv_quality += mc_one.
  ENDMETHOD.

  METHOD get_mv_quality.
    rv_result = me->mv_quality.
  ENDMETHOD.

ENDCLASS.
