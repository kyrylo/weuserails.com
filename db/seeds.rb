# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

[
  "1.0",
  "1.2",
  "2.0",
  "2.1",
  "2.2",
  "2.3",
  "3.0",
  "3.1",
  "3.2",
  "4.0",
  "4.1",
  "4.2",
  "5.0",
  "5.1",
  "5.2",
  "6.0",
  "6.1",
  "7.0",
  "7.1",
  "7.2",
  "8.0",
  "Latest"
].each do |rails_version|
  RailsVersion.find_or_create_by!(version: rails_version)
end

[
  "Archiving Service", "Call Center", "Collection Agency", "College Recruiting", "Courier Service", "Debt Collections", "Delivery", "Document Preparation", "Employee Benefits", "Extermination Service", "Facilities Support Services", "Housekeeping Service", "Human Resources", "Knowledge Management", "Office Administration", "Packaging Services", "Physical Security", "Project Management", "Staffing Agency", "Trade Shows", "Virtual Workforce", "Ad Exchange", "Ad Network", "Ad Retargeting", "Ad Server", "Ad Targeting", "Advertising", "Advertising Platforms", "Affiliate Marketing", "Local Advertising", "Mobile Advertising", "Native Advertising", "Outdoor Advertising", "SEM", "Social Media Advertising", "Video Advertising", "Agriculture", "AgTech", "Animal Feed", "Aquaculture", "Equestrian", "Farming", "Forestry", "Horticulture", "Hydroponics", "Livestock", "App Discovery", "Apps", "Consumer Applications", "Enterprise Applications", "Mobile Apps", "Reading Apps", "Web Apps", "Artificial Intelligence (AI)", "Generative AI", "Intelligent Systems", "Machine Learning", "Natural Language Processing", "Predictive Analytics", "Robotic Process Automation (RPA)", "Bioinformatics", "Biometrics", "Biopharma", "Biotechnology", "Genetics", "Life Science", "Neuroscience", "Quantified Self", "Bitcoin", "Blockchain", "Cryptocurrency", "Decentralized Finance (DeFi)", "Ethereum", "Non-Fungible Token (NFT)", "Smart Contracts", "Web3", "Apparel", "Fashion", "Laundry and Dry-cleaning", "Lingerie", "Shoes", "Auctions", "Classifieds", "Collectibles", "Consumer Reviews", "Coupons", "E-Commerce", "E-Commerce Platforms", "Flash Sale", "Gift", "Gift Card", "Gift Exchange", "Gift Registry", "Group Buying", "Local Shopping", "Made to Order", "Marketplace", "Office Supplies", "Online Auctions", "Personalization", "Point of Sale", "Price Comparison", "Rental", "Retail", "Retail Technology", "Secondhand Goods", "Shopping", "Shopping Mall", "Social Shopping", "Sporting Goods", "Vending and Concessions", "Virtual Goods", "Wholesale", "Adult", "Baby", "Cannabis", "Children", "Communities", "Dating", "Elderly", "Family", "Funerals", "Humanitarian", "Leisure", "LGBT", "Lifestyle", "Men's", "Online Forums", "Parenting", "Pet", "Private Social Networking", "Professional Networking", "Q&A", "Religion", "Retirement", "Sex Industry", "Sex Tech", "Social", "Social Entrepreneurship", "Teenagers", "Virtual World", "Wedding", "Women's", "Young Adults", "Computer", "Consumer Electronics", "Drones", "Electronics", "Google Glass", "Mobile Devices", "Nintendo", "Playstation", "Roku", "Smart Home", "Wearables", "Windows Phone", "Xbox", "Beauty", "Card and Board Games", "Cleaning Products", "Comics", "Consumer Goods", "Cosmetics", "DIY", "Eyewear", "Fast-Moving Consumer Goods", "Flowers", "Furniture", "Green Consumer Goods", "Handmade", "Home Appliances", "Jewelry", "Personal Care and Hygiene", "Tobacco", "Toys", "Blogging Platforms", "Books", "Content Delivery Network", "Content Discovery", "Content Syndication", "Copywriting", "Creative Agency", "DRM", "EBooks", "Journalism", "News", "Photo Editing", "Photo Sharing", "Photography", "Printing", "Publishing", "Social Bookmarking", "Video Editing", "Video Streaming", "A/B Testing", "Analytics", "Application Performance Management", "Big Data", "Business Intelligence", "Consumer Research", "Data Collection and Labeling", "Data Governance", "Data Integration", "Data Management", "Data Mining", "Data Visualization", "Database", "Facial Recognition", "Geospatial", "Image Recognition", "Location Based Services", "Market Research", "Product Research", "Speech Recognition", "Test and Measurement", "Text Analytics", "Usability Testing", "CAD", "Graphic Design", "Human ComputerInteraction", "Industrial Design", "Interior Design", "Mechanical Design", "Product Design", "UX Design", "Web Design", "Alumni", "Charter Schools", "Continuing Education", "Corporate Training", "E-Learning", "EdTech", "Education", "Edutainment", "Higher Education", "Language Learning", "MOOC", "Music Education", "Personal Development", "Primary Education", "Secondary Education", "Skill Assessment", "Special Education", "STEM Education", "Textbook", "Training", "Tutoring", "Vocational Education", "Battery", "Biofuel", "Biomass Energy", "Clean Energy", "Electrical Distribution", "Energy", "Energy Efficiency", "Energy Management", "Energy Storage", "Fossil Fuels", "Fuel", "Fuel Cell", "Geothermal Energy", "Hydroelectric", "Oil and Gas", "Power Grid", "Renewable Energy", "Solar", "Wind Energy", "Concerts", "Event Management", "Event Promotion", "Events", "Nightclubs", "Nightlife", "Reservations", "Ticketing", "Accounting", "Angel Investment", "Asset Management", "Auto Insurance", "Banking", "Bookkeeping and Payroll", "Commercial Insurance", "Commercial Lending", "Consumer Lending", "Credit", "Credit Bureau", "Credit Cards", "Crowdfunding", "Debit Cards", "Finance", "Financial Exchanges", "Financial Services", "FinTech", "Foreign Exchange Trading", "Fraud Detection", "Funding Platform", "Health Insurance", "Hedge Funds", "Impact Investing", "Incubators", "Insurance", "InsurTech", "Leasing", "Lending", "Life Insurance", "Micro Lending", "Mobile Payments", "Payments", "Personal Finance", "Prediction Markets", "Prepaid Cards", "Property Insurance", "Real Estate Investment", "Stock Exchanges", "Tax Consulting", "Tax Preparation", "Trading Platform", "Transaction Processing", "Venture Capital", "Virtual Currency", "Wealth Management", "Alternative Protein", "Bakery", "Brewing", "Catering", "Coffee", "Confectionery", "Cooking", "Craft Beer", "Dairy", "Dietary Supplements", "Distillery", "Farmers Market", "Food and Beverage", "Food Delivery", "Food Processing", "Food Trucks", "Fruit", "Grocery", "Herbs and Spices", "Meat and Poultry", "Nutrition", "Organic Food", "Plant-Based Foods", "Recipes", "Restaurants", "Seafood", "Snack Food", "Tea", "Wine And Spirits", "Winery", "Casual Games", "Console Games", "Contests", "Fantasy Sports", "Gambling", "Gamification", "Gaming", "MMO Games", "Online Games", "PC Games", "Serious Games", "Video Games", "CivicTech", "Government", "GovTech", "Law Enforcement", "Military", "National Security", "Politics", "Public Safety", "Social Assistance", "3D Technology", "Application Specific Integrated Circuit (ASIC)", "Audio/Visual Equipment", "Augmented Reality", "Cloud Infrastructure", "Communication Hardware", "Communications Infrastructure", "Computer Vision", "Data Center", "Data Center Automation", "Data Storage", "Drone Management", "DSP", "Electronic Design Automation (EDA)", "Embedded Systems", "Field-Programmable Gate Array (FPGA)", "Flash Storage", "GPS", "GPU", "Hardware", "Laser", "Lighting", "Network Hardware", "NFC", "Optical Communication", "Private Cloud", "RemoteSensing", "RFID", "RISC", "Robotics", "Satellite Communication", "Semiconductor", "Sensor", "Telecommunications", "Video Conferencing", "Virtual Reality", "Virtualization", "Wireless", "Addiction Treatment", "Alternative Medicine", "Assisted Living", "Assistive Technology", "Child Care", "Clinical Trials", "Cosmetic Surgery", "Dental", "Diabetes", "Elder Care", "Electronic Health Record (EHR)", "Emergency Medicine", "Fertility", "First Aid", "Health Care", "Health Diagnostics", "Home Health Care", "Hospital", "Medical", "Medical Device", "Mental Health", "mHealth", "Nursing and Residential Care", "Nutraceutical", "Oncology", "Outpatient Care", "Personal Health", "Pharmaceutical", "Precision Medicine", "Primary and Urgent Care", "Psychology", "Rehabilitation", "Telehealth", "Therapeutics", "Veterinary", "Wellness", "Business Information Systems", "Cloud Data Services", "Cloud Management", "Cloud Security", "CMS", "Contact Management", "CRM", "Cyber Security", "DevOps", "Document Management", "E-Signature", "Email", "Identity Management", "Information and Communications Technology (ICT)", "Information Services", "Information Technology", "Intrusion Detection", "IT Infrastructure", "IT Management", "Management Information Systems", "Messaging", "Network Security", "Penetration Testing", "Reputation", "Sales Automation", "Scheduling", "Social CRM", "Spam Filtering", "Technical Support", "Unified Communications", "Video Chat", "VoIP", "Cloud Computing", "Cloud Storage", "Darknet", "Domain Registrar", "Ediscovery", "Internet", "Internet of Things", "ISP", "Music Streaming", "Online Portals", "Product Search", "Search Engine", "Semantic Search", "Semantic Web", "SEO", "SMS", "Social Media", "Social Media Management", "Social Network", "Vertical Search", "Visual Search", "Web Browsers", "Web Hosting", "3D Printing", "Advanced Materials", "Foundries", "Industrial", "Industrial Automation", "Industrial Engineering", "Industrial Manufacturing", "Machinery Manufacturing", "Manufacturing", "Paper Manufacturing", "Plastics and Rubber Manufacturing", "Textiles", "Wood Processing", "Advice", "Animation", "Art", "Audio", "Audiobooks", "Broadcasting", "Celebrity", "Content", "Content Creators", "Digital Entertainment", "Digital Media", "Film", "Film Distribution", "Film Production", "Guides", "In-Flight Entertainment", "Independent Music", "Internet Radio", "Media and Entertainment", "Metaverse", "Motion Capture", "Music", "Music Label", "Music Venues", "Musical Instruments", "Performing Arts", "Podcast", "Social News", "Theatre", "TV", "TV Production", "Video", "Video on Demand", "Meeting Software", "Wired Telecommunications", "Android", "iOS", "Mobile", "Audio Recording and Production", "Mineral", "Mining", "Mining Technology", "Natural Resources", "Precious Metals", "Timber", "Water", "Indoor Positioning", "Mapping Services", "Navigation", "Association", "B2B", "B2C", "Charity", "Collaboration", "Collaborative Consumption", "Commercial", "Consumer", "Crowdsourcing,Customer Service", "Desktop Apps", "Emerging Markets", "Enterprise", "Franchise", "Freemium", "Generation Y", "Generation Z", "Homeless Shelter", "Infrastructure", "LGBTMillennials", "Non Profit", "Peer to Peer", "Professional Services", "Real Time", "Service Industry", "Sharing Economy", "Small and Medium Businesses", "Social Impact", "Subscription Service", "Underserved Children", "Universities", "Billing", "Facebook", "Google", "Linux", "macOS", "Operating Systems", "Tizen", "Twitter", "WebOS", "Windows", "Corrections Facilities", "Homeland Security", "Privacy", "Security", "Advocacy", "Business Development", "Career Planning", "Compliance", "Consulting", "Customer Service", "Employment", "Environmental Consulting", "Field Support", "Freelance", "Innovation Management", "Intellectual Property", "Legal", "Legal Tech", "Management Consulting", "Outsourcing", "Quality Assurance", "Recruiting", "Risk Management", "Social Recruiting", "Translation Service", "Architecture", "Building Maintenance", "Building Material", "Commercial Real Estate", "Construction", "Coworking", "Facility Management", "Green Building", "Heating", "Ventilation", "and Air Conditioning (HVAC)", "Home and Garden", "Home Decor", "Home Improvement", "Home Renovation", "Home Services", "Janitorial Service", "Landscaping", "Mortgage", "Property Development", "Property Management", "PropTech", "Real Estate", "Real Estate Brokerage", "Rental Property", "Residential", "Self-Storage", "Smart Building", "Smart Cities", "Timeshare", "Vacation Rental", "App Marketing", "Brand Marketing", "Cause Marketing", "Content Marketing", "Digital Marketing", "Digital Signage", "Direct Marketing", "Direct Sales", "Email Marketing", "Lead Generation", "Lead Management", "Local", "Local Business", "Loyalty Programs", "Marketing", "Marketing Automation", "Multi-level Marketing", "Personal Branding", "Public Relations", "Sales", "Sales Enablement", "Social Media Marketing", "Sponsorship", "Aerospace", "Chemical", "Chemical Engineering", "Civil Engineering", "Environmental Engineering", "Marine Technology", "Mechanical Engineering", "Nanotechnology", "Nuclear", "Quantum Computing", "Software Engineering", "Browser Extensions", "Business Process Automation (BPA)", "Chatbot", "Consumer Software", "Developer APIs", "Developer Platform", "Developer Tools", "Embedded Software", "Enterprise Resource Planning (ERP)", "Enterprise Software", "File Sharing", "IaaS", "Open Source", "PaaS", "Presentation Software", "Presentations", "Productivity Tools", "QR Codes", "SaaS", "Simulation", "SNS", "Software", "Task Management", "Virtual Assistant", "Virtual Desktop", "Web Development", "American Football", "Baseball", "Basketball", "Boating", "Cricket", "Cycling", "Diving", "eSports", "Fitness", "Golf", "Hockey", "Hunting", "Motorsports", "Outdoors", "Racing", "Recreation", "Rugby", "Sailing", "Skiing", "Soccer", "Sports", "Sports Leagues and Teams", "Surfing", "Swimming", "Table Tennis", "Tennis", "Ultimate Frisbee", "Volley Ball", "Carbon Capture", "CleanTech", "GreenTech", "Organic", "Pollution Control", "Recycling", "Sustainability", "Waste Management", "Water Purification", "Wildlife Conservation", "Air Transportation", "Automotive", "Autonomous Vehicles", "Car Sharing", "Charging Infrastructure", "Delivery Service", "Electric Vehicle", "Ferry Service", "Fleet Management", "Freight Service", "Last Mile Transportation", "Limousine Service", "Logistics", "Marine Transportation", "Parking", "Ports and Harbors", "Procurement", "Public Transportation", "Railroad", "Recreational Vehicles", "Ride Sharing", "Same Day Delivery", "Shipping", "Shipping Broker", "Space Travel", "Supply Chain Management", "Taxi Service", "Transportation", "Warehouse Automation", "Warehousing", "Water Transportation", "Adventure Travel", "Amusement Park and Arcade", "Business Travel", "Casino", "Hospitality", "Hotel", "Museums and Historical Sites", "Parks", "Resorts", "Tour Operator", "Tourism", "Travel", "Travel Accommodations", "Travel Agency"
].each do |category_name|
  Category.find_or_create_by!(name: category_name)
