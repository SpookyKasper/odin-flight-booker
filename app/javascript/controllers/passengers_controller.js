import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 'passengersList', 'newPassenger', 'fields']
  static values = { pass: Number }

  connect() {
  }

  add(event) {
    event.preventDefault()
    const template = this.newPassengerTarget
    const clone = template.content.cloneNode(true)
    this.updateClone(clone)
    this.passengersListTarget.appendChild(clone)
    this.passValue++
  }

  updateClone(clone) {
    const labels = clone.querySelectorAll('label')
    labels[0].setAttribute("for", `booking_passengers_attributes_${this.passValue}_name`)
    labels[1].setAttribute("for", `booking_passengers_attributes_${this.passValue}_email`)
    const inputs = clone.querySelectorAll('input')
    inputs[0].setAttribute("id", `booking_passengers_attributes_${this.passValue}_name`)
    inputs[1].setAttribute("id", `booking_passengers_attributes_${this.passValue}_email`)
    inputs[0].setAttribute("name", `booking[passengers_attributes][${this.passValue}][name]`)
    inputs[1].setAttribute("name", `booking[passengers_attributes][${this.passValue}][email]`)
  }

  remove(event) {
    event.preventDefault()
    const passengers = this.fieldsTargets
    if (passengers.length < 2) {
      this.alert()
    } else {
      this.removeLastPassenger(passengers)
    }
  }

  removeLastPassenger(passengers) {
    let lastFields = passengers.pop()
    this.passengersListTarget.removeChild(lastFields)
    this.passValue--
  }

  alert() {
    alert(`At lease one passenger per booking`)
  }
}
