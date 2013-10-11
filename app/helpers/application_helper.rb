module ApplicationHelper

  def flash_notifications
    r = ''
    flash.each do |name, msg|
      r << content_tag(:div, flash_notices(msg), id: name)
    end
    raw r
  end

  private

  def flash_notices notice
    notice = [notice]  unless notice.class == Array
    raw notice.map{ |a| content_tag(:span, a) }.join
  end

end
