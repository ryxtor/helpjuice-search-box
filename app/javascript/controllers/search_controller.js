import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["search"];
  debounce = null;

  perform() {
    // Clear the previous timeout.
    clearTimeout(this.debounce);

    // Debounce to prevent sending a request on every input.
    this.debounce = setTimeout(() => {
      this.searchTarget.requestSubmit();
    }, 300);
  }

  disconnect() {
    clearTimeout(this.debounce);
  }
}
