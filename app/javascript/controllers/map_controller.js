// app/javascript/controllers/map_controller.js

import { Controller } from "@hotwired/stimulus";
import mapboxgl from 'mapbox-gl';

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  markersOnMap = [];

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    });
    this.addMarkersToMap();
    this.fitMapToMarkers();
  }

  addMarkersToMap() {
    this.markersValue.forEach(markerData => {
      const marker = this.createMarker(markerData);
      this.markersOnMap.push(marker); // Stocker chaque marqueur
    });
  }

  createMarker(markerData) {
    let el = document.createElement('div');
    el.innerHTML = this.createSvgMarker(this.getColorBasedOnStatus(markerData.status));
    const marker = new mapboxgl.Marker(el)
      .setLngLat([markerData.lng, markerData.lat])
      .setPopup(new mapboxgl.Popup({ offset: 25 }).setHTML(markerData.infoWindow))
      .addTo(this.map);
    return marker;
  }

  fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds();
    this.markersOnMap.forEach(marker => bounds.extend(marker.getLngLat()));
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  }

  filterMarkers(statusFilter) {
    this.markersOnMap.forEach((marker, index) => {
      const markerElement = marker.getElement();
      const markerData = this.markersValue[index];
      if (statusFilter === 'Tous') {
        markerElement.style.display = 'block';
      } else if ((statusFilter === 'Disponible' && markerData.status) || (statusFilter === 'Occupé' && !markerData.status)) {
        markerElement.style.display = 'block';
      } else {
        markerElement.style.display = 'none';
      }
    });
  }


  getColorBasedOnStatus(status) {
    if (status === true) {
      return '#008000'; // Vert pour disponible
    } else if (status === false) {
      return '#FFA500'; // Orange pour non disponible
    } else {
      return 'grey'; // Gris pour indéfini
    }
  }

  createSvgMarker(fillColor) {
    return `<svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
              <path d="M12 2L15.5 8.5H8.5L12 2Z" fill="${fillColor}"/>
              <path d="M12 22L8.5 15.5H15.5L12 22Z" fill="${fillColor}"/>
              <path d="M2 12L8.5 8.5V15.5L2 12Z" fill="${fillColor}"/>
              <path d="M22 12L15.5 15.5V8.5L22 12Z" fill="${fillColor}"/>
            </svg>`;
  }
}
