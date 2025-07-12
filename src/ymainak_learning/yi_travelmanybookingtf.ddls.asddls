@EndUserText.label: 'Travel with many bookings'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ClientHandling.type: #CLIENT_DEPENDENT
@ClientHandling.algorithm: #SESSION_VARIABLE
@ClientHandling.clientSafe: true
define table function YI_TravelManyBookingTF
  with parameters
    p_booking_count : abap.int1
returns
{
  Client      : abap.clnt;
  TravelID    : /dmo/travel_id;
  BookingDate : /dmo/booking_date;
  BookingDateUserFormat : abap.char( 10 );
}
implemented by method
  YCL_MAINAK_AMDP=>GET_TRAVEL_MANY_BOOKINGS;