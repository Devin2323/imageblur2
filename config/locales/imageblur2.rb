class Image
  def initialize(input)
    @data = input
  end

  def output_image
    @data.each do |row|
      puts row.join(" ")
    end
  end

  def blur
    tmp = Array.new(@data.size){[0]*@data[0].size}
    @data.each_with_index do |row, i|
      row.each_with_index do |element, j|
        if element == 1
          tmp[i][j] = 1
          tmp[i-1][j] = 1 if i-1 >= 0
          tmp[i+1][j] = 1 if i+1 < @data.size
          tmp[i][j-1] = 1 if j-1 >= 0
          tmp[i][j+1] = 1 if j+1 < row.size
        end
      end
    end
    @data = tmp
  end

end

image = Image.new([
    [0, 0, 0, 0],
    [0, 0, 0, 0],
    [0, 0, 0, 0],
    [0, 1, 0, 0],
    [0, 0, 0, 0],
    [0, 0, 0, 0]
])
puts "Original image"
image.output_image
image.blur
puts "Blurred image:"
image.output_image