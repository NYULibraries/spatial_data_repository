# Be sure to restart your server when you modify this file.

Rails.application.config.session_store :cookie_store, key: '_geoblacklight_session', domain: '.library.nyu.edu' unless Rails.env.test?
