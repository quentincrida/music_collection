require('pry')
require_relative('models/album')
require_relative('models/artist')

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new(
  {'name' => "Fleetwood Mac",}
)
artist1.save()

artist2 = Artist.new(
  {'name' => "The Waterboys"}
)
artist2.save()

album1 = Album.new(
  {'title' => "Tango in the Night",
   'genre' => "Pop",
   'artist_id' => artist1.id
 }
)
album1.save()

album2 = Album.new(
  {'title' => "Viva la Vida",
  'genre' => "Indy",
  'artist_id' => artist2.id
 }
)


album2.save()



binding.pry


nil
