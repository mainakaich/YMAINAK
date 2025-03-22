@EndUserText.label: 'Products Selection'
define root abstract entity YA_MA_PRODUCT_ROOT
{
  dummy    : abap.char(1);
  _product : composition [0..*] of YA_MA_PRODUCT_TABLE;

}
