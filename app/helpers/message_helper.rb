module MessageHelper

  def which_user? id
    return User.find_by(id: id)
  end
end
