# Этот код необходим только при использовании русских букв на windows
if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

# Подключаем встроенную в RUBY библиотеку с модулем Digest
require "digest"

phrase = ""

loop do
  puts "Введите слово или фразу для шифрования. В случае ввода"

  puts "exit программа завершится"

  phrase = STDIN.gets.encode("UTF-8").chomp

  if phrase == "exit".downcase
    puts "Программа завершена"

    break
  else
    puts "Каким способом зашифровать текст:"

    puts  "1. MD5;"

    puts  "2. SHA1"

    puts


    encryption = 0

    while !encryption.between?(1, 2) do
      puts "Введите 1 или 2"

      encryption = STDIN.gets.to_i
    end

    encrypted =
      if encryption == 1
        Digest::MD5.hexdigest('phrase')

      elsif encryption == 2
        Digest::SHA1.hexdigest('phrase')
      end
    puts "Вот что получилось:"

    puts encrypted
  end
end
