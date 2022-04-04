require "csv"

puts "1.(新規でメモを作成) 2.(既存のメモ編集する)"
select_number = gets.chomp.to_i

if select_number == 1
   
  puts "拡張子を除いたファイル名を入力してください。"
  file_name = gets.chomp
   
  puts "メモしたい内容を記入してください"
  puts "終了後、Ctrl + D　を押します。"
  memo_input = STDIN.read
   
  CSV.open("#{file_name}.csv","w") do |memo|
     
    memo << ["#{memo_input}"]
    
  end
  
elsif select_number == 2
    
  puts "編集したいファイル名を入力してください。"
  file_name = gets.chomp 
  
  puts "編集内容を記入してください。"
  puts "終了後、Ctrl + D　を押します。"
  memo_input = STDIN.read
  
  CSV.open("#{file_name}.csv", "a") do |memo|
      
    memo << ["#{memo_input}"]
  
  end
  
else
  
  puts "半角の1もしくは2を入力して下さい"

end