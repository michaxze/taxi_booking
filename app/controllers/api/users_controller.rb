module Api                                                              
  class UsersController < ApplicationController
    respond_to :json                                                    
                                                                        
    def create
      respond_with User.create_user(params[:user])
    end

    def retrieve_password
      password = User.get_password(params[:mobileno])

      respond_to do |format|
        format.json { render json: {:password => password} }
      end
    end

  end
end
