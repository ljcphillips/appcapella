require 'sinatra/base'
# Our main app class
class Appcapella < Sinatra::Base
  enable :sessions

  get '/' do
    @filename = session[:newfilename]
    erb(:index)
  end

  post '/upload_new' do
      tempfile = params[:video_upload_new][:tempfile]
      @filename = params[:video_upload_new][:filename]
      session[:newfilename] = params[:video_upload_new][:filename]
      # @file = params[:file]
      File.open("./public/#{@filename}", 'wb') do |f|
        f.write(tempfile.read)
      end
      redirect '/'
    end

  run! if app_file == $0
end
