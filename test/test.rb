require 'rubygems'
gem 'minitest'
require 'minitest/autorun'
require 'rack/test'
require '../config/boot.rb'

class TestManualBadgeType < MiniTest::Unit::TestCase
  include Rack::Test::Methods

  def app() Test end

  def test_opload
    post '/', 'file' => Rack::Test::UploadedFile.new('/home/oren/repos/respawnproject/respawnsv00/badge_service/test/controllers/pink-pony.jpg', 'image/jpeg')
    #Dir['files/*'].should include('files/test_file.png')
    assert_equal last_response.status, 201
    #assert_equal last_response.body, 201
  end

end

