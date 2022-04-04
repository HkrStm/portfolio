#あっち向いてほいパート

def acchi_show
  puts "あなた： #{$acchi_input}"
  puts "相手： #{$acchi_opponent}"
  puts "---------------"
end

def start_acchi
  puts "あっち向いて..."
  
  if @judge == true
    puts "1.↑ 2.→ 3.↓ 4.←　(指を差す方向を半角数字で入力して下さい)"
  else
    puts "1.↑ 2.→ 3.↓ 4.←　(向く方向を半角数字で入力して下さい)"
  end
  
  $acchi_input = gets.chomp.to_i
  
  puts "ほい！"
  puts "---------------"
  
  $acchi_opponent = Random.rand(1..4)
  
  case $acchi_input
  when 1
    $acchi_input = "↑"
  when 2
    $acchi_input = "→"
  when 3
    $acchi_input = "↓"
  when 4
    $acchi_input = "←"
  end
  
  case $acchi_opponent
  when 1
    $acchi_opponent = "↑"
  when 2
    $acchi_opponent = "→"
  when 3
    $acchi_opponent = "↓"
  when 4
    $acchi_opponent = "←"
  end
  
  if @judge == true
    if $acchi_input == $acchi_opponent
      acchi_show
      puts "あなたの勝ちです"
      puts "もう一度戦いますか？"
      puts "1.はい 2.いいえ"
      select = gets.chomp.to_i
      puts "---------------"
      if select == 1
        start_janken
      end
    elsif $acchi_input != $acchi_opponent
      acchi_show
      start_janken
    end
  else
    if $acchi_input == $acchi_opponent
      acchi_show
      puts "あなたの負けです"
      puts "もう一度戦いますか？"
      puts "1.はい 2.いいえ"
      select = gets.chomp.to_i
      puts "---------------"
      if select == 1
        start_janken
      end
    elsif $acchi_input != $acchi_opponent
      acchi_show
      start_janken
    end
  end
end

#じゃんけんパート

def show
  puts "あなた： #{$janken_input}"
  puts "相手： #{$opponent}"
  puts "---------------"
end

def victory
  show
  puts "じゃんけんに勝ちました"
  @judge = true
  start_acchi
end

def draw
  show
  puts "あいこで..."
  puts "1.グー 2.チョキ 3.パー　(半角数字を入力して下さい)"
  $janken_input = gets.chomp.to_i
  puts "しょ！"
  puts "---------------"
  continuation_janken
end

def lose
  show
  puts "じゃんけんに負けました"
  @judge = false
  start_acchi
end

def start_janken
  puts "じゃんけん..."
  puts "1.グー 2.チョキ 3.パー　(半角数字を入力して下さい)"
  
  $janken_input = gets.chomp.to_i
  
  puts "ポン！"
  puts "---------------"
  continuation_janken
end

def continuation_janken
  $opponent = Random.rand(1..3)
  
  case $janken_input
  when 1
    $janken_input = "グー"
    case $opponent
    when 1
      $opponent = "グー"
      draw
    when 2
      $opponent = "チョキ"
      victory
    when 3
      $opponent = "パー"
      lose
    end
    
  when 2
    $janken_input = "チョキ"
    case $opponent
    when 1
      $opponent = "グー"
      lose
    when 2
      $opponent = "チョキ"
      draw
    when 3
      $opponent = "パー"
      victory
    end
    
  when 3
    $janken_input = "パー"
    case $opponent
    when 1
      $opponent = "グー"
      victory
    when 2
      $opponent = "チョキ"
      lose
    when 3
      $opponent = "パー"
      draw
    end
  end
end

start_janken
