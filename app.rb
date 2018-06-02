require 'sinatra/base'
# Our main app class
class Appcapella < Sinatra::Base
  enable :sessions

  get '/' do
    @filename1 = session[:filename1]
    erb(:index)
  end

  post '/upload_1' do
      tempfile = params[:video_upload_1][:tempfile]
      @filename1 = params[:video_upload_1][:filename]
      session[:filename1] = params[:video_upload_1][:filename]
      File.open("./public/#{@filename1}", 'wb') do |f|
        f.write(tempfile.read)
      end
      redirect '/'
    end

  run! if app_file == $0
end
