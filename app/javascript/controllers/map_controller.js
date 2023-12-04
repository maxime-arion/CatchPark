import { Controller } from "@hotwired/stimulus";
import mapboxgl from 'mapbox-gl';

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  markersOnMap = [];
  userLocationMarker = null;

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    });

    this.addMarkersToMap();
    this.fitMapToMarkers();
    this.initializeGeolocation();
    this.addZoomControls();

  }
  addZoomControls() {
    const nav = new mapboxgl.NavigationControl();
    this.map.addControl(nav, 'bottom-right');
  }

  addMarkersToMap() {
    this.markersValue.forEach(markerData => {
      const marker = this.createMarker(markerData);
      this.markersOnMap.push(marker);
    });
  }

  createMarker(markerData) {
    let el = document.createElement('div');
    el.innerHTML = this.createSvgMarker(this.getColorBasedOnStatus(markerData.status));
    const marker = new mapboxgl.Marker(el)
      .setLngLat([markerData.lng, markerData.lat])
      .setPopup(new mapboxgl.Popup({ offset: 15 }).setHTML(markerData.infoWindow))
      .addTo(this.map);
    return marker;
  }

  fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds();
    this.markersOnMap.forEach(marker => bounds.extend(marker.getLngLat()));
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  }

  getColorBasedOnStatus(status) {
    if (status === true) {
      return '#008000'; // Vert pour disponible
    } else if (status === false) {
      return '#FFA500'; // Orange pour non disponible
    } else {
      return 'grey';
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

  initializeGeolocation() {
    const geolocateControl = new mapboxgl.GeolocateControl({
      positionOptions: {
        enableHighAccuracy: true
      },
      trackUserLocation: true,
      showUserLocation: true
    });

    const geolocateContainer = document.getElementById('geolocate-container');
    geolocateContainer.appendChild(geolocateControl.onAdd(this.map));

    this.map.on('load', () => {
      geolocateControl.trigger();
    });

    geolocateControl.on('geolocate', (e) => {
      this.updateLocationFields(e.coords.latitude, e.coords.longitude);
      this.updateUserLocationMarker(e.coords.latitude, e.coords.longitude);
    });
  }

  updateLocationFields(latitude, longitude) {
    const latitudeField = document.getElementById('latitude');
    const longitudeField = document.getElementById('longitude');

    if (latitudeField && longitudeField) {
      latitudeField.value = latitude;
      longitudeField.value = longitude;
    }
  }

  updateUserLocationMarker(latitude, longitude) {
    if (!this.userLocationMarker) {
      this.userLocationMarker = new mapboxgl.Marker({ color: 'red' })
        .setLngLat([longitude, latitude])
        .addTo(this.map);
    } else {
      this.userLocationMarker.setLngLat([longitude, latitude]);
    }

    this.map.flyTo({ center: [longitude, latitude], zoom: 15 });
  }
}
