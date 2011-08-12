require 'rubygems'
gem 'minitest'
require 'minitest/autorun'
require 'rack/test'
require '../config/boot.rb'

class TestManualBadgeType < MiniTest::Unit::TestCase
  include Rack::Test::Methods

  FILE2UPLOAD  = "/Users/jimbarcelona/pink-pony.jpg"
  UPLOADEDFILE = "/Users/jimbarcelona/repos/oren/forks/test/test/pink-pony.jpg"

  def app() Test end

  def setup
    if File.exist?(UPLOADEDFILE)
      File.delete(UPLOADEDFILE)
    end
  end

  def test_opload
    post '/', 'file' => Rack::Test::UploadedFile.new(FILE2UPLOAD, 'image/jpeg')

    assert_equal last_response.status, 201
  end

  def test_carrierwave_201
    post '/carrierwave', 'file' => Rack::Test::UploadedFile.new(FILE2UPLOAD, 'image/jpeg')

    assert_equal last_response.status, 201
  end

  def test_carrierwave_file_exist
    post '/carrierwave', 'file' => Rack::Test::UploadedFile.new(FILE2UPLOAD, 'image/jpeg')
    assert_equal last_response.status, 201
  end
end

