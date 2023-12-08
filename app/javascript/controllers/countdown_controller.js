// countdown_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { endTime: Number }

  connect() {
    this.setCountdown();
  }

  setCountdown() {
    // debugger
    const endTime = this.endTimeValue * 1000; // Convertissez en millisecondes
    const now = new Date().getTime();
    const distance = endTime - now;

    console.log(distance);
    if (distance < 0) {
      // Si le temps est déjà écoulé
      this.element.textContent = "Stationnement terminé";
      return;
    }

    // Initialisation du compte à rebours
    this.countdown = setInterval(() => {
      const now = new Date().getTime();
      const distance = endTime - now;

      if (distance < 0) {
        clearInterval(this.countdown);
        this.element.textContent = "Stationnement terminé";
        return;
      }

      const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
      const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
      const seconds = Math.floor((distance % (1000 * 60)) / 1000);
      this.element.textContent = `${hours}h ${minutes}m ${seconds}s`;
    }, 1000);
  }

  setCountdown() {
    const endTime = this.endTimeValue * 1000; // Convertissez en millisecondes
    const now = new Date().getTime();
    const distance = endTime - now;

    if (distance < 0) {
      // Si le temps est déjà écoulé
      this.element.textContent = "Stationnement terminé";
      return;
    }

    // Initialisation du compte à rebours
    this.countdown = setInterval(() => {
      const now = new Date().getTime();
      const distance = endTime - now;

      if (distance < 0) {
        clearInterval(this.countdown);
        this.element.textContent = "Stationnement terminé";
        return;
      }

      const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
      const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
      const seconds = Math.floor((distance % (1000 * 60)) / 1000);
      this.element.textContent = `${hours}h ${minutes}m ${seconds}s`;
    }, 1000);
  }

  disconnect() {
    clearInterval(this.countdown);
  }
}
