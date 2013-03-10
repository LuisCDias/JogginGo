module PointsHelper

	def waypoints_to_addresses(waypoints)	
		wayp = Array.new
		if !waypoints.nil?
			waypoints.each do |way|
				wayp << way.address
			end
		end	
		wayp
	end
end
