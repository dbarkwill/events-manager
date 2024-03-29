# RailsSettings Model
class Setting < RailsSettings::Base
  cache_prefix { "v1" }

  field :first_launch, type: :boolean, default: true
  field :purchased_meal_count, type: :integer, default: 0
  field :instance_name, type: :string, default: "primary"
  field :event_name, type: :string, default: "Event"
  field :delete_enabled, type: :boolean, default: false

  # Define your fields
  # field :host, type: :string, default: "http://localhost:3000"
  # field :default_locale, default: "en", type: :string
  # field :confirmable_enable, default: "0", type: :boolean
  # field :admin_emails, default: "admin@rubyonrails.org", type: :array
  # field :omniauth_google_client_id, default: (ENV["OMNIAUTH_GOOGLE_CLIENT_ID"] || ""), type: :string, readonly: true
  # field :omniauth_google_client_secret, default: (ENV["OMNIAUTH_GOOGLE_CLIENT_SECRET"] || ""), type: :string, readonly: true
end