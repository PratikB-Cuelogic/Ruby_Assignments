require_relative 'Validations'

class Login_Page

  def checkLogin      #LOGIN DETAILS
    user_data=Validations.readFile
    valid=false
    while(valid == false)
    print "\nEnter your registration_id: "
    @login_reg_id=gets.chomp
      if(!Validations.validateRegId(login_reg_id))
        next
      else
        valid=true
        regId=Integer(login_reg_id)
      end
    end
    print "Enter your password: "
    @login_password=gets.chomp
#    puts user_data.any? {|d| d[:reg_id].eql? regId}
    if(user_data.any? {|d|
      if (d[:reg_id].eql? regId)
        if (d[:password].eql? @login_password)
          return true
        else
          return false
        end
        return false
      end
    })
    return true
    else
      return false
    end
  end


  def getMenu     #DISPLAY LOGIN MENU
    puts "\nWelcome to Your Login\n1.Show Details\n2.Balance\n3.Withdraw\n4.Deposit\n5.Send Money\n6.Logout"
    print "Enter Your Choice:"
    ch=Integer(gets.chomp)
    ch
  end

  def showDetails     #DISPLAY DETAILS
    user_data=Validations.readFile
    regId=Integer(login_reg_id)
    puts "\n\nDetails"
    details=user_data.find { |d| d[:reg_id].eql? regId}
    details.each do |k,v|
      if (!k.eql? :balance)
        print k,': ',v,"\n"
      end
    end
    puts "\n"
  end


  def getBalance      #DISPLAY BALANCE
    user_data=Validations.readFile
    regId=Integer(login_reg_id)
    details=user_data.find { |d| d[:reg_id].eql? regId}
    print "\n:Balance:  ",details[:balance],"\n"
  end
  attr_reader :login_reg_id

end