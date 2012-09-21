require 'sinatra'

post '/api/register' do
  content_type "application/json"
  %{{"key":"12345"}}
end

post '/api/stats' do
  halt 401 unless params[:key] == '12345'
  "OK"
end

run Sinatra::Application
