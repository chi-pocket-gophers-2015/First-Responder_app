  function initializeShow() {
    var myLatlng = new google.maps.LatLng(41.8897107,-87.63695229999996);
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
      initializeShow();
    }
  })