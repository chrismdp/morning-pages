require 'sinatra'

post '/api/register' do
  content_type "application/json"
  %{{"key":"12345"}}
end

run Sinatra::Application
