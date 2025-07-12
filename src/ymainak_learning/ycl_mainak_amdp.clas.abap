CLASS ycl_mainak_amdp DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_amdp_marker_hdb .
    INTERFACES if_oo_adt_classrun .

    TYPES travels TYPE STANDARD TABLE OF ymainak_travel WITH EMPTY KEY.

    CLASS-METHODS get_travel_many_bookings
        FOR TABLE FUNCTION yi_travelmanybookingtf.

  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS get_travel_amdp AMDP OPTIONS CDS SESSION CLIENT DEPENDENT
      READ-ONLY
      EXPORTING VALUE(travels) TYPE travels.
ENDCLASS.



CLASS ycl_mainak_amdp IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    me->get_travel_amdp(
      IMPORTING
        travels = DATA(travels)
    ).
    out->write( travels ).
  ENDMETHOD.

  METHOD get_travel_amdp BY DATABASE PROCEDURE
                         FOR HDB
                         LANGUAGE SQLSCRIPT
                         USING ymainak_travel.

    travels = SELECT * from ymainak_travel;

  ENDMETHOD.

  METHOD get_travel_many_bookings BY DATABASE FUNCTION
                                  FOR HDB
                                  LANGUAGE SQLSCRIPT
                                  USING ymainak_travel
                                        ymainak_booking.
    --Get all the travel bookings which is equal or more than INPUT booking count
    RETURN
    select DISTINCT
           Travel.client as Client,
           Travel.travel_id as TravelID,
           Booking.booking_date as BookingDate,
           concat(
           concat( concat( SUBSTRING( Booking.booking_date, 7, 2 ), '/'),
                   concat( SUBSTRING( Booking.booking_date, 5, 2 ), '/'  ) ),
           substring( Booking.booking_date, 1, 4 ) )  as BookingDateUserFormat
      from ymainak_travel as Travel
      inner join ymainak_booking as Booking
      on Travel.travel_uuid = Booking.travel_uuid
     where Booking.travel_uuid in ( select travel_uuid
                              from ymainak_booking
                              group by travel_uuid
                              having count( travel_uuid ) >= :p_booking_count )
                              ORDER BY TravelID;
  ENDMETHOD.

ENDCLASS.
