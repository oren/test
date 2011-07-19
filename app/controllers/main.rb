Test.controller do
  post '/' do
    unless params[:file] &&
           (tmpfile = params[:file][:tempfile]) &&
           (name = params[:file][:filename])
      @error = "No file selected"
    end
    STDERR.puts "Uploading file, original name #{name.inspect}"
    begin
      f =  File.open('local_filename.jpg', 'w')
      while blk = tmpfile.read(65536)
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
end
