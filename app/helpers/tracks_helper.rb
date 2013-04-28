module TracksHelper

	def current_track(track)
		'class = current' if track.id.to_s == params[:track_id]
	end

	def json_parser(json)
		ActiveSupport::JSON.decode(json)
	end
end
