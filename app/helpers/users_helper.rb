module UsersHelper


  def profile_pic_for(user)
    url = "https://cdnb.artstation.com/p/assets/images/images/007/454/531/large/chun-lo-mask-lq2.jpg?1506266125"
    image_tag(url, alt: user.name, class: "profile_pic")
  end

  
end
