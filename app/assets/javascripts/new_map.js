    function initialize() {
    var myLatlng = new google.maps.LatLng(<%= @request.latitude %>,<%= @request.longitude %>);
    var mapCanvas = document.getElementById('request-show-map');
    var differentMapOptions = {
    center: myLatlng,
    zoom: 18,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    tilt: 0
    }
    map = new google.maps.Map(mapCanvas, differentMapOptions);
    var marker = new google.maps.Marker({
      position: myLatlng,
      map: map,
      title: 'Hello World!'
    });
  }
  $(document).ready(function(){
    if(document.getElementById("request-show-map") != null) {
      initialize();
    }
  })