puts "現在コイン：100"
$your_coin = 100

def reels(num1, num2, num3, num4=" ", num5=" ", num6=" ", num7=" ", num8=" ", num9=" ")
  puts "|#{ num1 }|#{ num4 }|#{ num7 }|"
  puts "|#{ num2 }|#{ num5 }|#{ num8 }|"
  puts "|#{ num3 }|#{ num6 }|#{ num9 }|"
end

def hit(first_number, second_number, third_number)
  if (first_number == second_number && second_number == third_number) #３つ揃った場合
    won_coin = $bet_coin * 20
    $your_coin += won_coin
    puts "数字が3つ揃ったので、#{ won_coin }コイン獲得しました"
  end

  if first_number == second_number #２つ揃った場合
    won_coin = $bet_coin * 3
    $your_coin += won_coin
    puts "数字が2つ揃ったので、#{ won_coin }コイン獲得しました"
  end
end

def start_slot
  while $your_coin > 0
    puts "賭ける金額を決めて下さい"
    $bet_coin = gets.chomp.to_i
    puts "---------------"

    if $bet_coin < 1 || $your_coin < $bet_coin
      puts "賭け金が不正です"
      start_slot
    end

    $your_coin -= $bet_coin
    puts "#{ $bet_coin }コイン賭けました　現在コイン：#{ $your_coin }"
    puts "エンターキーでリールが止まります"
    puts "---------------"

    gets
    reels(num1 = Random.rand(1..7), num2 = Random.rand(1..7), num3 = Random.rand(1..7))

    gets
    reels(num1, num2, num3, num4 = Random.rand(1..7), num5 = Random.rand(1..7), num6 = Random.rand(1..7))

    gets
    reels(num1, num2, num3, num4, num5, num6, num7 = Random.rand(1..7), num8 = Random.rand(1..7), num9 = Random.rand(1..7))

    hit(num1, num4, num7)
    hit(num2, num5, num8)
    hit(num3, num6, num9)
    hit(num1, num5, num9)
    hit(num3, num5, num7)

    puts "ゲームを続けますか？ 現在コイン：#{ $your_coin }"
    puts "1.続ける 2.やめる"
    select_continue = gets.chomp.to_i
    puts "---------------"
    if select_continue == 2
      return
    end
  end
end

start_slot
