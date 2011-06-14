Factory.define :category do |f|
  f.name  do
    name = nil
    while name == nil
      name = Faker::Internet.user_name
      name = nil if !Category.find_by_name(name).nil?
    end
    name
  end
  
  f.association :catalog, :factory => :catalog
end