CLASS ltc_gilded_rose_old DEFINITION DEFERRED.
CLASS zcl_gilded_rose DEFINITION LOCAL FRIENDS ltc_gilded_rose_old.

CLASS ltc_gilded_rose_old DEFINITION FINAL FOR TESTING RISK LEVEL HARMLESS.
  PRIVATE SECTION.
    METHODS: quality_is_0       FOR TESTING,
             quality_is_5       FOR TESTING,
             quality_is_50      FOR TESTING,
             sell_in_is_0       FOR TESTING,
             sell_in_is_5       FOR TESTING,
             sell_in_is_minus_1 FOR TESTING.

ENDCLASS.

CLASS ltc_gilded_rose_old IMPLEMENTATION.

  METHOD quality_is_5.

    DATA(lt_items) = VALUE zcl_gilded_rose=>tt_items( ( NEW #( iv_name    = |Backstage passes to a TAFKAL80ETC concert|
                                                               iv_sell_in = 5
                                                               iv_quality = 2 ) ) ).
    DATA(lo_app) = NEW zcl_gilded_rose( it_items = lt_items ).

    lo_app->update_quality( ).

    cl_abap_unit_assert=>assert_equals(
                     act = CAST zcl_item( lt_items[ 1 ] )->mv_quality
                     exp = 5 ).

  ENDMETHOD.

  METHOD quality_is_50.
     DATA(lt_items) = VALUE zcl_gilded_rose=>tt_items( ( NEW #( iv_name    = |Backstage passes to a TAFKAL80ETC concert|
                                                               iv_sell_in = 5
                                                               iv_quality = 50 ) ) ).
    DATA(lo_app) = NEW zcl_gilded_rose( it_items = lt_items ).

    lo_app->update_quality( ).

    cl_abap_unit_assert=>assert_equals(
                     act = CAST zcl_item( lt_items[ 1 ] )->mv_quality
                     exp = 50 ).
  ENDMETHOD.

  METHOD quality_is_0.

    DATA(lt_items) = VALUE zcl_gilded_rose=>tt_items( ( NEW #( iv_name    = |Backstage passes to a TAFKAL80ETC concert|
                                                               iv_sell_in = 0
                                                               iv_quality = 0 ) ) ).
    DATA(lo_app) = NEW zcl_gilded_rose( it_items = lt_items ).

    lo_app->update_quality( ).

    cl_abap_unit_assert=>assert_equals(
                     act = CAST zcl_item( lt_items[ 1 ] )->mv_quality
                     exp = 0 ).
  ENDMETHOD.

  METHOD sell_in_is_0.
    DATA(lt_items) = VALUE zcl_gilded_rose=>tt_items( ( NEW #( iv_name    = |Backstage passes to a TAFKAL80ETC concert|
                                                               iv_sell_in = 1
                                                               iv_quality = 0 ) ) ).
    DATA(lo_app) = NEW zcl_gilded_rose( it_items = lt_items ).

    lo_app->update_quality( ).

    cl_abap_unit_assert=>assert_equals(
                     act = CAST zcl_item( lt_items[ 1 ] )->mv_sell_in
                     exp = 0 ).
  ENDMETHOD.

  METHOD sell_in_is_5.
    DATA(lt_items) = VALUE zcl_gilded_rose=>tt_items( ( NEW #( iv_name    = |Backstage passes to a TAFKAL80ETC concert|
                                                               iv_sell_in = 6
                                                               iv_quality = 10 ) ) ).
    DATA(lo_app) = NEW zcl_gilded_rose( it_items = lt_items ).

    lo_app->update_quality( ).

    cl_abap_unit_assert=>assert_equals(
                     act = CAST zcl_item( lt_items[ 1 ] )->mv_sell_in
                     exp = 5 ).
  ENDMETHOD.

  METHOD sell_in_is_minus_1.
    DATA(lt_items) = VALUE zcl_gilded_rose=>tt_items( ( NEW #( iv_name    = |Backstage passes to a TAFKAL80ETC concert|
                                                               iv_sell_in = 0
                                                               iv_quality = 10 ) ) ).
    DATA(lo_app) = NEW zcl_gilded_rose( it_items = lt_items ).

    lo_app->update_quality( ).

    cl_abap_unit_assert=>assert_equals(
                     act = CAST zcl_item( lt_items[ 1 ] )->mv_sell_in
                     exp = -1 ).
  ENDMETHOD.

ENDCLASS.
