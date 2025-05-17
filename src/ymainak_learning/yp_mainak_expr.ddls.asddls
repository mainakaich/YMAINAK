@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Expression Testing'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity YP_MAINAK_EXPR 
as select from YI_Mainak_Travel
{
    key TravelId,
    abap.char'sample' as sample1,
    cast('sample' as abap.char(10)) as sample2,
    left($projection.sample1, 5) as left1,
    right($projection.sample1, 2) as right1,
    rpad($projection.sample1, 9, 'xy') as rpad1,
    concat_with_space('Mr.', 'Mainak', 1) as FullName     
}
where TravelId = '00000050'

