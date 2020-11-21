CLASS zcl_backstage DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: zif_gilded_rose_element.
    METHODS constructor
      IMPORTING
        io_quality TYPE REF TO zif_quality
        io_sell_in TYPE REF TO zif_sell_in.
  PRIVATE SECTION.
    DATA: mo_quality TYPE REF TO zif_quality,
          mo_sell_in TYPE REF TO zif_sell_in.
ENDCLASS.


CLASS zcl_backstage IMPLEMENTATION.

  METHOD constructor.
    mo_quality = io_quality.
    mo_sell_in = io_sell_in.
    mo_sell_in->register( mo_quality ).
  ENDMETHOD.

  METHOD zif_gilded_rose_element~update.
    mo_sell_in->update(  ).
  ENDMETHOD.

  METHOD zif_gilded_rose_element~read_quality.
    rv_quality = mo_quality->read( ).
  ENDMETHOD.

  METHOD zif_gilded_rose_element~read_sell_in.
    rv_sell_in = mo_sell_in->read(  ).
  ENDMETHOD.

ENDCLASS.
