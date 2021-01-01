class User < ApplicationRecord
  def self.find_or_create_from_auth(auth)
    user = User.find_or_create_by(uid: auth['uid'])

    user.uid = auth['uid']
    user.username = auth['info']['nickname']
    user.token = auth['credentials']['token']

    user.save
    user
  end
end
