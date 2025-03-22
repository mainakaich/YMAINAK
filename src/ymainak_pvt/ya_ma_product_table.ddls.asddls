@EndUserText.label: 'Products Selection'
define abstract entity YA_MA_PRODUCT_TABLE
{
  productUuId    : sysuuid_x16;
  isActiveEntity : abap_boolean;

  _root          : association to parent YA_MA_PRODUCT_ROOT;

}
