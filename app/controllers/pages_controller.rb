class PagesController < ApplicationController
  allow_unauthenticated_access

  # <rails-lens:routes:begin>
  # ROUTE: /terms, name: terms, via: GET
  # <rails-lens:routes:end>
  def terms
  end

  # <rails-lens:routes:begin>
  # ROUTE: /privacy, name: privacy, via: GET
  # <rails-lens:routes:end>
  def privacy
  end

  # <rails-lens:routes:begin>
  # ROUTE: /about, name: about, via: GET
  # <rails-lens:routes:end>
  def about
  end

  # <rails-lens:routes:begin>
  # ROUTE: /faq, name: faq, via: GET
  # <rails-lens:routes:end>
  def faq
  end

  # <rails-lens:routes:begin>
  # ROUTE: /contact, name: contact, via: GET
  # <rails-lens:routes:end>
  def contact
  end

  # <rails-lens:routes:begin>
  # ROUTE: /disclaimer, name: disclaimer, via: GET
  # <rails-lens:routes:end>
  def disclaimer
  end
end
