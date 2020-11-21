CLASS ltcl_backstage DEFINITION DEFERRED.
CLASS zcl_backstage DEFINITION LOCAL FRIENDS ltcl_backstage.

CLASS ltcl_backstage DEFINITION FOR TESTING
RISK LEVEL HARMLESS
DURATION SHORT.

  PRIVATE SECTION.
    DATA: mo_cut TYPE REF TO zif_gilded_rose_element,
          mo_quality_mock TYPE REF TO zif_quality,
          mo_sell_in_mock TYPE REF TO zif_sell_in.

    METHODS: setup,

      quality_is_7        FOR TESTING,
      quality_is_10       FOR TESTING,
      sell_in_is_5        FOR TESTING.
ENDCLASS.

CLASS ltcl_backstage IMPLEMENTATION.

  METHOD setup.
           mo_quality_mock ?= cl_abap_testdouble=>create( 'zif_quality' ).
           mo_sell_in_mock ?= cl_abap_testdouble=>create( 'zif_sell_in' ).

           cl_abap_testdouble=>configure_call( mo_quality_mock )->returning( 10 ).
           mo_quality_mock->read(  ).

           cl_abap_testdouble=>configure_call( mo_sell_in_mock )->returning( 5 ).
           mo_sell_in_mock->read(  ).

           mo_cut = new zcl_backstage( io_quality = mo_quality_mock io_sell_in = mo_sell_in_mock ).
  ENDMETHOD.

  METHOD quality_is_10.

    mo_cut->update( ).
    cl_abap_unit_assert=>assert_equals( exp = 10
                                        act = mo_cut->read_quality(  ) ).
  ENDMETHOD.

  METHOD sell_in_is_5.
    mo_cut->update( ).
    cl_abap_unit_assert=>assert_equals( exp = 5
                                        act = mo_cut->read_sell_in(  ) ).
  ENDMETHOD.

  METHOD quality_is_7.

    mo_cut = new zcl_backstage( io_quality = new zcl_quality( 4 )
                                io_sell_in = new zcl_sell_in( 5 ) ).
    mo_cut->update( ).
    cl_abap_unit_assert=>assert_equals( exp = 7
                                        act = mo_cut->read_quality(  ) ).
  ENDMETHOD.

ENDCLASS.