end

[
  "PostgreSQL",
  "MySQL",
  "MariaDB",
  "SQLite",
  "Oracle",
  "Microsoft SQL Server",
  "DB2",
  "CockroachDB",
  "Cassandra",
  "MongoDB",
  "Neo4j",
  "ArangoDB",
  "Apache HBase",
  "Firebase Realtime Database",
  "Amazon DynamoDB",
  "ClickHouse",
  "Google Cloud Datastore",
  "ElasticSearch",
  "InfluxDB",
  "TimescaleDB",
  "Vitess",
  "ScyllaDB",
  "CockroachDB",
  "Berkeley DB",
  "File system",
  "TokuDB",
  "Other"
].each do |database_name|
  Database.find_or_create_by!(name: database_name)
end

[
  "Active Job",
  'Sidekiq',
  'Resque',
  'Delayed Job',
  'Good Job',
  'Faktory',
  'Sneakers',
  'Sucker Punch',
  'Que',
  'Async',
  'Karafka',
  'Solid Queue',
  'Shoryuken',
  'Bunny',
  "Beanstalkd",
  'Other'
].each do |background_job_library_name|
  BackgroundJobLibrary.find_or_create_by!(name: background_job_library_name)
end

[
   "RSpec",
   "Minitest",
   "Test::Unit",
   "RR",
   "Cucumber",
   "Spinach",
   "Turnip",
   "Factory Bot",
   "Rails fixtures",
   "Machinist",
   "Mocha",
   "Webmock",
   "VCR",
   "Capybara",
   "Selenium",
   "Cuprite",
   "Playwright",
   "Ferrum",
   "Mechanize",
   "Poltergeist",
   "Watir"
].each do |testing_tool|
  TestingTool.find_or_create_by!(name: testing_tool)
