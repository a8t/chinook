# Find the albums recorded by the artist Queen.
a = Artist.find_by("name = ?", "Queen")
Album.where("artist_id = ?", a.id)
#
# Count how many tracks belong to the media type "Protected MPEG-4 video file".
mp4 = MediaType.find_by("name = ?", "Protected MPEG-4 video file")
mp4tracks = Track.where("media_type_id = ?", mp4.id)
mp4tracks.count
#
# Find the genre with the name "Hip Hop/Rap".
rap = Genre.find_by("name = ?", "Hip Hop/Rap")
#
# Count how many tracks belong to the "Hip Hop/Rap" genre
rapsongs = Track.where("genre_id = ?", rap.id)
rapsongs.count
#
# Find the total amount of time required to listen to all the tracks in the database.
Track.all.pluck(:milliseconds).sum
#
# Find the highest price of any track that has the media type "MPEG audio file".
mp4tracks.order(unit_price: :desc).first[:unit_price]
#
# Find the name of the most expensive track that has the media type "MPEG audio file".
mp4tracks.order(unit_price: :desc).first[:name]
#
# Find the 2 oldest artists.
Artist.order(:created_at).first(2)
#
# Find the least expensive track that has the genre "Electronica/Dance".
Track.where(genre_id: electronica.id).order(unit_price: :asc).first
#
# Find all "MPEG autio file" tracks in the genre "Electronica/Dance".
Track.where(genre_id: electronica.id).where(media_type_id: 3)
