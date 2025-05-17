@Metadata.ignorePropagatedAnnotations: true
define view entity YI_TestNullValues
  as

  select distinct from yma_stock
{
  key '1' as KeyField,
      'A' as FieldA,
      'B' as FieldB,
      'C' as FieldC
}

union all

select distinct from     yma_stock
  left outer to one join yma_stock as JOIN_TARGET on 1 = 2
{
  key '2'                    as KeyField,
      JOIN_TARGET.product_id as FieldA,
      case 1
      when 2 then ''
      end                    as FieldB,
      ''                     as FieldC
}

union all

select distinct from     yma_stock
  left outer to one join yma_stock as JOIN_TARGET on 1 = 2
{
  key '3'                    as KeyField,
      JOIN_TARGET.product_id as FieldA,
      ''                     as FieldB,
      ''                     as FieldC
}
