def greeting

  i = 1

  ARGV.each do |arg|
      puts "#{ARGV[0]} #{ARGV[i]}"
      i += 1
  end
end

greeting
