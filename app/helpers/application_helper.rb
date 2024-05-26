module ApplicationHelper
  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end

  def display_avatar(user)
    name_in_array = user.name.split(' ')

    return "#{name_in_array[0][0].upcase}#{name_in_array[1][0].upcase}" if name_in_array.size > 1

    user.name[0].upcase
  end
end
