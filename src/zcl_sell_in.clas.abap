CLASS zcl_sell_in DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: zif_sell_in.
    ALIASES: mc_zero FOR zif_sell_in~mc_zero.
    METHODS constructor
      IMPORTING iv_sell_in TYPE i.
  PRIVATE SECTION.
    CONSTANTS:
      mc_eleven TYPE i VALUE 11,
      mc_six    TYPE i VALUE 6.

    DATA: mv_sell_in TYPE i,
          mo_quality TYPE REF TO zif_quality.

    METHODS:
      decrement,
      change_quality,
      is_sell_in_negativ
        RETURNING
          VALUE(r_result) TYPE abap_bool,
      reset_quality,
      is_smaller
        IMPORTING iv_number       TYPE i
        RETURNING
                  VALUE(r_result) TYPE abap_bool,
      update_quality,
      get_mv_sell_in RETURNING VALUE(r_result) TYPE i.
ENDCLASS.


CLASS zcl_sell_in IMPLEMENTATION.

  METHOD constructor.
    mv_sell_in = iv_sell_in.
  ENDMETHOD.

  METHOD zif_sell_in~read.
    rv_sell_in = mv_sell_in.
  ENDMETHOD.

  METHOD zif_sell_in~update.
    decrement(  ).
    zif_sell_in~notify(  ).
  ENDMETHOD.

  METHOD decrement.
    mv_sell_in -= 1.
  ENDMETHOD.

  METHOD zif_sell_in~register.
    mo_quality = io_quality.
  ENDMETHOD.

  METHOD zif_sell_in~notify.

    IF is_sell_in_negativ( ).
      reset_quality( ).
      EXIT.
    ENDIF.

    change_quality( ).
  ENDMETHOD.

  METHOD reset_quality.
    mo_quality->reset(  ).
  ENDMETHOD.

  METHOD is_sell_in_negativ.
    r_result = xsdbool( mv_sell_in < mc_zero ).
  ENDMETHOD.

  METHOD change_quality.

    update_quality( ).

    IF is_smaller( mc_eleven ).
      update_quality( ).
    ENDIF.

    IF is_smaller( mc_six ).
      update_quality( ).
    ENDIF.

  ENDMETHOD.

  METHOD update_quality.
    mo_quality->update(  ).
  ENDMETHOD.

  METHOD is_smaller.
    r_result = xsdbool( get_mv_sell_in(  ) < iv_number ).
  ENDMETHOD.

  METHOD get_mv_sell_in.
    r_result = me->mv_sell_in.
  ENDMETHOD.

ENDCLASS.
