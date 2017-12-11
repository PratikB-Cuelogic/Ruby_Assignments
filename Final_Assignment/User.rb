require_relative 'Home_Page'
require_relative 'Registration_Page'
require_relative 'Login_Page'
require_relative 'User_Login'
require_relative 'Transaction_Page'

def user_Option(ch)     #MENU PAGE

    while ch<=3
        if ch==1
          User_Login.user_menu_display    #LOGIN
          next
        end
        if ch==2
          regPage=Registration_Page.new   #REGISTRATION
          if(regPage.register)
            regPage.writeDetails
               ch=Home_Page.new.welcome
            ch=Integer(ch)
               next
          else
            ch=Home_Page.new.welcome
            ch=Integer(ch)
            next
          end
        end

        if ch==3
          abort("\nThanks for Coming....!\n")
        end
    end



end
ch=Home_Page.new.welcome

valid=false
    while(valid == false)
      if(!Validations.checkMenuOption(ch))
        ch=Home_Page.new.welcome
      next
      else
        valid=true
        user_Option(Integer(ch))
      end
end