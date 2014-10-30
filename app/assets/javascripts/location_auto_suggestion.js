function initialize(map_obj,input_obj) {
    var mapOptions = {
        center: new google.maps.LatLng(14.397275, 108.509329),
        zoom: 5
    };
    var map = new google.maps.Map(document.getElementById(map_obj),mapOptions);
    var input = (document.getElementById(input_obj));
    var autocomplete = new google.maps.places.Autocomplete(input,{componentRestrictions: { 'country': 'vn' }});
    var marker = new google.maps.Marker({
        map: map,
        position: new google.maps.LatLng(14.397275, 108.509329)
    });

    google.maps.event.addListener(autocomplete, 'place_changed', function() {
        marker.setVisible(false);
        var place = autocomplete.getPlace();
        if (!place.geometry) {
            return;
        }

        // If the place has a geometry, then present it on a map.
        if (place.geometry.viewport) {
            map.fitBounds(place.geometry.viewport);
            map.setZoom(10);
        } else {
            map.setCenter(place.geometry.location);
            map.setZoom(17);  // Why 17? Because it looks good.
        }
        marker.setIcon(/** @type {google.maps.Icon} */({
            url: place.icon,
            size: new google.maps.Size(71, 71),
            origin: new google.maps.Point(0, 0),
            anchor: new google.maps.Point(17, 34),
            scaledSize: new google.maps.Size(35, 35)
        }));
        marker.setPosition(place.geometry.location);
        marker.setVisible(true);
        google.maps.event.trigger(map, 'resize');
    });

    data_map = Array();
    data_map['map'] = map;
    data_map['autocomplete'] = autocomplete;
    return data_map;
}
//google.maps.event.addDomListener(window, 'load', initialize);

