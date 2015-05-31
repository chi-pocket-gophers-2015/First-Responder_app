Form data city gives us:

- pothole headers:["sid","id","position","created_at","created_meta","updated_at","updated_meta","meta","CREATION DATE","STATUS","COMPLETION DATE","SERVICE REQUEST NUMBER","TYPE OF SERVICE  REQUEST","CURRENT ACTIVITY","MOST RECENT ACTION","NUMBER OF POTHOLES FILLED ON BLOCK","STREET ADDRESS","ZIP","X COORDINATE","Y COORDINATE","Ward","Police District","Community Area","SSA","LATITUDE","LONGITUDE", "LOCATION"]

- graffiti headers: ["sid", "id", "position", "created_at", "created_meta", "updated_at", "updated_meta", "meta", "Creation Date", "Status", "Completion Date", "Service Request Number", "Type of Service Request", "What Type of Surface is the Graffiti on?", "Where is the Graffiti located?", "Street Address", "ZIP Code", "X Coordinate", "Y Coordinate", "Ward", "Police District", "Community Area", "SSA", "Latitude", "Longitude", "Location"]

- rodent_baiting headers: ["sid", "id", "position", "created_at", "created_meta", "updated_at", "updated_meta", "meta", "Creation Date", "Status", "Completion Date", "Service Request Number", "Type of Service Request", "Number of Premises Baited", "Number of Premises with Garbage", "Number of Premises with Rats", "Current Activity", "Most Recent Action", "Street Address", "ZIP Code", "X Coordinate", "Y Coordinate", "Ward", "Police District", "Community Area", "Latitude", "Longitude", "Location"]

- alley_light headers: ["sid", "id", "position", "created_at", "created_meta", "updated_at", "updated_meta", "meta", "Creation Date", "Status", "Completion Date", "Service Request Number", "Type of Service Request", "Street Address", "ZIP Code", "X Coordinate", "Y Coordinate", "Ward", "Police District", "Community Area", "Latitude", "Longitude", "Location"]

- street_light_single headers: ["sid", "id", "position", "created_at", "created_meta", "updated_at", "updated_meta", "meta", "Creation Date", "Status", "Completion Date", "Service Request Number", "Type of Service Request", "Street Address", "ZIP Code", "X Coordinate", "Y Coordinate", "Ward", "Police District", "Community Area", "Latitude", "Longitude", "Location"]

- street_light_all headers: ["sid", "id", "position", "created_at", "created_meta", "updated_at", "updated_meta", "meta", "Creation Date", "Status", "Completion Date", "Service Request Number", "Type of Service Request", "Street Address", "ZIP Code", "X Coordinate", "Y Coordinate", "Ward", "Police District", "Community Area", "Latitude", "Longitude", "Location"]

- traffic_light headers: ["sid", "id", "position", "created_at", "created_meta", "updated_at", "updated_meta", "meta", "week", "Average Days to Complete Traffic Light Out Requests", "Total Completed Requests", "Target Response Time (Days)"]

- tree_trim headers: ["sid", "id", "position", "created_at", "created_meta", "updated_at", "updated_meta", "meta", "Creation Date", "Status", "Completion Date", "Service Request Number", "Type of Service Request", "Location of Trees", "Street Address", "ZIP Code", "X Coordinate", "Y Coordinate", "Ward", "Police District", "Community Area", "Latitude", "Longitude", "Location"]

- tree_debris headers: ["sid", "id", "position", "created_at", "created_meta", "updated_at", "updated_meta", "meta", "Creation Date", "Status", "Completion Date", "Service Request Number", "Type of Service Request", "If Yes, where is the debris located?", "Current Activity", "Most Recent Action", "Street Address", "ZIP Code", "X Coordinate", "Y Coordinate", "Ward", "Police District", "Community Area", "Latitude", "Longitude", "Location"]

- abandoned_vehicle headers: ["sid", "id", "position", "created_at", "created_meta", "updated_at", "updated_meta", "meta", "Creation Date", "Status", "Completion Date", "Service Request Number", "Type of Service Request", "License Plate", "Vehicle Make/Model", "Vehicle Color", "Current Activity", "Most Recent Action", "How Many Days Has the Vehicle Been Reported as Parked?", "Street Address", "ZIP Code", "X Coordinate", "Y Coordinate", "Ward", "Police District", "Community Area", "SSA", "Latitude", "Longitude", "Location"]

Required to post on city website

- pothole - Location, Where is the pothole located? (Crosswalk, Curb Lane, Intersection, Traffic Lane)

- graffiti - Location, Where is it located? (Alley, Bench, Door, Dumpster, Express Way Job, Fence, Front, Garage, Garbage Cart, Hydrant, Mailbox, Newspaper Box, Phone, Pole, Rear, Side, Sign, Traffic Control Box), What type of Surface is the graffiti on?(Aluminum Siding, Asphalt, Brick - Painted, Brick - Unpainted, Cement (Sidewalk, Alley, Wall, Curb), Glass, Limestone, Marble/Granite, Metal - Painted, Metal - Unpainted, Other/Unknown Surface, Stucco, Tree, Vinyl Siding, Wood - Painted, Wood - Unpainted), Is the Graffiti located over 6 feet from the ground? (No, Over 6 ft)

- rodent baiting - Location, Do you want your backyard inspected? (Inspect Back Yard, No), Do you want your backyard baited? (Bait Back Yard, No)

- alley light - ?

