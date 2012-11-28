class UserMailer < ActionMailer::Base
  default :from => "info@soundproject.com"
  
  def event_registration(user)
    users=[]
    user.friendships.each do |friendship|
        users+=User.where(:user_id => friendship.friend_id)
    end
    #attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
    for u in users
    	mail(:to => "#{u.full_name} <#{u.email}>", 
    	:subject => "Someone you follow has created an event", :from => "info@soundproject.com")
    end
    
  end
end
