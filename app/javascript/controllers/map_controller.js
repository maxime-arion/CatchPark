import { Controller } from "@hotwired/stimulus";
import mapboxgl from 'mapbox-gl';

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;
    this.map = new mapboxgl.Map({

      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    });
    console.log('Structure des marqueurs:', JSON.stringify(this.markersValue, null, 2));
    this.addMarkersToMap();
    this.fitMapToMarkers();
  }

  addMarkersToMap() {
    this.markersValue.forEach(marker => {
      console.log('Création marqueur pour:', marker);
      let el = document.createElement('div');
      let fillColor = getColorBasedOnStatus(marker.status);
      console.log(`Status: ${marker.status}, Fill color: ${fillColor}`);
      el.innerHTML = this.createSvgMarker(fillColor);
      new mapboxgl.Marker(el)
        .setLngLat([marker.lng, marker.lat])
        .setPopup(new mapboxgl.Popup({ offset: 25 }).setHTML(marker.infoWindow))
        .addTo(this.map);
    });
  }

  createSvgMarker(fillColor) {
    // SVG with dynamic fill color
    return `<svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
              <path d="M12 2L15.5 8.5H8.5L12 2Z" fill="${fillColor}"/>
              <path d="M12 22L8.5 15.5H15.5L12 22Z" fill="${fillColor}"/>
              <path d="M2 12L8.5 8.5V15.5L2 12Z" fill="${fillColor}"/>
              <path d="M22 12L15.5 15.5V8.5L22 12Z" fill="${fillColor}"/>
            </svg>`;
  }

  fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds();
    this.markersValue.forEach(marker => bounds.extend([marker.lng, marker.lat]));
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  }
}

function getColorBasedOnStatus(status) {
  if (status === true) {
    return '#008000';
  } else if (status === false) {
    return '#FFA500';
  } else {
    console.error('Invalid or undefined status value:', status);
    return 'grey';
  }
}
