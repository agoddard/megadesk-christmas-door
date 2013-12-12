#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
snowman1 = <<EOF
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

class Array
  def random
    if self.respond_to?(:choice)
      self.choice
    elsif self.respond_to?(:sample)
      self.sample
    else
      self.first
    end
  end
end


def riddles
  @riddles ||= File.open('riddles.txt').to_a
end


def get_riddle
  riddle = riddles.random
  question,answer = riddle.split('?')
  {:question => question, :answer => answer.lstrip}
end

def colorize(text, color_code)
  "\e[#{color_code}m#{text}\e[0m"
end

def red(text)
  colorize(text, 31)
end

def green(text)
colorize(text, 32)
end

puts green(snowman1)
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
    puts red(snowman1)
    sleep 0.3
    system('clear')
    puts green(snowman2)
    sleep 0.3
    system('clear')
    puts red(snowman1)
    sleep 0.3
    system('clear')
    puts green(snowman2)
    sleep 0.3
    system('clear')
    puts red(snowman1)
  else
    msg = "nope, #{attempt} is wrong, you should have said #{riddle[:answer]}"
    puts red(msg)
    insult = ["Son of a nutcracker","Grinch","Scrooge head","Cottonheaded ninny muggins"]
    `say "#{msg}. #{insult.random}"`
    system('clear')
    puts red(snowman1)
  end
end
