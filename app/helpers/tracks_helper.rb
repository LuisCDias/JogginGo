module TracksHelper

	def current_track(track)
		'class = current' if track.id.to_s == params[:track_id]
	end

	def json_parser(json)
		ActiveSupport::JSON.decode(json)
	end

	def json_array_parser(json)
		ActiveSupport::JSON.parse(json)
	end
end
