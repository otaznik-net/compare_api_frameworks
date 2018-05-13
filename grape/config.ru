#require 'oj'
require 'grape'
#require 'grape/jbuilder'

class Simple < Grape::API
  format :json
  default_format :json
  #formatter :json, Grape::Formatter::Jbuilder

  get '/static' do
    { hello: :dolly }
  end

  get '/random' do
    { your_happy_number: rand(365) }
  end
end

run Simple
