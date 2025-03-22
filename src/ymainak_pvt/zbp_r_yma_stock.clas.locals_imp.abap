CLASS lhc_zr_yma_stock DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR ZrYmaStock
        RESULT result,
      CalculateStockAmount FOR MODIFY
            IMPORTING keys FOR ACTION ZrYmaStock~CalculateStockAmount RESULT result.
*      CalculateStockAmount FOR READ
*        IMPORTING keys FOR FUNCTION ZrYmaStock~CalculateStockAmount RESULT result.
ENDCLASS.

CLASS lhc_zr_yma_stock IMPLEMENTATION.
  METHOD get_global_authorizations.
  ENDMETHOD.

*  METHOD CalculateStockAmount.
*    DATA amount TYPE i.
*    DATA lt_productuuid TYPE STANDARD TABLE OF ty_key.
*
*    "get product keys
*    LOOP AT keys INTO DATA(key).
*      LOOP AT key-%param-_product INTO DATA(product).
*        APPEND VALUE #( id = product-productUuId
*                        is_draft = SWITCH #( product-isActiveEntity
*                                              WHEN abap_true THEN if_abap_behv=>mk-off
*                                                             ELSE if_abap_behv=>mk-on ) ) TO lt_productuuid.
*      ENDLOOP.
*    ENDLOOP.
*
*    READ ENTITIES OF zr_yma_stock IN LOCAL MODE
*      ENTITY ZrYmaStock
*      FIELDS ( Price Stock )
*      WITH VALUE #( FOR data IN lt_productuuid (
*          %tky = VALUE #( id = data-id
*                          %is_draft = data-is_draft ) ) )
*      RESULT DATA(stock_t).
*
*    " calculate stock amount
*    LOOP AT stock_t INTO DATA(stock).
*      amount = amount + stock-Price * stock-Stock.
*    ENDLOOP.
*
*    " return result
*    result = VALUE #( FOR key1 IN keys (
*                       %cid = key1-%cid
*                       %param =  VALUE #( amount = amount )
*                     ) ).
*
*  ENDMETHOD.

  METHOD CalculateStockAmount.
    DATA amount TYPE i.
    DATA lt_productuuid TYPE STANDARD TABLE OF ty_key.

    "get product keys
    LOOP AT keys INTO DATA(key).
      LOOP AT key-%param-_product INTO DATA(product).
        APPEND VALUE #( id = product-productUuId
                        is_draft = SWITCH #( product-isActiveEntity
                                              WHEN abap_true THEN if_abap_behv=>mk-off
                                                             ELSE if_abap_behv=>mk-on ) ) TO lt_productuuid.
      ENDLOOP.
    ENDLOOP.

    READ ENTITIES OF zr_yma_stock IN LOCAL MODE
      ENTITY ZrYmaStock
      FIELDS ( Price Stock )
      WITH VALUE #( FOR data IN lt_productuuid (
          %tky = VALUE #( id = data-id
                          %is_draft = data-is_draft ) ) )
      RESULT DATA(stock_t).

    " calculate stock amount
    LOOP AT stock_t INTO DATA(stock).
      amount = amount + stock-Price * stock-Stock.
    ENDLOOP.

    " return result
    result = VALUE #( FOR key1 IN keys (
                       %cid = key1-%cid
                       %param =  VALUE #( amount = amount )
                     ) ).
  ENDMETHOD.

ENDCLASS.
