module UsersHelper
  def picture(user, width: 46)
    if user.picture
      link_to(image_tag(user.picture, width: width, alt: 'User profile picture', class: 'rounded-circle'), user)
    else
      link_to(image_tag('default-user.png', width: width, alt: 'Default user profile picture', class: 'rounded-circle'), user)
    end
  end
end
