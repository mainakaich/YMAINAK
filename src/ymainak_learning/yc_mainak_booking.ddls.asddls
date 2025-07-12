@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Interface View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity YC_MAINAK_BOOKING
  as select from YI_Mainak_Booking
  association [1..1] to YC_Mainak_Travel as _Travel on $projection.TravelUuid = _Travel.TravelUuid
{
  key YI_Mainak_Booking.BookingUuid,
      YI_Mainak_Booking.TravelUuid,
      YI_Mainak_Booking.BookingId,
      YI_Mainak_Booking.BookingDate,
      YI_Mainak_Booking.CustomerId,
      YI_Mainak_Booking.CarrierId,
      YI_Mainak_Booking.ConnectionId,
      YI_Mainak_Booking.FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      YI_Mainak_Booking.FlightPrice,
      YI_Mainak_Booking.CurrencyCode,
      YI_Mainak_Booking.CreatedBy,
      YI_Mainak_Booking.LastChangedBy,
      YI_Mainak_Booking.LocalLastChangedAt,
      /* Associations */
      _Travel
}
