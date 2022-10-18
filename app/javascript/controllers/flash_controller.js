import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
	connect() {
		setTimeout(() => {
			this.element.remove();
		}, 9000);
	}
	dismiss() {
		this.element.remove();
	}
}
