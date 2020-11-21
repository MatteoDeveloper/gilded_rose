CLASS ltcl_sell_in DEFINITION DEFERRED.
CLASS zcl_sell_in DEFINITION LOCAL FRIENDS ltcl_sell_in.

CLASS ltcl_sell_in DEFINITION FOR TESTING
RISK LEVEL HARMLESS
DURATION SHORT.

  PRIVATE SECTION.
    DATA: mo_cut          TYPE REF TO zif_sell_in,
          mo_quality_mock TYPE REF TO zif_quality.
    METHODS: quality_is_bound    FOR TESTING,
      sell_in_is_5        FOR TESTING,
      sell_in_range_6_to_11 FOR TESTING,
      sell_in_range_0_to_6  FOR TESTING,
      sell_in_range_0_to_11 FOR TESTING,
      sell_in_is_zero FOR TESTING,
      sell_in_is_20       FOR TESTING.
ENDCLASS.

CLASS ltcl_sell_in IMPLEMENTATION.

  METHOD quality_is_bound.
    mo_cut = new zcl_sell_in( 5 ).
    mo_cut->register( new zcl_quality( 5 ) ).

    cl_abap_unit_assert=>assert_bound( CAST zcl_sell_in( mo_cut )->mo_quality ).

  ENDMETHOD.

  METHOD sell_in_is_5.
    mo_cut = new zcl_sell_in( 5 ).
    mo_quality_mock ?= cl_abap_testdouble=>create( 'zif_quality' ).
    cl_abap_testdouble=>configure_call( mo_quality_mock ).
    mo_quality_mock->update(  ).
    mo_cut->register( mo_quality_mock ).
    mo_cut->update( ).

    cl_abap_unit_assert=>assert_equals( exp = 4
                                        act = CAST zcl_sell_in( mo_cut )->mv_sell_in
                                      ).
  ENDMETHOD.

  METHOD sell_in_range_6_to_11.
    mo_cut           = new zcl_sell_in( 8 ).
    DATA(mo_quality) = new zcl_quality( 5 ).
    mo_cut->register( mo_quality ).
    mo_cut->update( ).

    cl_abap_unit_assert=>assert_equals( exp = 7
                                        act = CAST zif_quality( mo_quality )->read(  )
                                      ).
  ENDMETHOD.

    METHOD sell_in_range_0_to_6.
    mo_cut           = new zcl_sell_in( 5 ).
    DATA(mo_quality) = new zcl_quality( 5 ).
    mo_cut->register( mo_quality ).
    mo_cut->update( ).

    cl_abap_unit_assert=>assert_equals( exp = 8
                                        act = CAST zif_quality( mo_quality )->read(  )
                                      ).
  ENDMETHOD.

  METHOD sell_in_is_zero.
    mo_cut           = new zcl_sell_in( 0 ).
    DATA(mo_quality) = new zcl_quality( 0 ).

    mo_cut->register( mo_quality ).
    mo_cut->update( ).

    cl_abap_unit_assert=>assert_equals( exp = 0
                                        act = CAST zif_quality( mo_quality )->read(  )
                                      ).
  ENDMETHOD.

  METHOD sell_in_is_20.
    mo_cut           = new zcl_sell_in( 20 ).
    DATA(mo_quality) = new zcl_quality( 5 ).
    mo_cut->register( mo_quality ).
    mo_cut->update( ).

    cl_abap_unit_assert=>assert_equals( exp = 6
                                        act = CAST zif_quality( mo_quality )->read(  )
                                      ).
  ENDMETHOD.

  METHOD sell_in_range_0_to_11.
    mo_cut           = new zcl_sell_in( 3 ).
    DATA(mo_quality) = new zcl_quality( 5 ).
    mo_cut->register( mo_quality ).
    mo_cut->update( ).

    cl_abap_unit_assert=>assert_equals( exp = 8
                                        act = CAST zif_quality( mo_quality )->read(  )
                                      ).
  ENDMETHOD.

ENDCLASS.