end

[
  "React",
  "Angular",
  "Vue",
  "Preact",
  "Svelte",
  "Alpine.js",
  "Lit",
  "Solid",
  "Qwik",
  "Stencil",
  "HTMX",
  "Stimulus",
  "Hotwire Turbo",
  "Astro",
  "Ember",
  "jQuery",
  "Elm",
  "Aurelia",
  "Unpoly",
  "Backbone.js",
  "Prototype.js",
  "MooTools",
  "Other",
  "Inertia.js"
].each do |frontend_framework|
  FrontendFramework.find_or_create_by!(name: frontend_framework)
end

[
  "Bun",
  "esbuild",
  "Rollup.js",
  "Webpack",
  "Vite",
  "Parcel",
  "Import maps",
  "Other"
].each do |js_bundler|
  JsBundler.find_or_create_by!(name: js_bundler)
end

[
  "Babel",
  "TypeScript",
  "CoffeeScript",
  "SWC",
  "Vanilla JavaScript",
  "Other"
].each do |js_transpiler|
  JsTranspiler.find_or_create_by!(name: js_transpiler)
end

[
  "Sass",
  "Less",
  "PostCSS",
  "Stylus",
  "Plain CSS",
  "Other"
].each do |css_processor|
  CssProcessor.find_or_create_by!(name: css_processor)
