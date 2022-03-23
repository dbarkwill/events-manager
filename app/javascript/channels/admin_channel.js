import consumer from "channels/consumer"

consumer.subscriptions.create("AdminChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    var stat_rsvp = document.getElementById("stat_rsvp");
    var stat_checked_in = document.getElementById("stat_checked_in");
    var stat_walk_ins = document.getElementById("stat_walk_ins");
    var stat_percentage = document.getElementById("stat_percentage");
    stat_rsvp.textContent = data.stat_rsvp;
    stat_checked_in.textContent = data.stat_checked_in;
    stat_walk_ins.textContent = data.stat_walk_ins;
    stat_percentage.textContent = data.stat_percentage+"%";
    var recent_table = document.getElementById("recent_table");
    var rc_row = recent_table.insertRow(1);
    var rc_customer_number = rc_row.insertCell(0);
    var rc_name = rc_row.insertCell(1);
    var rc_address = rc_row.insertCell(2);
    var rc_dinner_count = rc_row.insertCell(3);
    var rc_walkin = rc_row.insertCell(4);
    rc_customer_number.innerHTML = data.rc_cn;
    rc_name.innerHTML = data.rc_name;
    rc_address.innerHTML = data.rc_add;
    rc_dinner_count.innerHTML = data.rc_dc;
    rc_walkin.innerHTML = data.rc_walkin;   
  }
});