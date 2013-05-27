module UsersHelper

	def gravatar_for(user, options = {size:100})
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		size = options[:size]
	    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
	    image_tag(gravatar_url, alt: user.username, size: "#{size}x#{size}", class: "gravatar")
	end

	def list_timing(obj)
		s=""
		obj.each_with_index do |tempo,i|
			s+= (i+1).to_s + " - "+tempo.initial_time.to_s
		end
		s
	end
end
