@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Interface View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity YI_Mainak_Travel 
as select from ymainak_travel
association[1..*] to YI_Mainak_Booking as _Booking
on $projection.TravelUuid = _Booking.TravelUuid
{
    key travel_uuid as TravelUuid,
    travel_id as TravelId,
//    agency_id as AgencyId,
//    customer_id as CustomerId,
//    begin_date as BeginDate,
//    end_date as EndDate,
//    @Semantics.amount.currencyCode: 'CurrencyCode'
//    booking_fee as BookingFee,
//    @Semantics.amount.currencyCode: 'CurrencyCode'
//    total_price as TotalPrice,
//    currency_code as CurrencyCode,
//    description as Description,
//    overall_status as OverallStatus,
//    created_by as CreatedBy,
//    created_at as CreatedAt,
//    last_changed_by as LastChangedBy,
//    last_changed_at as LastChangedAt,
//    local_last_changed_at as LocalLastChangedAt,
    _Booking, //Expose Association
    _Booking[*:inner].BookingId //Ad-hoc Association or Path Expression
}
where travel_id = '00000050'
