import { Controller } from "stimulus"

export default class extends Controller {
	static targets = ["card", "container"]
  initialize() {
  }
  
  filter(e) {
  	const fname = e.target.name;
  	const selection = e.target.options[e.target.options.selectedIndex];
  	const v = selection.value;
  	let cards = this.cardTargets;
  	if (v == "all") {
  		cards.forEach(c => c.classList.remove("hidden"))
  	} else {
  		cards.forEach(c => c.dataset[fname] == v ? c.classList.remove("hidden") : c.classList.add("hidden"))
  	}
  }
}