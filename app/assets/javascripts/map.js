var map;
var geocoder;

function codeLatLng(input) {
  geocoder.geocode({'latLng': input}, function(results) {
    console.log("You've marked: " + results[0].formatted_address);
    var formatted = results[0].formatted_address
    var lat = results[0].geometry.location.A
    var lng = results[0].geometry.location.F
    $.ajax({
      url: "/requests/potholes",
      method: "post",
      data: {lat: lat,
            lng: lng,
            formatted: results[0].formatted_address}
    });
  });
  console.log("returned result: " + results[0].formatted_address);
}

function initialize() {
  geocoder = new google.maps.Geocoder();
  var mapCanvas = document.getElementById('map-canvas');
  var mapOptions = {
    center: new google.maps.LatLng(41.889797, -87.637756),
    zoom: 18,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    tilt: 0
  }
  map = new google.maps.Map(mapCanvas,mapOptions);

  // added the below for geolocation
   if(navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var pos = new google.maps.LatLng(position.coords.latitude,
                                       position.coords.longitude);

      var infowindow = new google.maps.InfoWindow({
        map: map,
        position: pos,
        content: 'Location found using HTML5.'
      });

      map.setCenter(pos);
    }, function() {
      handleNoGeolocation(true);
    });
  } else {
    // Browser doesn't support Geolocation
    handleNoGeolocation(false);
  }
  // added the above for geo-location

  $('<div/>').addClass('centerMarker').appendTo(map.getDiv());
}

function handleNoGeolocation(errorFlag) {
  if (errorFlag) {
    var content = 'Error: The Geolocation service failed.';
  } else {
    var content = 'Error: Your browser doesn\'t support geolocation.';
  }

  var options = {
    map: map,
    position: new google.maps.LatLng(41.889797, -87.637756),
    content: content
  };

  var infowindow = new google.maps.InfoWindow(options);
  map.setCenter(options.position);
}


$(document).ready(function(){
  initialize();
  $('#submit-button').submit(function(event){
    // debugger;
    event.preventDefault();
    center = map.getCenter();
    codeLatLng(center);
  });
});