- street light single - Location, Is the light completely out or does it go on and off?(Completely Out, On and Off)

- street light all -

- traffic light - CALL 311

- tree trim - Street Address, Tree trim type (clear roof, street lights, low branch, <text input here fwiw>)

- tree debris - Location, Is the debris to be picked-up larger than a city garbage cart? (Yes, No), Where is the debris located? (Alley, Parkway, Vacant Lot)

- abandoned vehicle - Location, vehicle color, vehicle license plate number, vehicle body style, how many days has the vehicle been parked?


  ----------------------------------------------------------------------------------------------------------------------------------------------
  websites:

  potholes view - https://data.cityofchicago.org/Service-Requests/311-Service-Requests-Pot-Holes-Reported/7as2-ds3y
potholes download csv - https://data.cityofchicago.org/api/views/7as2-ds3y/rows.csv?accessType=DOWNLOAD
potholes json - https://data.cityofchicago.org/api/views/7as2-ds3y/rows.json

graffiti view - https://data.cityofchicago.org/Service-Requests/311-Service-Requests-Graffiti-Removal/hec5-y4x5
graffiti DL CSV - https://data.cityofchicago.org/api/views/hec5-y4x5/rows.csv?accessType=DOWNLOAD
graffiti JSON - https://data.cityofchicago.org/api/views/hec5-y4x5/rows.json

rodent baiting view - https://data.cityofchicago.org/Service-Requests/311-Service-Requests-Rodent-Baiting/97t6-zrhs
rodent baiting DL CSV - https://data.cityofchicago.org/api/views/97t6-zrhs/rows.csv?accessType=DOWNLOAD
rodent baiting JSON - https://data.cityofchicago.org/api/views/97t6-zrhs/rows.json

lights -

- alley (1 or more) view - https://data.cityofchicago.org/Service-Requests/311-Service-Requests-Alley-Lights-Out/t28b-ys7j
- alley DL CSV - https://data.cityofchicago.org/api/views/t28b-ys7j/rows.csv?accessType=DOWNLOAD
- alley JSON - https://data.cityofchicago.org/api/views/t28b-ys7j/rows.json

- street (1 out) view - https://data.cityofchicago.org/Service-Requests/311-Service-Requests-Street-Lights-One-Out/3aav-uy2v
- street DL CSV - https://data.cityofchicago.org/api/views/3aav-uy2v/rows.csv?accessType=DOWNLOAD
- street JSON - https://data.cityofchicago.org/api/views/3aav-uy2v/rows.json

- street (all out) view - https://data.cityofchicago.org/Service-Requests/311-Service-Requests-Street-Lights-All-Out/zuxi-7xem
- street DL CSV - https://data.cityofchicago.org/api/views/zuxi-7xem/rows.csv?accessType=DOWNLOAD
- street JSON - https://data.cityofchicago.org/api/views/zuxi-7xem/rows.json

- traffic view - https://data.cityofchicago.org/Administration-Finance/Performance-Metrics-Transportation-Traffic-Lights-/vfmv-4fbs
- traffic DL CSV - https://data.cityofchicago.org/api/views/vfmv-4fbs/rows.csv?accessType=DOWNLOAD
- traffic JSON - https://data.cityofchicago.org/api/views/vfmv-4fbs/rows.json

trees -

- trims view - https://data.cityofchicago.org/Service-Requests/311-Service-Requests-Tree-Trims/uxic-zsuj
- trims DL CSV - https://data.cityofchicago.org/api/views/uxic-zsuj/rows.csv?accessType=DOWNLOAD
- trims JSON - https://data.cityofchicago.org/api/views/uxic-zsuj/rows.json

- debris view - https://data.cityofchicago.org/Service-Requests/311-Service-Requests-Tree-Debris/mab8-y9h3
- debris DL CSV - https://data.cityofchicago.org/api/views/mab8-y9h3/rows.csv?accessType=DOWNLOAD
- debris JSON - https://data.cityofchicago.org/api/views/mab8-y9h3/rows.json

abandoned vehicle view - https://data.cityofchicago.org/Service-Requests/311-Service-Requests-Abandoned-Vehicles/3c9v-pnva
abandoned vehicle DL CSV - https://data.cityofchicago.org/api/views/3c9v-pnva/rows.csv?accessType=DOWNLOAD
abandoned vehicle JSON - https://data.cityofchicago.org/api/views/3c9v-pnva/rows.json

===============================

Service Codes

"service_code": "4fd3bbf8e750846c53000069",
"service_name": "Tree Debris",
ISTHEAMO - larger than garbage car?
IFYES,WH - where located


"service_code": "4ffa9f2d6018277d400000c8",
"service_name": "Street Light Out",
ISTHELI2

"service_code": "4fd3b9bce750846c5300004a",
"service_name": "Rodent Baiting / Rat Complaint",
DOYOUWAN - backyard inspected
DOYOUWA1 - backyard baited?


"service_code": "4fd3b656e750846c53000004",
"service_name": "Pothole in Street",
WHEREIST

"service_code": "4fd3b167e750846744000005",
"service_name": "Graffiti Removal",
WHEREIS1 - where
WHATTYP2 - surface
OVER6FEE - over 6ft


"service_code": "4ffa4c69601827691b000018",
"service_name": "Abandoned Vehicle",
FQSKA1 - Make model
FQSKA3 - Color
FQSKA4 - License plate
FQSKA11 - body style
HOWMANYD - How many days
