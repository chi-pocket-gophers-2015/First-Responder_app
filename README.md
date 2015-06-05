#User Stories
  *As a user, I want to make a report about 311 service
  *As a user, I want an easy way to assign a report to a location
  *As a user, I want to know the most frequently reported things
  *As a user, I want to help improv my city/community
  *As a user, I want my reports to go to the local government
  *As a user, I want to be able to see relevant reports from my community members
  *As a user, I want to be able to user this on a phone and desktop
  *As a user, I want to know which issues have been solved and which ones are open
  *As a user, I want the option to be able to report anonymously or be logged in
  *As a user, I want to be able to add a photo from my phone to the report
  *As a user, I want to see the report I created on the city's website
  *As a user, I want to be notified when my case is closed
  *As a user, I want to be able to contant local officials directly(phone number to hotline)

#Planning Meeting:

##Rules/Goals/Agreements
*Standup after each cohort stand-up
*present new code/tech to the group
*ask for help if stuck for 15 minutes
*pair on new tech
*Trello - keep up to date
*Commit at least every 30 minutes (and announce it)
*take care of yourself —— sleep!
*no questions asked if anyone leaves after 6pm
*vote on disagreements - get help if not solved
*don’t merge your own code - look at the code before merging
*Each feature has it’s own branch
*don’t change anyone’s code without asking
*when proposing ideas, everyone else has a chance to give input
*you can only talk when holding the token
*any new tech should be presented to the group

##Expectations
*new technologies
*ready/shippable product by Demo Day
*mobile-first
*looks slick
*UX/UI
*frequent feedback cycle (ask alums, students, instructors, etc.)
*“cross-pollination” (integrate ideas instead of relying on specialists)

##App Idea
*non-emergency app
*have map, mark things down on map
*have selection of things 
*click icon
*click location on map
*e.g. pothole, see smashed windshield, graffiti, fire hydrants
*question: what is minimum thing want on list, what is maximum thing before it becomes an emergency?
other examples: drug deals, evidence of crimes, suspicious activity, downed tree, street-light out, flooding, sewage/bad smells
*have an ‘other’ category….update with unforeseen things later
*Anyone can mark something down, responders will be city officials? Or will be more like community bulletin-board?
*search functionality
*list-view and map view?
*can toggle options on/off
*mobile first
*community would prefer to use mobile (only map, to report)
*authorities would prefer to use desktop (to view)
*threshold of how many reports?
*icon gets bigger?
*trending algorithm?
*User needs account  or no?
*what are our core features?
*when open app, see things to report?
*when open app, see things to view?

##What is our MVP? (be done by Sunday 5/31)
*mobile first
*make a report (by clicking w/ finger) and save to database
*geolocation
*plot what you saw on map
*see a map of your location, click or drag cursor to mark event

##Next Steps (full-features to do after MVP, be done by Friday 6/5)?
*logic to group events together??
*threshold to filter bad data
*see all community’s reports
*toggle views on/off
*user accounts?
*“other” category?
*admin can mark report as “closed"
*desktop version

##What are our Spikes (new tech)?
*mobile, hybrid mobile, angular ionic
*maps
*PostGIS…..get for free?
*CSS: Bootstrap/foundation

##What are our Stretch goals?
*email to alderman?
*auto-send to City of Chicago website
*“trending” functionality
*heat map/hotspots
*camera functionality

##Research to Do
*City of Chicago site (potholes)
*block-by-block (reports people are interested in)
*field-research?
*open-source map APIs
*Google maps

##Advice from Terrier-Tory group
*Don’t lock into Google Maps right away
*used PostGIS (extension to PostGres)….allows you to do lat/long points in your queries (data is indexed  geographically)
*if decide to use PostGIS, best to implement right away (instead of when you’re well into project)
*too much specialization as individuals can lead to integration problems; better to be less efficient but work as team

