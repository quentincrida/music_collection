require('minitest/autorun')
require('minitest/reporters')
require_relative('../models/album')

MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

class MusicTest < MiniTest::Test


  def test_can_create_new_album
    album_details = {  {'title' => "Tango in the Night",
       'genre' => "Pop",
      }
  new_album = Album.new(album_details)
  assert_equal('Tango in the Night',new_album.title)
  end

end
