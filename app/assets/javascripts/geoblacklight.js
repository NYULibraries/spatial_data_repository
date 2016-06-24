//= require geoblacklight/geoblacklight
//= require geoblacklight/basemaps
//= require geoblacklight/controls
//= require geoblacklight/viewers
//= require geoblacklight/modules
//= require geoblacklight/downloaders
//= require leaflet-iiif
//= require esri-leaflet
//= require readmore.min
//= require Leaflet.fullscreen.js

GeoBlacklight.Controls.Fullscreen = function() {
    this.map.addControl(new L.Control.Fullscreen({
        position: 'topright'
    }));
};