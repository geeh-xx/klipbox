class User < ActiveRecord::Base

  validates_presence_of :name, message: "deve ser preenchido"
  validates_presence_of :email, message: "deve ser preenchido"
  validates_presence_of :word, message: "deve ser preenchido"

end
