# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_stat_grapher_session',
  :secret      => 'ea7896cc3ff82e84824448f2e402830628e9230a86598cd59ca91eca52b9360350114f98d1747d3ffeef870b958a47344c1e84a94f40d3948874aaa9c487598d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
