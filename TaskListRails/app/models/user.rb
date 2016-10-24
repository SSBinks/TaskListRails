class User < ActiveRecord::Base
  has_many :tasks

  validates :uid, presence: true, uniqueness: { scope: :provider,
    message: "Cannot have multiple users from the same provider with the same UID"}
    validates :provider, presence: true

    def self.build_from_github(auth_hash)
      user       = User.new
      user.uid   = auth_hash[:uid]
      user.provider = 'github'
      user.nickname  = auth_hash['info']['nickname']
      user.email = auth_hash['info']['email']
      return user
    end
end
