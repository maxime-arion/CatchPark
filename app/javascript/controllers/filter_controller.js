
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  apply(event) {
    const statusFilter = event.target.value;
    const mapElement = document.getElementById("map");
    const mapController = this.application.getControllerForElementAndIdentifier(mapElement, "map");
    mapController.filterMarkers(statusFilter);
  }
}
