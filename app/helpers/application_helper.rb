module ApplicationHelper

  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "Ticketee").join(" - ")
      end
    end
  end


#This try method tries a
#method on an object, and if that method doesn't exist (as it wouldn't if
#current_user were nil ), then it gives up and returns nil , rather than raising
#a NoMethodError exception.

  def admins_only(&block)
    block.call if current_user.try(:admin?)
  end

end
