import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 'passengersList' ]
  connect() {
  }

  add() {
    this.passengersListTarget.innerHTML += 'peak time'
  }
}
