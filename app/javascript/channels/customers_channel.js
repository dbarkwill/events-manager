import consumer from "channels/consumer"

consumer.subscriptions.create("CustomersChannel", {
  connected() {
    console.log("Connected to the channel:", this);
    this.send({ message: 'Client is live' });
  },

  disconnected() {
    console.log("Disconnected")
  },

  received(data) {
  //  $('#dinner_delta').replaceWith data.dinner_delta;
  //  $('#checked_in_count').replaceWith data.checked_in_count;
    var dinnerdelta = document.getElementById("dinner_delta");
    dinnerdelta.textContent = data.dinner_delta;
    var checkedincount = document.getElementById("checked_in_count");
    checkedincount.textContent = data.checked_in_count;
    console.log("Received some data:", data);
  }
});
