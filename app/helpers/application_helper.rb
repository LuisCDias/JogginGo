module ApplicationHelper

	def titulo(titulo)
		if titulo.nil?
			titulo="JogginGo! Your jogging track"
		else
			titulo
		end
	end

	def div_with_errors(field,user)
		if user.errors[field].any?
			content = content_tag(:div,field_errors(field, user), class: "alert alert-error input-block-level error_field")
		end
	end
	
	private
	
		def field_errors(field, user)
			@content = ""
			case field
			when :username
			if user.errors[:username].any?
				@content = "Username "
				field_errors_messages(user, :username)
			end
			when :name
				if user.errors[:name].any?
					@content = "Name "
					field_errors_messages(user, :name)
				end
			when :email
				if user.errors[:email].any?
					@content = "Email "
					field_errors_messages(user, :email)
				end
			when :password
				if user.errors[:password].any?
					@content = "Password "
					field_errors_messages(user, :password)
				end
			when :password_confirmation
				if user.errors[:password_confirmation].any?
					@content = "Confirmation "
					field_errors_messages(user, :password_confirmation)
				end
			else
				field.to_s
			end
			@content
		end

		def field_errors_messages(user, field)
			user.errors[field].each_with_index do |n,i|
				@content += n
				@content += " and " if user.errors[field].count > 1 && user.errors[field].count != i+1
			end
			@content
		end
end
