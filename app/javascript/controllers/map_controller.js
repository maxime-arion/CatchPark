import { Controller } from "@hotwired/stimulus";
import mapboxgl from 'mapbox-gl';

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  markersOnMap = [];
  // userLocationMarker = null; //j'ai Commenté pour désactiver le marqueur personnalisé, décommenter pour remmettre marker rouge type google sur géoloc

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
      return '#7aa98d'; // Vert pour disponible
    } else if (status === false) {
      return '#f4405a'; // Rouge pour non disponible
    } else {
      return 'grey';
    }
  }

  // createSvgMarker(fillColor) {
  //   return `<svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
  //             <path d="M12 2L15.5 8.5H8.5L12 2Z" fill="${fillColor}"/>
  //             <path d="M12 22L8.5 15.5H15.5L12 22Z" fill="${fillColor}"/>
  //             <path d="M2 12L8.5 8.5V15.5L2 12Z" fill="${fillColor}"/>
  //             <path d="M22 12L15.5 15.5V8.5L22 12Z" fill="${fillColor}"/>
  //           </svg>`;
  // }

  createSvgMarker(fillColor) {
    return `<svg fill="${fillColor}" width="24px" height="24px" viewBox="-3 0 24 24" xmlns="http://www.w3.org/2000/svg">
              <path d="m8.075 23.52c-6.811-9.878-8.075-10.891-8.075-14.52 0-4.971 4.029-9 9-9s9 4.029 9 9c0 3.629-1.264 4.64-8.075 14.516-.206.294-.543.484-.925.484s-.719-.19-.922-.48l-.002-.004zm.925-10.77c2.07 0 3.749-1.679 3.749-3.75s-1.679-3.75-3.75-3.75-3.75 1.679-3.75 3.75c0 2.071 1.679 3.75 3.75 3.75z"/>
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
    // Méthode commentée pour désactiver le marqueur personnalisé, décommenter pour remmettre marker rouge type google sur géoloc

    // if (!this.userLocationMarker) {
    //   this.userLocationMarker = new mapboxgl.Marker({ color: 'red' })
    //     .setLngLat([longitude, latitude])
    //     .addTo(this.map);
    // } else {
    //   this.userLocationMarker.setLngLat([longitude, latitude]);
    // }

    // this.map.flyTo({
    //   center: [longitude, latitude],
    //   zoom: this.map.current.getZoom()
    // });
  }
}
