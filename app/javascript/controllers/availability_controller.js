import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="availability"
export default class extends Controller {
  connect() {
    console.log("connected availability controller")
    this.anyevent
  }

  anyevent(event) {
    let availabilityArr = `Monday;${document.getElementById("days_monday").checked};${document.getElementById("monday_available_time_from").value};${document.getElementById("monday_available_time_to").value};Tuesday;${document.getElementById("days_tuesday").checked};${document.getElementById("tuesday_available_time_from").value};${document.getElementById("tuesday_available_time_to").value};Wednesday;${document.getElementById("days_wednesday").checked};${document.getElementById("wednesday_available_time_from").value};${document.getElementById("wednesday_available_time_to").value};Thursday;${document.getElementById("days_thursday").checked};${document.getElementById("thursday_available_time_from").value};${document.getElementById("thursday_available_time_to").value};Friday;${document.getElementById("days_friday").checked};${document.getElementById("friday_available_time_from").value};${document.getElementById("friday_available_time_to").value};Saturday;${document.getElementById("days_saturday").checked};${document.getElementById("saturday_available_time_from").value};${document.getElementById("saturday_available_time_to").value};Sunday;${document.getElementById("days_sunday").checked};${document.getElementById("sunday_available_time_from").value};${document.getElementById("sunday_available_time_to").value};`
    document.getElementById("availability").value = availabilityArr.toString();
  }
}
