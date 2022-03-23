// Import all the channels to be used by Action Cable
import "channels/customers_channel"
import "channels/admin_channel"

// Expose action cable
import * as ActionCable from '@rails/actioncable'
window.App || (window.App = {});
window.App.cable = ActionCable.createConsumer();

