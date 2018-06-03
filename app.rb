require 'sinatra/base'
# Our main app class
class Appcapella < Sinatra::Base
  enable :sessions

  get '/' do
    @filename1 = session[:filename1]
    @filename2 = session[:filename2]
    @filename3 = session[:filename3]
    @filename4 = session[:filename4]
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

  post '/upload_2' do
    tempfile = params[:video_upload_2][:tempfile]
    @filename2 = params[:video_upload_2][:filename]
    session[:filename2] = params[:video_upload_2][:filename]
    File.open("./public/#{@filename2}", 'wb') do |f|
      f.write(tempfile.read)
    end
    redirect '/'
  end

  post '/upload_3' do
    tempfile = params[:video_upload_3][:tempfile]
    @filename3 = params[:video_upload_3][:filename]
    session[:filename3] = params[:video_upload_3][:filename]
    File.open("./public/#{@filename3}", 'wb') do |f|
      f.write(tempfile.read)
    end
    redirect '/'
  end

  post '/upload_4' do
    tempfile = params[:video_upload_4][:tempfile]
    @filename4 = params[:video_upload_4][:filename]
    session[:filename4] = params[:video_upload_4][:filename]
    File.open("./public/#{@filename4}", 'wb') do |f|
      f.write(tempfile.read)
    end
    redirect '/'
  end


  post '/mix' do


    redirect '/view_mix'
  end

  get '/view_mix' do
    erb(:view_mix)
  end

  run! if app_file == $0
end
