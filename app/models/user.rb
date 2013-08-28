class User < ActiveRecord::Base

  validates :email, uniqueness: { case_sensitive: false }

  def self.from_omniauth(auth)
    # where(auth.slice("provider", "uid")).first || create_with_omniauth(auth)
    where(email: auth["info"]["email"]).first || create_with_omniauth(auth)
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.email = auth["info"]["email"]
    end
  end
end
