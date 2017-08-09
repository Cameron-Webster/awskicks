module ApplicationHelper

  def pin_exist?(sneak)
   if current_user && pin = current_user.pins.select {|pin| pin.sneaker == sneak}.last
    pin
  else
   false
  end
  end
end
