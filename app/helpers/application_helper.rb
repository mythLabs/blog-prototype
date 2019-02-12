module ApplicationHelper

    def gravitar_for(user,options = {size:80})
        gravitar_id = Digest::MD5::hexdigest(user&.email&.downcase)
        size = options[:size]
        gravital_url = "https://www.gravatar.com/avatar/#{gravitar_id}?s=#{size}"
        image_tag(gravital_url, alt:user.username, class: "img-circle" )
    end

end
