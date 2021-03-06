class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

   has_many :identities

   def twitter
     identities.where( :provider => "twitter" ).first
   end

   def twitter_client
     @twitter_client ||= Twitter.client( access_token: twitter.accesstoken )
   end

   def google_oauth2
     identities.where( :provider => "google_oauth2" ).first
   end

   def google_oauth2_client
     if !@google_oauth2_client
       @google_oauth2_client = Google::APIClient.new(:application_name => 'deviseapp', :application_version => "1.0.0" )
       @google_oauth2_client.authorization.update_token!({:access_token => google_oauth2.accesstoken, :refresh_token => google_oauth2.refreshtoken})
     end
     @google_oauth2_client
   end

   def full_name
     "#{first_name} #{last_name}".titleize
   end

  def speaker?
    self.role == "Speaker"
  end
  def user?
    self.role == "User"
  end
  def host?
    self.role == "Host"
  end
   #
  #  def host?
  #    if "#{role} = Host"
  #      true
  #    else
  #      false
  #    end
  #  end

end
