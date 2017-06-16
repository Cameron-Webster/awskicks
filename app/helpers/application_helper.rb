module ApplicationHelper

  def pin_exist?(sneak)
   if pin = current_user.pins.detect {|pin| pin.sneaker == sneak}
    pin
  else
   false
  end
  end
end
