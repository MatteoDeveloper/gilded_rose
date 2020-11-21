

interface ZIF_GILDED_ROSE_ELEMENT
  public .


METHODS: update,
         read_quality
            RETURNING VALUE(rv_quality) TYPE i,
         read_sell_in
            RETURNING VALUE(rv_sell_in) TYPE i.

endinterface.
