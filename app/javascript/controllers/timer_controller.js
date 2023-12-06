import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    this.updateTimer();
    setInterval(() => this.updateTimer(), 1000);
  }

  updateTimer() {
    const targetDate = new Date("2021-12-01T12:10:00");
    const currentDate = new Date();
    const difference = targetDate - currentDate;

    const seconds = Math.floor((difference / 1000) % 60);
    const minutes = Math.floor((difference / (1000 * 60)) % 60);
    const hours = Math.floor((difference / (1000 * 60 * 60)) % 24);
    const days = Math.floor(difference / (1000 * 60 * 60 * 24));

    this.element.innerHTML = `${days}j ${hours}h ${minutes}m ${seconds}s`;
  }
}
