import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
	static targets = ["modal"];

	hideModal() {
		this.element.parentElement.removeAttribute("src"); // it might be nice to also remove the modal SRC
		this.element.remove();
	}

	submitEnd(e) {
		if (e.detail.success) {
			this.hideModal();
		}
	}

	// hide modal when clicking ESC
	// action: "keyup@window->remote-modal#closeWithKeyboard"
	closeWithKeyboard(e) {
		if (e.code == "Escape") {
			this.hideModal();
		}
	}
}
