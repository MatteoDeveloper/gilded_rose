interface ZIF_QUALITY
  public .
  CONSTANTS mc_one TYPE i VALUE 1.

METHODS: read
            RETURNING VALUE(rv_quality) TYPE i,
         reset,
         update.



endinterface.
