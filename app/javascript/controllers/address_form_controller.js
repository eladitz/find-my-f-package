import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {

  connect() {
    console.log("connected ")

  }
  country(event) {
    console.log(event.target.value)
    fetch
  }
}
