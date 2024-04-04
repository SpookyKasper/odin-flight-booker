import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 'passengersList', 'newPassenger']
  static values = { pass: Number }

  connect() {
    console.log(this.passValue)
  }

  add(event) {
    event.preventDefault()
    const template = this.newPassengerTarget
    const clone = template.content.cloneNode(true)
    console.log(this.passValue)
    this.updateClone(clone)
    console.log(this.passengersListTarget)
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
    const element = this.passengersListTarget
    const passengers = element.querySelectorAll('.passenger-fields')
    console.log(passengers)
    console.log
    const lastPassenger = this.passengersListTargets.pop()
    this.passengersListTarget.removeChild(lastPassenger)
  }
}
