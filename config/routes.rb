Rails.application.routes.draw do
  mount MissionControl::Jobs::Engine, at: "/jobs"

  get "up" => "rails/health#show", as: :rails_health_check

  root to: "web_apps#index"
  get "rails-web-apps", to: redirect { |params, request|
    if request.query_string.present?
      "/?#{request.query_string}"
    else
      "/"
    end
  }

  # Redirects for old ruby-on-rails-websites paths
  get "ruby-on-rails-websites", to: redirect("/rails-web-apps/technologies"), status: 301
  get "ruby-on-rails-websites/:id", to: redirect("/rails-web-apps/%{id}"), status: 301

  # Redirects for old tech stack paths (index and show)
  get "ruby-on-rails-websites/by-database", to: redirect("/rails-web-apps/by-database"), status: 301
  get "ruby-on-rails-websites/by-database/:id", to: redirect("/rails-web-apps/by-database/%{id}"), status: 301

  get "ruby-on-rails-websites/by-asset-pipeline", to: redirect("/rails-web-apps/by-asset-pipeline"), status: 301
  get "ruby-on-rails-websites/by-asset-pipeline/:id", to: redirect("/rails-web-apps/by-asset-pipeline/%{id}"), status: 301

  get "ruby-on-rails-websites/by-background-job-library", to: redirect("/rails-web-apps/by-background-job-library"), status: 301
  get "ruby-on-rails-websites/by-background-job-library/:id", to: redirect("/rails-web-apps/by-background-job-library/%{id}"), status: 301

  get "ruby-on-rails-websites/by-cache-store-implementation", to: redirect("/rails-web-apps/by-cache-store-implementation"), status: 301
  get "ruby-on-rails-websites/by-cache-store-implementation/:id", to: redirect("/rails-web-apps/by-cache-store-implementation/%{id}"), status: 301

  get "ruby-on-rails-websites/by-css-framework", to: redirect("/rails-web-apps/by-css-framework"), status: 301
  get "ruby-on-rails-websites/by-css-framework/:id", to: redirect("/rails-web-apps/by-css-framework/%{id}"), status: 301

  get "ruby-on-rails-websites/by-css-preprocessor", to: redirect("/rails-web-apps/by-css-preprocessor"), status: 301
  get "ruby-on-rails-websites/by-css-preprocessor/:id", to: redirect("/rails-web-apps/by-css-preprocessor/%{id}"), status: 301

  get "ruby-on-rails-websites/by-deployment-tool", to: redirect("/rails-web-apps/by-deployment-tool"), status: 301
  get "ruby-on-rails-websites/by-deployment-tool/:id", to: redirect("/rails-web-apps/by-deployment-tool/%{id}"), status: 301

  get "ruby-on-rails-websites/by-frontend-framework", to: redirect("/rails-web-apps/by-frontend-framework"), status: 301
  get "ruby-on-rails-websites/by-frontend-framework/:id", to: redirect("/rails-web-apps/by-frontend-framework/%{id}"), status: 301

  get "ruby-on-rails-websites/by-javascript-bundler", to: redirect("/rails-web-apps/by-javascript-bundler"), status: 301
  get "ruby-on-rails-websites/by-javascript-bundler/:id", to: redirect("/rails-web-apps/by-javascript-bundler/%{id}"), status: 301

  get "ruby-on-rails-websites/by-javascript-transpiler", to: redirect("/rails-web-apps/by-javascript-transpiler"), status: 301
  get "ruby-on-rails-websites/by-javascript-transpiler/:id", to: redirect("/rails-web-apps/by-javascript-transpiler/%{id}"), status: 301

  get "ruby-on-rails-websites/by-realtime-framework", to: redirect("/rails-web-apps/by-realtime-framework"), status: 301
  get "ruby-on-rails-websites/by-realtime-framework/:id", to: redirect("/rails-web-apps/by-realtime-framework/%{id}"), status: 301

  get "ruby-on-rails-websites/by-ruby-implementation", to: redirect("/rails-web-apps/by-ruby-implementation"), status: 301
  get "ruby-on-rails-websites/by-ruby-implementation/:id", to: redirect("/rails-web-apps/by-ruby-implementation/%{id}"), status: 301

  get "ruby-on-rails-websites/by-template-engine", to: redirect("/rails-web-apps/by-template-engine"), status: 301
  get "ruby-on-rails-websites/by-template-engine/:id", to: redirect("/rails-web-apps/by-template-engine/%{id}"), status: 301

  get "ruby-on-rails-websites/by-testing-tool", to: redirect("/rails-web-apps/by-testing-tool"), status: 301
  get "ruby-on-rails-websites/by-testing-tool/:id", to: redirect("/rails-web-apps/by-testing-tool/%{id}"), status: 301

  # New routes for tech stacks under /rails-web-apps
  scope path: "rails-web-apps" do
    get "technologies", to: "ruby_on_rails_websites#index", as: :technologies

    resources :database_tech_stacks, only: %i[index show], path: "by-database", controller: "ruby_on_rails_websites/database_tech_stacks"
    resources :asset_pipeline_tech_stacks, only: %i[index show], path: "by-asset-pipeline", controller: "ruby_on_rails_websites/asset_pipeline_tech_stacks"
    resources :background_job_library_tech_stacks, only: %i[index show], path: "by-background-job-library", controller: "ruby_on_rails_websites/background_job_library_tech_stacks"
    resources :cache_store_implementation_tech_stacks, only: %i[index show], path: "by-cache-store-implementation", controller: "ruby_on_rails_websites/cache_store_implementation_tech_stacks"
    resources :css_framework_tech_stacks, only: %i[index show], path: "by-css-framework", controller: "ruby_on_rails_websites/css_framework_tech_stacks"
    resources :css_processor_tech_stacks, only: %i[index show], path: "by-css-preprocessor", controller: "ruby_on_rails_websites/css_processor_tech_stacks"
    resources :deployment_tool_tech_stacks, only: %i[index show], path: "by-deployment-tool", controller: "ruby_on_rails_websites/deployment_tool_tech_stacks"
    resources :frontend_framework_tech_stacks, only: %i[index show], path: "by-frontend-framework", controller: "ruby_on_rails_websites/frontend_framework_tech_stacks"
    resources :js_bundler_tech_stacks, only: %i[index show], path: "by-javascript-bundler", controller: "ruby_on_rails_websites/js_bundler_tech_stacks"
    resources :js_transpiler_tech_stacks, only: %i[index show], path: "by-javascript-transpiler", controller: "ruby_on_rails_websites/js_transpiler_tech_stacks"
    resources :realtime_framework_tech_stacks, only: %i[index show], path: "by-realtime-framework", controller: "ruby_on_rails_websites/realtime_framework_tech_stacks"
    resources :ruby_implementation_tech_stacks, only: %i[index show], path: "by-ruby-implementation", controller: "ruby_on_rails_websites/ruby_implementation_tech_stacks"
    resources :template_engine_tech_stacks, only: %i[index show], path: "by-template-engine", controller: "ruby_on_rails_websites/template_engine_tech_stacks"
    resources :testing_tool_tech_stacks, only: %i[index show], path: "by-testing-tool", controller: "ruby_on_rails_websites/testing_tool_tech_stacks"
  end

  # Web apps show route with constraints to avoid conflicting with tech stack paths
  reserved_slugs = %w[
    technologies
    by-database
    by-asset-pipeline
    by-background-job-library
    by-cache-store-implementation
    by-css-framework
    by-css-preprocessor
    by-deployment-tool
    by-frontend-framework
    by-javascript-bundler
    by-javascript-transpiler
    by-realtime-framework
    by-ruby-implementation
    by-template-engine
    by-testing-tool
  ]
  resources :web_apps, only: %i[show], path: "rails-web-apps", constraints: { id: Regexp.new("(?!#{reserved_slugs.join('|')})[^/]+") }

  resource :profile, only: %i[show edit update] do
    resource :password, only: [ :update ], controller: "password_changes"
  end

  resource :search, only: %i[show]

  resources :categories, only: %i[index]
  get ":slug-websites-built-with-ruby-on-rails",
      to: "categories#show",
      as: :category,
      constraints: { slug: /[\w-]+/ }

  resources :upvotes, only: %i[index create destroy]

  get "terms", to: "pages#terms", as: :terms
  get "privacy", to: "pages#privacy", as: :privacy
  get "about", to: "pages#about", as: :about
  get "faq", to: "pages#faq", as: :faq
  get "contact", to: "pages#contact", as: :contact
  get "disclaimer", to: "pages#disclaimer", as: :disclaimer
  get "submit-your-rails-web-app", to: redirect("/session/new"), as: :pricing

  resource :session, only: %i[new create destroy]
  resources :passwords, param: :token

  get "sign_in/google", to: "google_sessions#create", as: :sign_in_google
  resource :registration, only: %i[new create]

  resources :sites, only: %i[index new create]
end