end

[
  "Tailwind CSS",
  "Bootstrap",
  "Bulma",
  "Foundation",
  "CSS Modules",
  "Blueprint CSS",
  "Semantic UI",
  "Materialize",
  "Other"
].each do |css_framework|
  CssFramework.find_or_create_by!(name: css_framework)
end

[
  "Static files",
  "Sprockets",
  "Propshaft",
  "Other"
].each do |asset_pipeline|
  AssetPipeline.find_or_create_by!(name: asset_pipeline)
end

[
  "ERB",
  "HAML",
  "Slim",
  "Liquid",
  "Builder",
  "RJS",
  "Mustache",
  "Markerb",
  "Phlex",
  "Jbuilder",
  "Other"
].each do |template|
  TemplateEngine.find_or_create_by!(name: template)
end

[
  "Rails Cache",
  "Memcached",
  "Redis",
  "File Store",
  "Memory Store",
  "Solid Cache",
  "Other"
].each do |cache|
  CacheStoreImplementation.find_or_create_by!(name: cache)
end

[
  "MRI Ruby (CRuby)",
  "JRuby",
  "TruffleRuby",
  "Rubinius",
  "MagLev",
  "Topaz",
  "Ruby Enterprise Edition (REE)",
  "Other"
].each do |ruby|
  RubyImplementation.find_or_create_by!(name: ruby)
end

[
  # Modern Container-based
  "Kamal",
  "Docker Swarm",
  "Kubernetes",

  # Traditional
  "Capistrano",
  "Mina",
  "Chef",
  "Puppet",
  "Ansible",
  "GitLab CI/CD",

  # PaaS Deployment
  "Heroku",
  "Cloud66",
  "Engine Yard",
  "Render",
  "Fly.io",
  "Hatchbox",

  # Deploy Scripts
  "Git push deploy",
  "Custom bash scripts",
  "Other"
].each do |deploy_tool|
  DeploymentTool.find_or_create_by!(name: deploy_tool)
end

[
  "Action Cable",
  "AnyCable",
  "Faye",
  "Pusher",
  "Slanger",
  "Turbo Streams",
  "Solid Cable",
  "StimulusReflex",
  "Synced",
  "WebSockets",
  "Other"
].each do |realtime_framework|
  RealtimeFramework.find_or_create_by!(name: realtime_framework)
end

[
  [ "Amazon DynamoDB", "A fully managed NoSQL database by AWS, offering fast and predictable performance with seamless scalability for key-value and document data models." ],
  [ "Apache HBase", "A distributed, scalable NoSQL database that runs on top of the Hadoop ecosystem, designed for real-time read/write access to large datasets." ],
  [ "ArangoDB", "A multi-model database that supports document, key-value, and graph data models, allowing developers to use a single database for diverse use cases." ],
  [ "Berkeley DB", "A high-performance embedded database that supports key/value pairs and is typically used for applications requiring fast access to data stored in memory." ],
  [ "Cassandra", "A highly scalable, distributed NoSQL database designed for managing large amounts of data across many commodity servers without a single point of failure." ],
  [ "ClickHouse", "A fast open-source columnar database management system optimized for real-time OLAP (Online Analytical Processing) workloads." ],
  [ "CockroachDB", "A distributed SQL database that offers strong consistency and high availability, designed for global scalability and resilience." ],
  [ "DB2", "IBM's relational database management system, known for its support of multiple data models and its enterprise-grade features for OLTP and OLAP workloads." ],
  [ "ElasticSearch", "A distributed search and analytics engine that enables fast full-text search and analytics, commonly used for log analysis and monitoring." ],
  [ "File system", "A method for storing and organizing files on a storage device, often used for simple data storage and retrieval, but lacks the advanced querying features of databases." ],
  [ "Firebase Realtime Database", "A cloud-hosted NoSQL database that allows developers to store and sync data between users in real-time, typically used for mobile and web applications." ],
  [ "Google Cloud Datastore", "A fully managed NoSQL database from Google Cloud for building scalable and high-performance applications, offering automatic scaling and high availability." ],
  [ "InfluxDB", "A time-series database optimized for handling large volumes of time-stamped data, commonly used in monitoring, IoT, and real-time analytics." ],
  [ "MariaDB", "An open-source relational database management system, originally a fork of MySQL, known for its reliability, speed, and flexibility." ],
  [ "Microsoft SQL Server", "A relational database management system by Microsoft that provides enterprise-level features for data management, analytics, and reporting." ],
  [ "MongoDB", "A NoSQL database known for its flexibility with unstructured data, storing data in JSON-like documents that allow for high scalability and performance." ],
  [ "MySQL", "An open-source relational database management system, widely used in web applications for its reliability, ease of use, and support for SQL." ],
  [ "Neo4j", "A graph database that uses graph structures with nodes, edges, and properties to store and query data, ideal for applications requiring complex relationships." ],
  [ "Oracle", "A powerful relational database management system known for its robust enterprise features, scalability, and comprehensive support for SQL and PL/SQL." ],
  [ "Other", "A placeholder for any database not included in the listed categories, ranging from specialized databases to newer or less common ones." ],
  [ "PostgreSQL", "An advanced open-source relational database system with support for SQL and JSON, offering powerful features for data integrity, concurrency, and extensibility." ],
  [ "SQLite", "A lightweight, serverless, self-contained SQL database engine used for embedded applications, mobile apps, and websites with simple data needs." ],
  [ "ScyllaDB", "A high-performance NoSQL database compatible with Apache Cassandra, designed to provide faster performance and lower latency by utilizing a more modern architecture." ],
  [ "TimescaleDB", "A time-series database built on top of PostgreSQL, optimized for storing and analyzing large volumes of time-stamped data efficiently." ],
  [ "TokuDB", "A high-performance storage engine for MySQL and MariaDB that uses Fractal Tree indexing to handle write-heavy workloads efficiently." ],
  [ "Vitess", "A database clustering system for horizontal scaling of MySQL, designed to handle large-scale, high-traffic applications by breaking down databases into smaller, manageable pieces." ]
].each do |name, description|
  Database.find_by!(name: name).update(description: description)
