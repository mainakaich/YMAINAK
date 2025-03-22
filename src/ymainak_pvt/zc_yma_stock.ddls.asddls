@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@AccessControl.authorizationCheck: #CHECK
define root view entity ZC_YMA_STOCK
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_YMA_STOCK
{
  key Id,
  ProductId,
  Price,
  Stock,
  CreatedBy,
  CreatedAt,
  LastChangedBy,
  LastChangedAt
  
}
