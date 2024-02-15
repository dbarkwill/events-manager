import consumer from "channels/consumer"

consumer.subscriptions.create("CustomersChannel", {
  connected() {
  },

  disconnected() {
  },

  received(data) {
    var dinnerdelta = document.getElementById("dinner_delta");
    dinnerdelta.textContent = data.dinner_delta;
    var checkedincount = document.getElementById("checked_in_count");
    checkedincount.textContent = data.checked_in_count;
    var attendeecount = document.getElementById("attendee_count");
    attendeecount.textContent = data.attendee_count;
    document.getElementById("search").value = "";
    document.getElementById("search").focus();
  }
});
