
class Helpers < ApplicationController

    def self.is_logged_in?(session)
        
        !!session[:user_id] 
        # arg is also a hash {:user_id=>1}
        #binding.pry
    end
    def self.current_user(session)
        # arg is a hash {:user_id=>1}
        @user = User.find_by(id: session[:user_id])
        
    end
end