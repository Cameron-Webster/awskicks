module ApplicationHelper

  def pin_exist?(sneak)
   if current_user && pin = current_user.pins.select {|pin| pin.sneaker == sneak}.last
    pin
  else
   false
  end
  end

  def profile_pic
    if (pic = current_user.profile_pic)
      pic
    else
    'profile_pic_30px.png'
  end
  end

  def home_badges #Homepage Notifications
    all = current_user.homepage_notifications
    newest = all.last(10)
    count = all.where(read: false).count
    return {newest: newest, count: count}
  end

end
