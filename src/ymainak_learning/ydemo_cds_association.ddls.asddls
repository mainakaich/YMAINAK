@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Mainak - Association Test'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity YDemo_CDS_Association
  as select from /DMO/I_Connection_R

{
  key AirlineID,
  key ConnectionID,
  _Airline._Currency._Text[1: Language = $session.system_language ].CurrencyName

      //_Airline._Currency._Text.CurrencyName

      //_Airline._Currency._Text[ Language = 'E' ].CurrencyName

      //_Airline._Currency._Text[ 1: language = 'E' ].CurrencyName
}
where
      AirlineID    = 'AA'
  and ConnectionID = '0017'
