module UsersHelper
  def picture(user, width: 46)
    unless user.nil?
      if user.picture.nil?
        link_to(image_tag('default-user.png', width: width, alt: "Default user profile picture"), user)
      else
        link_to(image_tag(user.picture, width: width, alt: "User profile picture", class: "rounded-circle"), user)
      end
    end
  end
end
