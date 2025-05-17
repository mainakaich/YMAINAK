@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS view entity, expression reuse'

define view entity YDEMO_CDS_EXPRESSION_REUSE
  as select from ydemo_expression
{

      //field
  key id                                     as field1,
      concat($projection.field1, 'x')        as field_reuse,

      //literal
      abap.char'hallo'                       as lit1,
      concat($projection.lit1, 'x')          as lit_reuse,

      //arithmetic expression
      abap.decfloat34'123.45E6'              as arith,
      $projection.arith * 2                  as arith_reuse,

      //cast expression
      cast(char1 as abap.numc(10))           as cast1,
      coalesce($projection.cast1, numc2)     as cast_reuse,

      //built-in function
      abs(dec1)                              as builtIn,
      cast($projection.builtIn as abap.int4) as builtIn_reuse,

      //case distinction
      case char2
          when 'Anna' then 'X'
          when 'Lisa' then 'Y'
          else '-'
          end                                as case1,
      left($projection.case1, 1)             as case_reuse
}
