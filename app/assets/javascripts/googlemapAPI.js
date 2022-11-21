// var addresses = #{raw @addresses.to_json};

function initMap(lat, lng, latList, lngList, addressList, clientList, batteryList, columnList, techName) {
    var myCoords = new google.maps.LatLng(lat, lng);
    var mapOptions = {
    center: myCoords,
    zoom: 7
    };
    
    var map = new google.maps.Map(document.getElementById('map'), mapOptions);
    for (i = 0; i < 99; i++) {
        const marker = new google.maps.Marker({
            position: new google.maps.LatLng(latList[i], lngList[i]),
            map: map
        });
        const infoWindow = new google.maps.InfoWindow({
            content: 
            addressList[i] + '<br>' + 
            clientList[i] + '<br>' + 
            "There is " + batteryList[i] + " battery(ies) in this building" + '<br>' +
            "There is " + columnList[i] + " column(s) in this building" + '<br>' +
            "There is " + "x" + " elevator(s) in this building" + '<br>' +
            "Technical contact : " + techName[i] + '<br>'

        });
        marker.addListener("click", () => {
            infoWindow.open({
              anchor: marker,
              map,
            });
        });  
    };
};