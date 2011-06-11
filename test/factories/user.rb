Factory.define :user do |f|
  f.username do
    name = nil
    while name == nil
      name = Faker::Internet.user_name
      if name.length <= 3 || !User.find_by_username(name).nil?
        name = nil
      end
    end
    name
  end

  f.email { Faker::Internet.email }
  f.password 'test'
  f.password_confirmation 'test'
  f.persistence_token   { Authlogic::Random.hex_token }
  f.single_access_token { Authlogic::Random.friendly_token }
  f.perishable_token    { Authlogic::Random.friendly_token }
end
