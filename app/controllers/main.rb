Test.controller do

  post '/' do
    unless params[:file] &&
           (tmpfile = params[:file][:tempfile]) &&
           (name = params[:file][:filename])
      @error = "No file selected"
    end
    STDERR.puts "Uploading file, original name #{name.inspect}"
    begin
      
      f =  File.open('local_filename.jpg', 'wb')
      while blk = tmpfile.read(65536)
        # Mac OS X has an Encoding issue and so we use the .encode method for OS X
        blk.encode("UTF-8", :invalid => :replace, :undef => :replace, :replace => "?")
        # here you would write it to its final location
        f.write(blk)
      end
      f.close
      "Upload complete"
      201
    rescue => ex
      puts ex.inspect
      400
    end

  end

  post '/carrierwave' do
    @post = Post.new
    @post.name = 'foo'
    @post.body = 'barbazquux'
    puts params.inspect
    puts params[:file][:tempfile].inspect
    @post.image = params[:file][:filename]
    @post.image.store!(params[:file])
    @post.save
    201
  end

end