end

[
  [ "Active Job", "Rails' built-in job framework, providing a unified interface for queuing and executing background jobs with support for multiple backends." ],
  [ "Async", "A lightweight library for asynchronous task execution, focusing on simplicity and minimal dependencies, often used in Ruby applications for concurrency." ],
  [ "Beanstalkd", "A fast, simple, and reliable message queue for job processing, designed for high-throughput and low-latency task scheduling." ],
  [ "Bunny", "A Ruby client for RabbitMQ, enabling message-based communication for background job processing and inter-service communication." ],
  [ "Delayed Job", "A database-backed job processing system for Ruby, storing jobs in the database and providing reliability and ease of use for small-scale applications." ],
  [ "Faktory", "A modern background job server that supports multiple languages, designed for simplicity, scalability, and developer friendliness." ],
  [ "Good Job", "A multithreaded, Postgres-backed job queue for Ruby on Rails, designed for reliability and efficiency with transactional support." ],
  [ "Karafka", "A framework for building Ruby and Rails applications that process data streams from Kafka, enabling distributed and real-time processing." ],
  [ "Other", "A placeholder for any job processing system not listed, often representing custom solutions or less common libraries tailored to specific needs." ],
  [ "Que", "A high-performance, PostgreSQL-backed job queue for Ruby, focusing on low-latency and transactional job processing." ],
  [ "Resque", "A Redis-backed job processing system for Ruby, offering reliability, scalability, and a focus on simple job management." ],
  [ "Shoryuken", "A multithreaded job processor for AWS SQS (Simple Queue Service), enabling efficient processing of background jobs in a serverless architecture." ],
  [ "Sidekiq", "A popular, multithreaded background job processor for Ruby, using Redis to handle high-throughput, scalable, and reliable job processing." ],
  [ "Sneakers", "A RabbitMQ-based job processing framework for Ruby, designed for scalability and distributed message handling." ],
  [ "Solid Queue", "A Ruby library for background job processing with a focus on simplicity, reliability, and easy integration." ],
  [ "Sucker Punch", "A lightweight in-process background job processing library for Ruby, eliminating the need for an external job queue system." ]
].each do |name, description|
  BackgroundJobLibrary.find_by!(name: name).update(description: description)
end

[
  [ "File Store", "A cache store implementation that stores cached data on the local filesystem, providing simple and efficient caching for small to medium-sized applications." ],
  [ "Memcached", "A high-performance, in-memory caching system designed for speed, commonly used to reduce database load and improve application response times." ],
  [ "Memory Store", "A simple caching solution that keeps data in the application server's memory, offering fast access but limited by the server's memory capacity." ],
  [ "Other", "A placeholder for any caching solution not listed, often referring to custom or less common caching mechanisms tailored to specific needs." ],
  [ "Rails Cache", "The default caching framework in Rails, providing a unified interface for storing and retrieving cached data, compatible with various backends like Redis, Memcached, and file stores." ],
  [ "Redis", "An in-memory data structure store often used as a high-speed caching backend, supporting features like expiration policies and advanced data types." ],
  [ "Solid Cache", "A caching solution for Rails applications, emphasizing reliability, performance, and simplicity in managing cached data." ]
].each do |name, description|
  CacheStoreImplementation.find_by!(name: name).update(description: description)
end

