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

  post '/upload_5' do
    tempfile = params[:video_upload_5][:tempfile]
    session[:filename5] = params[:video_upload_5][:filename]
    File.open("./public/#{session[:filename5]}", 'wb') do |f|
      f.write((tempfile).read)
    end
    redirect '/'
  end

  post '/upload_1' do
    tempfile = params[:video_upload_1][:tempfile]
    session[:filename1] = params[:video_upload_1][:filename]
    File.open("./public/#{session[:filename1]}", 'wb') do |f|
      f.write((tempfile).read)
    end
    redirect '/'
  end

  post '/upload_2' do
    tempfile = params[:video_upload_2][:tempfile]
    session[:filename2] = params[:video_upload_2][:filename]
    File.open("./public/#{session[:filename2]}", 'wb') do |f|
      f.write(tempfile.read)
    end
    redirect '/'
  end

  post '/upload_3' do
    tempfile = params[:video_upload_3][:tempfile]
    session[:filename3] = params[:video_upload_3][:filename]
    File.open("./public/#{session[:filename3]}", 'wb') do |f|
      f.write(tempfile.read)
    end
    redirect '/'
  end

  post '/upload_4' do
    tempfile = params[:video_upload_4][:tempfile]
    session[:filename4] = params[:video_upload_4][:filename]
    File.open("./public/#{session[:filename4]}", 'wb') do |f|
      f.write(tempfile.read)
    end
    redirect '/'
  end


  post '/mix' do

  # Should this logic be in a model?
    File.delete('./public/mix.mp4') if File.exist?('./public/mix.mp4')

    system "ffmpeg -i './public/#{ session[:filename1] }' -i './public/#{ session[:filename2] }' -i './public/#{ session[:filename3] }' -i './public/#{ session[:filename4] }' -filter_complex \"nullsrc=size=640x480 [base]; [0:v] setpts=PTS-STARTPTS, scale=320x240 [upperleft]; [1:v] setpts=PTS-STARTPTS, scale=320x240 [upperright]; [2:v] setpts=PTS-STARTPTS, scale=320x240 [lowerleft]; [3:v] setpts=PTS-STARTPTS, scale=320x240 [lowerright]; [base][upperleft] overlay=shortest=1 [tmp1]; [tmp1][upperright] overlay=shortest=1:x=320 [tmp2]; [tmp2][lowerleft] overlay=shortest=1:y=240 [tmp3]; [tmp3][lowerright] overlay=shortest=1:x=320:y=240\" -c:v libx264 ./public/mix.mp4 "

    redirect '/view_mix'
  end

  get '/view_mix' do
    erb(:view_mix)
  end

  run! if app_file == $0
end
