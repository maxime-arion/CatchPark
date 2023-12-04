// app/javascript/controllers/geolocation_controller.js

import { Controller } from "@hotwired/stimulus";
import mapboxgl from 'mapbox-gl';

export default class extends Controller {
  static values = {
    apiKey: String
  };
  static targets = ["address"];

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;
    // Ne pas géolocaliser automatiquement pour laisser l'utilisateur choisir
  }

  // Action pour le bouton
  geolocateUser() {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(
        position => this.reverseGeocode(position.coords),
        error => console.error("Geolocation Error: ", error),
        { enableHighAccuracy: true }
      );
    } else {
      console.error("Geolocation is not supported by this browser.");
    }
  }

  reverseGeocode(coords) {
    const url = `https://api.mapbox.com/geocoding/v5/mapbox.places/${coords.longitude},${coords.latitude}.json?access_token=${mapboxgl.accessToken}`;

    fetch(url)
      .then(response => response.json())
      .then(data => {
        if (data.features.length > 0) {
          const place = data.features[0].place_name;
          this.addressTarget.value = place;
        } else {
          console.error("No address found for this location.");
        }
      })
      .catch(error => console.error("Reverse Geocoding Error: ", error));
  }
}