[
  [ "Blueprint CSS", "A CSS framework focused on simplicity and consistency, offering a set of base styles and a flexible grid system for building responsive web applications." ],
  [ "Bootstrap", "A widely-used CSS framework that provides pre-built components and responsive grid systems, making it easy to design mobile-first websites and web applications." ],
  [ "Bulma", "A modern CSS framework based on Flexbox, offering a clean and simple structure for building responsive and flexible web interfaces without JavaScript dependencies." ],
  [ "CSS Modules", "A CSS approach where styles are scoped to individual components, ensuring that class names are locally scoped and preventing style conflicts." ],
  [ "Foundation", "A responsive front-end framework offering a range of tools and components for building flexible, mobile-first websites with an emphasis on accessibility and customizability." ],
  [ "Materialize", "A CSS framework based on Google's Material Design, providing a rich set of UI components, animations, and responsive grids for building modern, aesthetically-pleasing web applications." ],
  [ "Other", "A placeholder for any CSS framework not listed, typically referring to custom or lesser-known frameworks tailored to specific use cases or preferences." ],
  [ "Semantic UI", "A CSS framework that uses human-readable class names and components based on natural language principles, allowing for intuitive and easy-to-understand code." ],
  [ "Tailwind CSS", "A utility-first CSS framework that enables rapid custom design by composing utility classes directly in the HTML, offering flexibility and full control over styling." ]
].each do |name, description|
  CssFramework.find_by!(name: name).update(description: description)
end

[
  [ "Less", "A CSS preprocessor that extends CSS with variables, mixins, and nested rules, providing a more dynamic and maintainable way to write stylesheets." ],
  [ "Other", "A placeholder for any CSS preprocessor or styling solution not listed, often referring to custom or less common tools used for managing CSS." ],
  [ "Plain CSS", "The standard way of writing CSS without the use of preprocessors or additional tools, offering a straightforward approach to styling web pages." ],
  [ "PostCSS", "A tool for transforming CSS with JavaScript plugins, enabling advanced features like autoprefixing, minification, and other custom transformations." ],
  [ "Sass", "A powerful CSS preprocessor that extends CSS with features like variables, mixins, nesting, and functions, making stylesheets more reusable and easier to maintain." ],
  [ "Stylus", "A flexible and expressive CSS preprocessor that offers powerful features like variables, mixins, and optional semicolons, allowing for highly customizable stylesheets." ] ].each do |name, description|
  CssProcessor.find_by!(name: name).update(description: description)
end

[
  [ "Ansible", "An open-source automation tool for configuring and managing servers, allowing for easy deployment, orchestration, and configuration management using simple YAML scripts." ],
  [ "Capistrano", "A remote server automation and deployment tool, commonly used for deploying web applications, supporting tasks like file transfer, service restarts, and database migrations." ],
  [ "Chef", "A configuration management tool that automates infrastructure deployment, ensuring consistency across environments with scripts that describe system configuration." ],
  [ "Cloud66", "A cloud-native deployment platform that helps deploy, manage, and scale applications across various cloud providers with automated infrastructure management." ],
  [ "Custom bash scripts", "A method for automating deployment using custom-written bash scripts, providing full control over deployment workflows but requiring manual setup and maintenance." ],
  [ "Docker Swarm", "A container orchestration tool for managing Docker containers across multiple machines, enabling clustering and high availability for containerized applications." ],
  [ "Engine Yard", "A platform-as-a-service (PaaS) that simplifies deployment and management of cloud-based applications, offering scaling, monitoring, and automated infrastructure management." ],
  [ "Fly.io", "A platform for deploying applications globally with automatic scaling, designed for low-latency and high-availability applications, running closer to users at edge locations." ],
  [ "Git push deploy", "A deployment method where changes are automatically deployed to a production environment by pushing code to a Git repository, triggering a deployment process." ],
  [ "GitLab CI/CD", "A continuous integration and delivery platform built into GitLab, automating code testing, building, and deployment directly from Git repositories." ],
  [ "Hatchbox", "A platform for managing and deploying Ruby on Rails applications, focusing on simplicity and automation with features like server provisioning, monitoring, and scaling." ],
  [ "Heroku", "A platform-as-a-service (PaaS) that simplifies app deployment, scaling, and management with an easy-to-use interface, enabling developers to focus on building applications." ],
  [ "Kamal", "A deployment tool that handles zero-downtime deployments, rolling restarts, and service management for containerized applications using Docker." ],
  [ "Kubernetes", "A powerful open-source container orchestration platform for automating deployment, scaling, and management of containerized applications, providing high availability and fault tolerance." ],
  [ "Mina", "A fast deployment tool for Ruby applications that focuses on simplicity and speed, minimizing downtime during deployment with parallel task execution." ],
  [ "Other", "A placeholder for any deployment or orchestration tool not listed, typically referring to custom or less common systems used for managing application deployment." ],
  [ "Puppet", "A configuration management tool that automates the provisioning, configuration, and management of servers, ensuring consistency and compliance across environments." ],
  [ "Render", "A platform-as-a-service (PaaS) that automates the deployment of web applications, APIs, and databases, offering continuous deployment, scaling, and monitoring features." ]
].each do |name, description|
  DeploymentTool.find_by!(name: name).update(description: description)
end

