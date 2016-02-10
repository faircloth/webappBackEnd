class Api::SubjectsController < ApplicationController

  skip_before_filter :verify_authenticity_token
  
  def index
    subjects = Subject.all 
    render json: subjects
  end

end