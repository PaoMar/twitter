json.array!(@users) do |user|
  json.extract! user, :id, :username, :email, :password_digest, :cover_photo, :profile_picture, :private, :timezone, :language, :phone, :verified, :name, :bio, :website
  json.url user_url(user, format: :json)
end