[
  [ "Alpine.js", "A lightweight JavaScript framework for adding interactivity to HTML, offering simplicity and reactivity similar to Vue or React but with minimal overhead." ],
  [ "Angular", "A comprehensive framework developed by Google for building dynamic, single-page web applications using a component-based architecture." ],
  [ "Astro", "A modern web framework designed for building static websites and web applications with optimized performance and support for multiple UI frameworks." ],
  [ "Aurelia", "A forward-thinking JavaScript framework focused on simplicity and developer productivity, offering clean conventions and data-binding capabilities." ],
  [ "Backbone.js", "A lightweight JavaScript library providing structure to web applications with models, views, events, and a RESTful JSON interface." ],
  [ "Elm", "A functional programming language for building web frontends, emphasizing performance, immutability, and a strong type system to eliminate runtime errors." ],
  [ "Ember", "A robust framework for building ambitious web applications, offering a convention-over-configuration approach and tools like Ember CLI for productivity." ],
  [ "HTMX", "A library for building modern, dynamic web applications with minimal JavaScript, focusing on extending HTML attributes to enable advanced interactivity." ],
  [ "Hotwire Turbo", "A Rails framework for building fast, modern web applications with minimal JavaScript by replacing parts of the page via server-rendered HTML updates." ],
  [ "Lit", "A library for building fast and lightweight web components with minimal boilerplate, leveraging modern standards like Web Components and reactive properties." ],
  [ "MooTools", "A lightweight JavaScript library that extends JavaScript's core functionality, offering utilities for DOM manipulation, animations, and more." ],
  [ "Other", "A placeholder for any JavaScript framework or library not listed, often referring to niche, experimental, or custom tools." ],
  [ "Preact", "A fast and lightweight alternative to React with the same modern component-based architecture but a smaller bundle size." ],
  [ "Prototype.js", "A pioneering JavaScript library that introduced features like AJAX support and DOM extensions, widely used before modern frameworks gained popularity." ],
  [ "Qwik", "A cutting-edge JavaScript framework focused on delivering instant interactivity and optimizing performance for complex web applications." ],
  [ "React", "A widely-used JavaScript library developed by Facebook for building user interfaces with a component-based and declarative approach." ],
  [ "Solid", "A reactive JavaScript framework designed for high performance and fine-grained reactivity, offering a modern take on building web interfaces." ],
  [ "Stencil", "A framework for building reusable, standards-based web components with a focus on performance and compatibility with multiple frameworks." ],
  [ "Stimulus", "A lightweight JavaScript framework for enhancing HTML elements with behavior, designed to work seamlessly with server-rendered HTML in Rails." ],
  [ "Svelte", "A modern framework for building user interfaces, where components are compiled into efficient JavaScript, eliminating the need for a runtime." ],
  [ "Unpoly", "A framework for creating fast and dynamic server-rendered web applications, enhancing user experience without requiring a full SPA." ],
  [ "Vue", "A progressive JavaScript framework for building user interfaces, offering simplicity, flexibility, and an approachable API for developers of all levels." ],
  [ "jQuery", "A fast and feature-rich JavaScript library for DOM manipulation, event handling, and AJAX interactions, widely used before modern frameworks emerged." ],
  [ "Inertia.js", "A framework for building server-driven single-page applications, combining the best of server-side rendering and client-side interactivity." ]
].each do |name, description|
  FrontendFramework.find_by!(name: name).update(description: description)
end

[
  [ "Bun", "A modern JavaScript runtime and bundler optimized for speed, offering features like native TypeScript support, built-in transpilation, and package management." ],
  [ "Import maps", "A browser-native approach to managing module imports, allowing developers to control module resolution directly in the browser without requiring a bundler." ],
  [ "Other", "A placeholder for any bundler or module loader not listed, referring to custom or less common tools tailored to specific use cases." ],
  [ "Parcel", "A zero-config bundler for web applications, offering fast builds, automatic dependency resolution, and support for a wide range of file types." ],
  [ "Rollup.js", "A module bundler optimized for building small and efficient libraries, with tree-shaking to eliminate unused code for smaller bundles." ],
  [ "Vite", "A fast and modern build tool that leverages native ES modules in development and Rollup for production builds, ensuring fast startup times and efficient builds." ],
  [ "Webpack", "A powerful and flexible bundler that enables developers to compile JavaScript modules along with assets like images, styles, and more into optimized bundles." ],
  [ "esbuild", "An extremely fast bundler and transpiler written in Go, designed to handle modern JavaScript and TypeScript projects with minimal configuration." ]
].each do |name, description|
  JsBundler.find_by!(name: name).update(description: description)
end

[
  [ "Babel", "A popular JavaScript compiler that transforms modern JavaScript syntax into backward-compatible code for older browsers, supporting plugins and custom configurations." ],
  [ "CoffeeScript", "A programming language that compiles into JavaScript, offering a more concise and expressive syntax while retaining JavaScript compatibility." ],
  [ "Other", "A placeholder for any JavaScript transpiler or language not listed, often referring to experimental, niche, or custom tools." ],
  [ "SWC", "A fast and modern JavaScript and TypeScript compiler written in Rust, designed for high performance and supporting modern syntax transformations." ],
  [ "TypeScript", "A strongly typed superset of JavaScript that compiles into plain JavaScript, offering enhanced tooling, type safety, and scalability for large projects." ],
  [ "Vanilla JavaScript", "The plain and untranspiled version of JavaScript as defined by the ECMAScript standard, used directly in browsers or Node.js environments." ]
].each do |name, description|
  JsTranspiler.find_by!(name: name).update(description: description)
end

[
  [ "Action Cable", "A Rails framework for integrating WebSocket-based real-time features, allowing seamless communication between clients and the server." ],
  [ "AnyCable", "A scalable alternative to Action Cable for Rails, leveraging gRPC and WebSocket servers for improved performance and compatibility." ],
  [ "Faye", "A lightweight publish-subscribe messaging system for real-time messaging over WebSockets and HTTP, ideal for dynamic applications." ],
  [ "Other", "A placeholder for any real-time framework or technology not listed, typically referring to custom or lesser-known solutions." ],
  [ "Pusher", "A managed service for real-time messaging and WebSocket connections, providing an easy-to-use API for broadcasting and subscribing to events." ],
  [ "Slanger", "An open-source server implementation of the Pusher protocol, offering real-time messaging and WebSocket support." ],
  [ "Solid Cable", "A database-backed Action Cable adapter that replaces Redis by storing messages in a table and polling for updates, offering comparable performance in most cases." ],
  [ "StimulusReflex", "A Rails framework for building interactive, real-time web applications by handling server-side rendering updates over WebSockets." ],
  [ "Synced", "A real-time synchronization library for Rails that uses WebSockets to keep data consistent between the server and connected clients." ],
  [ "Turbo Streams", "A Rails framework for real-time updates, allowing dynamic partial updates of HTML via WebSockets or HTTP." ],
  [ "WebSockets", "A protocol for enabling full-duplex communication channels between a client and a server, foundational for building real-time applications." ]
].each do |name, description|
  RealtimeFramework.find_by!(name: name).update(description: description)
