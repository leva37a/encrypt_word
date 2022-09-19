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
#Запускаем цикл до тех пор, пока пользователь не введет "exit"
phrase = ""
loop do
  #Запрашиваем у пользователя фразу для шифрования и способ
  puts "Введите слово или фразу для шифрования. В случае ввода"
  puts "exit программа завершится"
  phrase = STDIN.gets.encode("UTF-8").chomp
  #Если пользователь ввел exit то завершаем программу
  if phrase == "exit".downcase
    abort "Программа завершена"
  else
    puts "Каким способом зашифровать текст:"
puts  "1. MD5;"
puts  "2. SHA1"
puts
    encryption = STDIN.gets.encode("UTF-8").chomp
    #Если пользователь введет что-то кроме 1 или 2, то запускаем цикл
    # до тех пор пока он не введет 1 или 2
    if encryption != "1" && encryption != "2"
      while encryption != "1" && encryption != "2" do
      puts "Введите 1 или 2"
      encryption = STDIN.gets.encode("UTF-8").chomp
      end
      #Если пользователь ввел 1 , то шифруем фразу в кодировке MD5
      # Если ввел 2, то в кодировке SHA1
      if encryption == "1"
        puts "Вот что получилось:"
        encrypted =  Digest::MD5.hexdigest('phrase')
        puts encrypted
        elsif encryption == "2"
          puts "Вот что получилось:"
          encrypted =  Digest::SHA1.hexdigest('phrase')
          puts encrypted
          end
    else
      #Если пользователь сразу ввел 1 или 2 то кодируем фразу в соответствии с запросом
      if encryption == "1"
         puts "Вот что получилось:"
         encrypted =  Digest::MD5.hexdigest('phrase')
         puts encrypted
         elsif encryption == "2"
         puts "Вот что получилось:"
         encrypted =  Digest::SHA1.hexdigest('phrase')
         puts encrypted
   end
  end
  end
  end
