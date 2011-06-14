Factory.define :product do |f|
  f.association :catalog, :factory => :catalog
end