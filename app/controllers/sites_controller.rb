class SitesController < ApplicationController
  include Pageable

  before_action :set_categories, only: %i[ new create ]
  before_action :set_databases, only: %i[ new create ]
  before_action :set_background_job_libraries, only: %i[ new create ]
  before_action :set_testing_tools, only: %i[ new create ]
  before_action :set_frontend_frameworks, only: %i[ new create ]
  before_action :set_js_bundlers, only: %i[ new create ]
  before_action :set_js_transpilers, only: %i[ new create ]
  before_action :set_css_frameworks, only: %i[ new create ]
  before_action :set_css_preprocessors, only: %i[ new create ]
  before_action :set_asset_pipelines, only: %i[ new create ]
  before_action :set_template_engines, only: %i[ new create ]
  before_action :set_cache_store_implementations, only: %i[ new create ]
  before_action :set_realtime_frameworks, only: %i[ new create ]
  before_action :set_deployment_tools, only: %i[ new create ]
  before_action :set_ruby_implementations, only: %i[ new create ]
  before_action :set_template_engines, only: %i[ new create ]

  def index
    @base_query = Site.order(created_at: :desc).where(user: Current.user)
    @results_count = @base_query.count
    set_pagination_params
    @sites = @base_query.offset((@current_page - 1) * @items_per_page).limit(@items_per_page)
  end

  def new
    @site = Site.new

    @selected_categories = []
    @selected_databases = []
    @selected_background_job_libraries = []
    @selected_testing_tools = []
    @selected_frontend_frameworks = []
    @selected_js_bundlers = []
    @selected_js_transpilers = []
    @selected_css_frameworks = []
    @selected_css_preprocessors = []
    @selected_asset_pipelines = []
    @selected_template_engines = []
    @selected_cache_store_implementations = []
    @selected_realtime_frameworks = []
    @selected_deployment_tools = []
    @selected_ruby_implementations = convert_to_select_options([
      RubyImplementation.find_by(name: "MRI Ruby (CRuby)")
    ])
    @selected_template_engines = []
  end

  def create
    @site = Site.new(site_params)

    @selected_categories = convert_to_select_options(@site.categories)
    @selected_databases = convert_to_select_options(@site.databases)
    @selected_background_job_libraries = convert_to_select_options(@site.background_job_libraries)
    @selected_testing_tools = convert_to_select_options(@site.testing_tools)
    @selected_frontend_frameworks = convert_to_select_options(@site.frontend_frameworks)
    @selected_js_bundlers = convert_to_select_options(@site.js_bundlers)
    @selected_js_transpilers = convert_to_select_options(@site.js_transpilers)
    @selected_css_frameworks = convert_to_select_options(@site.css_frameworks)
    @selected_css_preprocessors = convert_to_select_options(@site.css_processors)
    @selected_asset_pipelines = convert_to_select_options(@site.asset_pipelines)
    @selected_template_engines = convert_to_select_options(@site.template_engines)
    @selected_cache_store_implementations = convert_to_select_options(@site.cache_store_implementations)
    @selected_realtime_frameworks = convert_to_select_options(@site.realtime_frameworks)
    @selected_deployment_tools = convert_to_select_options(@site.deployment_tools)
    @selected_ruby_implementations = convert_to_select_options(@site.ruby_implementations)
    @selected_template_engines = convert_to_select_options(@site.template_engines)

    @site.user = Current.user

    if @site.save
      Current.user.upvotes.create!(site: @site)
      ServiceMessages::NewSiteJob.perform_later(@site)
      AutoApproveSiteJob.perform_later(@site)
      redirect_to sites_path, notice: "your site has been submitted for review."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_categories
    @categories = convert_to_select_options(Category.order(:name))
  end

  def set_databases
    @databases = convert_to_select_options(Database.order(:name))
  end

  def set_background_job_libraries
    @background_job_libraries = convert_to_select_options(BackgroundJobLibrary.order(:name))
  end

  def set_testing_tools
    @testing_tools = convert_to_select_options(TestingTool.order(:name))
  end

  def set_frontend_frameworks
    @frontend_frameworks = convert_to_select_options(FrontendFramework.order(:name))
  end

  def set_js_bundlers
    @js_bundlers = convert_to_select_options(JsBundler.order(:name))
  end

  def set_js_transpilers
    @js_transpilers = convert_to_select_options(JsTranspiler.order(:name))
  end

  def set_css_frameworks
    @css_frameworks = convert_to_select_options(CssFramework.order(:name))
  end

  def set_css_preprocessors
    @css_preprocessors = convert_to_select_options(CssProcessor.order(:name))
  end

  def set_asset_pipelines
    @asset_pipelines = convert_to_select_options(AssetPipeline.order(:name))
  end

  def set_template_engines
    @template_engines = convert_to_select_options(TemplateEngine.order(:name))
  end

  def set_cache_store_implementations
    @cache_store_implementations = convert_to_select_options(CacheStoreImplementation.order(:name))
  end

  def set_realtime_frameworks
    @realtime_frameworks = convert_to_select_options(RealtimeFramework.order(:name))
  end

  def set_deployment_tools
    @deployment_tools = convert_to_select_options(DeploymentTool.order(:name))
  end

  def set_ruby_implementations
    @ruby_implementations = convert_to_select_options(RubyImplementation.order(:name))
  end

  def set_template_engines
    @template_engines = convert_to_select_options(TemplateEngine.order(:name))
  end

  def convert_to_select_options(collection)
    collection.map do |item|
      { text: item.name, value: item.id }
    end
  end

  def site_params
    params.expect(site: [
      :title, :url, :description, :logo, :featured_image, :tagline,
      :open_source, :repo_url, :nsfw, :year_launched,
      category_ids: [], database_ids: [], background_job_library_ids: [],
      testing_tool_ids: [], frontend_framework_ids: [], js_bundler_ids: [],
      js_transpiler_ids: [], css_framework_ids: [], css_processor_ids: [],
      asset_pipeline_ids: [], template_engine_ids: [], cache_store_implementation_ids: [],
      realtime_framework_ids: [], deployment_tool_ids: [], ruby_implementation_ids: []
    ])
  end
end
