class GraffitiValidator < SimpleDelegator
  include ActiveModel::Validations
  attr_accessor 'service_code', 'service_name', 'description',
  'address', 'lat', 'long', "attribute[WHEREIS1]",
  "attribute[WHATTYP2]", "attribute[OVER6FEE]"

  validates_presence_of 'service_code', 'service_name', 'description',
  'address', 'lat', 'long', 'attribute[WHEREIS1]',
  'attribute[WHATTYP2]', 'attribute[OVER6FEE]'



end