end

[
  [ "JRuby", "A Ruby implementation that runs on the Java Virtual Machine (JVM), enabling seamless integration with Java libraries and tools while offering high performance." ],
  [ "MRI Ruby (CRuby)", "The standard Ruby implementation written in C, maintained by the Ruby core team, and used as the reference implementation for the Ruby language." ],
  [ "MagLev", "A Ruby implementation built on the GemStone/S Smalltalk virtual machine, focused on persistence and scalability for enterprise applications." ],
  [ "Other", "A placeholder for any Ruby implementation not listed, often referring to experimental, custom, or niche versions of Ruby." ],
  [ "Rubinius", "A Ruby implementation focused on concurrency and performance, with a just-in-time (JIT) compiler and a focus on running Ruby as a language on the Rubinius VM." ],
  [ "Ruby Enterprise Edition (REE)", "An optimized version of MRI Ruby with performance improvements and reduced memory usage, particularly for large-scale production applications (now deprecated)." ],
  [ "Topaz", "An experimental Ruby implementation built on the PyPy toolchain, aimed at providing a fast and flexible Ruby runtime." ],
  [ "TruffleRuby", "A high-performance Ruby implementation built on the GraalVM, focused on delivering faster execution and improved memory usage for Ruby applications." ]
].each do |name, description|
  RubyImplementation.find_by!(name: name).update(description: description)
end

[
  [ "Builder", "A templating library that allows you to programmatically create XML or HTML structures using Ruby code." ],
  [ "ERB", "The default templating system in Rails, embedding Ruby code within HTML for dynamic content generation." ],
  [ "HAML", "A clean and concise templating engine for Ruby, emphasizing indentation-based syntax for improved readability and simplicity." ],
  [ "Jbuilder", "A Ruby library for generating JSON responses in a structured and programmatic way, commonly used in Rails APIs." ],
  [ "Liquid", "A secure and flexible templating engine designed for rendering in a sandboxed environment, popular in e-commerce and CMS platforms like Shopify." ],
  [ "Markerb", "A Ruby gem that integrates Markdown and ERB, allowing you to write templates with Markdown syntax and embedded Ruby code." ],
  [ "Mustache", "A logic-less templating engine that focuses on separating templates from business logic, ensuring clarity and maintainability." ],
  [ "Other", "A placeholder for any Ruby templating tool not listed, often used for niche or custom solutions." ],
  [ "Phlex", "A Ruby library for generating views as classes and methods, promoting a component-based approach with strict typing and reusability." ],
  [ "RJS", "A Ruby-based templating system for generating JavaScript responses directly from the server, typically used for AJAX interactions in Rails (now deprecated)." ],
  [ "Slim", "A lightweight templating engine that uses indentation and a minimalist syntax to create concise and maintainable HTML views." ]
].each do |name, description|
  TemplateEngine.find_by!(name: name).update(description: description)
end

[
  [ "Capybara", "A tool for testing web applications by simulating user interactions with features like form submission, navigation, and more." ],
  [ "Cucumber", "A testing framework that uses plain language scenarios to describe application behavior, enabling collaboration between developers and non-technical stakeholders." ],
  [ "Cuprite", "A modern driver for Capybara that leverages the Chrome DevTools Protocol for faster and more reliable browser testing." ],
  [ "Factory Bot", "A library for creating test data by defining factories, simplifying the setup of test scenarios with reusable and customizable objects." ],
  [ "Ferrum", "A headless browser driver for Capybara based on the Chrome DevTools Protocol, offering an alternative to Selenium." ],
  [ "Machinist", "A fixture replacement tool similar to Factory Bot, focused on quickly building objects for testing with a concise syntax." ],
  [ "Mechanize", "A Ruby library for automating interactions with websites, including form submissions, link clicking, and scraping content." ],
  [ "Minitest", "A lightweight and fast testing framework for Ruby, offering unit testing, mocking, and benchmarking capabilities." ],
  [ "Mocha", "A mocking and stubbing library for Ruby, designed to work with any testing framework to simplify unit tests." ],
  [ "Playwright", "A modern end-to-end testing framework that supports automation across multiple browsers with powerful features like context isolation." ],
  [ "Poltergeist", "A Capybara driver for headless testing using PhantomJS, designed for JavaScript-heavy applications (now largely deprecated)." ],
  [ "RR", "A double framework for mocking and stubbing in Ruby, providing flexibility and concise syntax for test doubles." ],
  [ "RSpec", "A popular behavior-driven development (BDD) testing framework with a focus on readability and a rich set of features for testing Ruby applications." ],
  [ "Rails fixtures", "Built-in Rails support for managing test data using YAML files to define database records for tests." ],
  [ "Selenium", "A widely used framework for automating browsers, enabling detailed functional and end-to-end testing of web applications." ],
  [ "Spinach", "A BDD testing framework similar to Cucumber but built with a simpler and more structured approach to writing feature tests." ],
  [ "Test::Unit", "Ruby’s standard unit testing framework, offering a straightforward approach to organizing and running tests." ],
  [ "Turnip", "An RSpec extension for writing feature tests in Gherkin syntax, combining Cucumber-style scenarios with RSpec’s power." ],
  [ "VCR", "A library for recording HTTP interactions during tests, allowing developers to replay requests without hitting external services." ],
  [ "Watir", "A browser automation library for Ruby, emphasizing ease of use for functional and end-to-end web testing." ],
  [ "Webmock", "A library for stubbing HTTP requests in Ruby, enabling offline testing and controlling external service interactions." ]
].each do |name, description|
  TestingTool.find_by!(name: name).update(description: description)
end
