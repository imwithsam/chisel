class OutputWriter
  def self.write(output, file_name)
    file = File.new(file_name, "w")
    file.write(output)
  end
end
