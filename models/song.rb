class Song
	attr_accessor :artist_name, :song_name, :preview_url, :explicit

	def initialize(artist)
		@artist = RSpotify::Artist.search(artist).first
		self.get_attributes
	end

	def get_attributes
		@artist_name = @artist.name
		@track = @artist.top_tracks(:US).sample
		@song_name = @track.name
		@preview_url = @track.preview_url
		@explicit = @track.explicit
	end
end