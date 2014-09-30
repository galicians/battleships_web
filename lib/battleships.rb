require 'sinatra/base'

class Battleships < Sinatra::Base
 set :views, Proc.new { File.join(root, "..","views") }
  
  get '/' do
  	erb :index
  end

  get '/sign_in' do
  	erb :sign_in
  end

  post '/sign_in' do
  	@name = params['name']
  	erb :board
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
