module TracksHelper

	def current_track(track)
		'class = current' if track.id.to_s == params[:track_id]
	end
end
