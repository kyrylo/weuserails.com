Rails.application.configure do
  MissionControl::Jobs.http_basic_auth_user = ENV["MISSION_CONTROL_HTTP_BASIC_AUTH_USER"]
  MissionControl::Jobs.http_basic_auth_password = ENV["MISSION_CONTROL_HTTP_BASIC_AUTH_PASSWORD"]
end
