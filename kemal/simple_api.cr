require "kemal"
require "json"

get "/static" do |env|
  env.response.content_type = "application/json"
  { hello: :dolly }.to_json
end

get "/random" do |env|
  env.response.content_type = "application/json"
  { your_happy_number: rand(365) }.to_json
end

Kemal.run
