CLASS ltcl_quality DEFINITION DEFERRED.
CLASS zcl_quality DEFINITION LOCAL FRIENDS ltcl_quality.

CLASS ltcl_quality DEFINITION FOR TESTING
RISK LEVEL HARMLESS
DURATION SHORT.

  PRIVATE SECTION.
    DATA: mo_cut TYPE REF TO zif_quality.
    METHODS:
      quality_is_max FOR TESTING,
      quality_is_5 FOR TESTING,
      quality_is_0 FOR TESTING.
ENDCLASS.

CLASS ltcl_quality IMPLEMENTATION.

  METHOD  quality_is_5.
    mo_cut = new zcl_quality( iv_quality = 4  ).
    mo_cut->update( ).
    cl_abap_unit_assert=>assert_equals( exp = 5
                                        act = mo_cut->read( ) ).
  ENDMETHOD.


  METHOD quality_is_0.
    mo_cut = new zcl_quality( iv_quality = 4  ).
    mo_cut->reset( ).

    cl_abap_unit_assert=>assert_equals( exp = 0
                                        act = mo_cut->read( ) ).

  ENDMETHOD.

  METHOD quality_is_max.
    mo_cut = new zcl_quality( iv_quality = 50  ).
    mo_cut->update( ).

    cl_abap_unit_assert=>assert_equals( exp = 50
                                        act = mo_cut->read( ) ).
  ENDMETHOD.

ENDCLASS.
