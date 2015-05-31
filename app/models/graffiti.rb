class Graffiti < ActiveRecord::Base

  GRAFFITI_LOCATION_OPTIONS = ['Alley', 'Bench', 'Door', 'Dumpster', 'Express Way Job', 'Fence', 'Front', 'Garage', 'Garbage Cart', 'Hydrant', 'Mailbox',
  'Newspaper Box', 'Phone', 'Pole', 'Rear', 'Side', 'Sign', 'Traffic Control Box']

  GRAFFITI_SURFACE_OPTIONS = ['Aluminum Siding', 'Asphalt', 'Brick - Painted', 'Brick - Unpainted', 'Cement (Sidewalk, Alley, Wall, or Curb)', 'Glass', 'Limestone',
  'Marble/Granite','Metal - Painted', 'Metal - Unpainted', 'Other/Unknown Surface', 'Stucco', 'Tree', 'Vinyl Siding', 'Wood - Painted',
  'Wood - Unpainted']

  GRAFFITI_HEIGHT_OPTIONS = ['No', 'Over 6 ft']
end
