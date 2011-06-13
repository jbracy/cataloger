Factory.define :catalog do |f|
  f.title  do
    name = nil
    while name == nil
      name = Faker::Company.name
      name = nil if name.length <= 3 || !Catalog.find_by_title(name).nil?
    end
    name
  end
  f.association :user, :factory => :user
end