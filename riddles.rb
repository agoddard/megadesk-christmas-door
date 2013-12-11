#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
fucking_snowman = <<EOF
                .-------.
      *         | #     |    *
                |_______|         *
               _|=======|_             *
   *          [___________]
               .'       `.   *   | /  
              :   @   @   :     \|/_
              :     <     :     //   
     \~_s~-~s~s`._`...'_.'     //      *
  *   `--~-~-~~s~/`"""'  `-.  //
            /'/s/   _       `//
           / /s/   (_)       /
          ///s/     _        :  *
    *    ///s/     (_)      .'          *
        // |/`.           .'
     __//    .-''-------'`-.
      /|\  .'       _       `.      *
     / | \:        (_)        :
         :          _          :
         :         (_)         :
  *      :          _          :     *
         :         (_)         :
          :                   :
  ""'"""'""`.               .'"'"""'""'""
 MegaDesk™   `-._       _.-'
                 `"""""'
EOF

snowman2 = <<EOF
                .-------.
      *         | #     |    *
                |_______|         *
               _|=======|_             *
   *          [___________]
               .'       `.   *   
              :   @   @   :     
              :     <     :     
     \~_s~-~s~s`._`...'_.'           *
  *   `--~-~-~~s~/`"""'  `-.  
            /'/s/   _       `\\
           / /s/   (_)       /\\
          ///s/     _        : \\*
    *    ///s/     (_)      .'  \\        *
        // |/`.           .'     \\
     __//    .-''-------'`-.      \\_
      /|\  .'       _       `.      *
     / | \:        (_)        :
         :          _          :
         :         (_)         :
  *      :          _          :     *
         :         (_)         :
          :                   :
  ""'"""'""`.               .'"'"""'""'""
 MegaDesk™   `-._       _.-'
                 `"""""'
EOF

def get_riddle
  riddle = File.open('riddles.txt').to_a.sample
  question,answer = riddle.split('?')
  {:question => question, :answer => answer.lstrip}
end

def colorize(text, color_code)
  "\e[#{color_code}m#{text}\e[0m"
end

def red(text); colorize(text, 31); end
def green(text); colorize(text, 32); end

puts green(fucking_snowman)
while true do
  riddle = get_riddle
  puts green("#{riddle[:question]}?")
  puts "Answer: "
  attempt = gets.chomp
  if attempt.downcase.gsub(' ','') == riddle[:answer].downcase.chomp.gsub(' ','')
    puts green("#{attempt} is right!")
    `say "oh yeah"`
    sleep 0.3
    system('clear')
    puts red(fucking_snowman)
    sleep 0.3
    system('clear')
    puts green(snowman2)
    sleep 0.3
    system('clear')
    puts red(fucking_snowman)
    sleep 0.3
    system('clear')
    puts green(snowman2)
    sleep 0.3
    system('clear')
    puts red(fucking_snowman)
  else
    msg = "nope, #{attempt} is wrong, you should have said #{riddle[:answer]}"
    puts red(msg)
    insult = %w(idiot fool jerk douchebag)
    `say "#{msg}. #{insult.sample}"`
    system('clear')
    puts red(fucking_snowman)
  end
end
