import { Controller } from "stimulus"

export default class extends Controller {
	static targets = ["container", "card"]
  resort(e) {
  	let cards = this.cardTargets;
  	const selection = e.target.options[e.target.options.selectedIndex];
  	const direction = selection.dataset.sortDirection;
  	const svalue = selection.dataset.sortValue;
  	let sorted;
  	if (direction == "asc") {
  		sorted = cards.sort((a, b) => a.dataset[svalue].localeCompare(b.dataset[svalue]))
  	} else {
  		sorted = cards.sort((a, b) => b.dataset[svalue].localeCompare(a.dataset[svalue]))
  	}
  	sorted.forEach(card => this.containerTarget.appendChild(card));
  }
}