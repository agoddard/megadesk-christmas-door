#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

@won = "You Won! Please open the door to get your treat."

@snowman1 = <<EOF

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
           / /s/   (_)                            
          ///s/     _        :  *                  
    *    ///s/     (_)      .'          *          
        // |/`.           .'                       
     __//    .-''-------'`-.                       
      /|\  .'        _       `.      *             
     / | \:         (_)        :                   
         :          _          :                   
         :         (_)         :                   
  *      :          _          :     *             
         :         (_)         :                   
          :                   :                    
  ""'"""'""`.               .'"'"""'""'""          
 MegaDesk™   `-._       _.-'                       
                 `"""""'   
                                  
EOF

@snowman2 = <<EOF                                                                                        
                                                                                         
                .-------.                  
                | #     |                 
      *         |_______|    *            
               _|=======|_        *       
              [___________]            *   
   *           .'       `.                
              :   @   @   :  *             
              :     <     :                
     \~_s~-~s~s`._`...'_.'                
      `--~-~-~~s~/`"""'  `-.         *      
  *         /'/s/   _       `\\            
           / /s/   (_)        \\           
          ///s/     _        : \\         
         ///s/     (_)      .'  \\        
    *   // |/`.           .'     \\       * 
     __//    .-''-------'`-.      \\_      
      /|\  .'        _       `.      *     
     / | \:         (_)        :           
         :          _          :           
         :         (_)         :           
         :          _          :           
  *      :         (_)         :     *     
          :                   :            
  ""'"""'""`.               .'"'"""'""'""  
 MegaDesk™   `-._       _.-'               
                 `"""""'   
                 #@won                
EOF


@snowman3 = <<EOF                                                                                        
                                                                                         
                .-------.                  
                | #     |                 
                |_______|                
      *        _|=======|_   *            
              [___________]       *        
               .'       `.             *   
   *          :   @   @   :               
              :     <     :  *              
     \~_s~-~s~s`._`...'_.'                
      `--~-~-~~s~/`"""'  `-.               
            /'/s/   _       `\\      *      
  *        / /s/   (_)        \\           
          ///s/     _        : \\         
         ///s/     (_)      .'  \\        
        // |/`.           .'     \\        
    *__//    .-''-------'`-.      \\_     * 
      /|\  .'        _       `.           
     / | \:         (_)        :     *      
         :          _          :           
         :         (_)         :           
         :          _          :           
         :         (_)         :          
  *       :                   :      *      
  ""'"""'""`.               .'"'"""'""'""  
 MegaDesk™   `-._       _.-'               
                 `"""""'   
                 #@won                
EOF

@snowman4 = <<EOF                                                                                        
                                                                                         
                .-------.                  
                | #     |                 
                |_______|                
               _|=======|_               
      *       [___________]  *             
               .'       `.       | /        
              :   @   @   :     \|/_   *   
   *          :     <     :     //           
     \~_s~-~s~s`._`...'_.'   * //           
      `--~-~-~~s~/`"""'  `-.  //             
            /'/s/   _       `//            
           / /s/   (_)               *     
  *       ///s/     _        :          
         ///s/     (_)      .'         
        // |/`.           .'             
     __//    .-''-------'`-.            
    * /|\  .'        _       `.           *
     / | \:         (_)        :           
         :          _          :     *     
         :         (_)         :           
         :          _          :           
         :         (_)         :          
          :                   :            
  ""'"""'""`.               .'"'"""'""'""  
 MegaDesk™   `-._       _.-'               
                 `"""""'   
                 #@won                
EOF

@snowman5 = <<EOF                                                                                        
                                                                                         
                .-------.                  
                | #     |                 
                |_______|                
               _|=======|_               
              [___________]               
      *        .'       `.   *   | /        
              :   @   @   :     \|/_      
              :     <     :     //     *     
   * \~_s~-~s~s`._`...'_.'     //           
      `--~-~-~~s~/`"""'  `-. *//             
            /'/s/   _       `//            
           / /s/   (_)                    
          ///s/     _        :       *   
  *      ///s/     (_)      .'         
        // |/`.           .'             
     __//    .-''-------'`-.            
      /|\  .'        _       `.           
    */ | \:         (_)        :          * 
         :          _          :          
         :         (_)         :     *     
         :          _          :           
         :         (_)         :          
          :                   :            
  ""'"""'""`.               .'"'"""'""'""  
 MegaDesk™   `-._       _.-'               
                 `"""""'   
                 #@won                
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

def white(text)
  colorize(text, 37)
end

def green(text)
colorize(text, 32)
end

def animate(duration)
  duration.times do
    system('clear')
    puts green(@snowman1)
    sleep 0.1
    system('clear')
    puts red(@snowman2)
    sleep 0.1
    system('clear')
    puts green(@snowman3)
    sleep 0.1
    system('clear')
    puts red(@snowman4)
    sleep 0.1
    system('clear')
    puts green(@snowman5)
    sleep 0.1
    system('clear')
    puts white(@snowman1)
  end
end


puts white(@snowman1)
while true do
  riddle = get_riddle
  puts green("#{riddle[:question]}?")
  puts "Answer: "
  attempt = gets.chomp
  if attempt.downcase.gsub(' ','') == riddle[:answer].downcase.chomp.gsub(' ','')
    puts green("#{attempt} is right!")
    puts white(@won)
    `say -v fiona "You Won! Please open the door to get your treat."`
    animate 20
  else
    msg = "nope, #{attempt} is wrong, you should have said #{riddle[:answer]}"
    puts red(msg)
    insult = ["Son of a nutcracker","Grinch","Scrooge head","Cottonheaded ninny muggins"]
    `say "#{msg}. #{insult.random}"`
    system('clear')
    puts white(@snowman1)
  end
end
