var map;
var geocoder;

function codeLatLng(input) {
  geocoder.geocode({'latLng': input}, function(results) {
    console.log("You've marked: " + results[0].formatted_address);
    var address_part = results[0].address_components
    var lat = results[0].geometry.location.A
    var lng = results[0].geometry.location.F
    var request = $.ajax({
      url: "/" + $('.map-page').attr('data-category'),
      method: "post",
      data: {lat: lat,
            lng: lng,
            address: address_part[0].short_name + " " + address_part[1].short_name,
            zip: address_part[7].short_name
          }
    });
    request.done(function(response){
      window.location.replace("/" + $('.map-page').attr('data-category') +
        "/form");
    });
  });
}

function initialize() {
  geocoder = new google.maps.Geocoder();
  var mapCanvas = document.getElementById('map-canvas');
  var mapCanvas2 = document.getElementById('map-canvas-request-index');
  var mapOptions = {
    center: new google.maps.LatLng(41.889797, -87.637756),
    zoom: 18,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    tilt: 0
  }
  map = new google.maps.Map(mapCanvas,mapOptions);
  var map2 = new google.maps.Map(mapCanvas2,mapOptions);


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
  $(document).on('submit',$('#submit-button'),function(event){
    event.preventDefault();
    center = map.getCenter();
    codeLatLng(center);
  });

  // $('body').on('click', '.form-submit', function() {
  //   console.log("hello");
  //   console.log($(this))
  //    // var request = $.ajax({
  //    //  url: "/requests",
  //    //  method: "post",
  //    //  data: {lat: lat,
  //    //        lng: lng,
  //    //        address: address_part[0].short_name + " " + address_part[1].short_name,
  //    //        zip: address_part[7].short_name
  //    //      }
  // });
});
