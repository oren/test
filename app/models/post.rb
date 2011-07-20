class PostUploader < CarrierWave::Uploader::Base
  storage :file
end

class Post < Sequel::Model


  # mount_uploader :image, class Uploader < CarrierWave::Uploader::Base
  mount_uploader :image, PostUploader
  # mount_uploader :image, class Uploader < CarrierWave::Sequel
  #  storage :file
#     def store_dir
#       "tmp"
#     end
  #end



end
