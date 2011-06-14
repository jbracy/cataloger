Factory.define :categorization do |f|
  f.association :product, :factory => :product
  f.association :category, :factory => :category
end