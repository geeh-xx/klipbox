class Article < ActiveRecord::Base
  validates_presence_of :title, message: "deve ser preenchido"
  validates_presence_of :text, message: "deve ser preenchido"
end
