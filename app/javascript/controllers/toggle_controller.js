import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["nav"];

  toggle() {
    this.navTarget.classList.toggle('active');
  }
}
