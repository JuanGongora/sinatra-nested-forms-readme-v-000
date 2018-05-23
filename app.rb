require_relative 'config/environment'
require_relative 'models/student'
require_relative 'models/course'


class App < Sinatra::Base

  get '/' do
    erb :new
  end

  post '/student' do
    @student = Student.new(params[:student])

    params[:student][:courses].each do |field|
      Course.new(field)
    end

    @courses = Course.all

    erb :student
  end
end
