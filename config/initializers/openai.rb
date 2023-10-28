OpenAI.configure do |config|
  if 
  config.access_token = ENV.fetch("OPENAI_ACCESS_TOKEN") || 'environment_variable_not_found'
end