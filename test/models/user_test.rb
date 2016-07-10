require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def test_users

    user = User.new(:name => "Rangel", :email => "gmail", :word => "Caixa")
    msg = "Usuario não salvo"+ "Erros: ${user.errors.inspect}"
    assert user.save, msg

    user_copy = User.find(user.id)

    assert_equal user.name,  user_copy.name

    User.delete(user)

  end

end
