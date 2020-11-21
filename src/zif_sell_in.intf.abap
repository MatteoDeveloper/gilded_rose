interface ZIF_SELL_IN
  public .
  CONSTANTS mc_zero TYPE i VALUE 0.

METHODS: read
            RETURNING VALUE(rv_sell_in) TYPE i,
         update,
         register
            IMPORTING io_quality TYPE REF TO zif_quality,
         notify.


endinterface.
