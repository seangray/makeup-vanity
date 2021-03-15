import { Controller } from "stimulus"

export default class extends Controller {
	static targets = ["star", "input"]
  
  selectStar(e) {
    const stars = this.starTargets;
  	const v = e.target.dataset.starValue;
    stars.slice(0, v).forEach(star => star.innerHTML = "&starf;");
    this.inputTarget.value = v;
  }
}