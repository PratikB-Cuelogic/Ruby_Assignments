require_relative 'Validations'
require 'csv'
class Registration_Page


  def register      #REGISTRATION
      valid=false

     # while(valid== false)
        valid=false
        while(valid == false)
          print "2Enter your firstname: "
          @username=gets.chomp
          if (!Validations.checkName(@username))
            next
          else
          valid=true
          end
        end

        valid=false
        while(valid == false)
          print "Enter your email-id(active id): "
          @email_id=gets.chomp
          if (!Validations.checkEmail(@email_id))
            next
          else
            valid=true
          end
        end

        valid=false
        while(valid == false)
            print "Enter your Contact_no"
            @contact= gets.chomp
              if (!Validations.checkContact(@contact))
                next
              else
                valid=true
              end
        end

        valid=false
        while(valid == false)
          print "Enter your Password"
          @password= gets.chomp
          print "Enter your Confirm Password"
          @cPassword= gets.chomp
          if (!Validations.checkPassword(@password,@cPassword))
            next
          else
            valid=true
          end
        end
      return true
  end

  def writeDetails      #WRITE DETAILS TO FILE(IF NOT EXIST)
        user_data=Validations.readFile
        if Validations.checkContent(user_data)==true

            if(user_data.find{|d| d[:email].eql? @email_id})
              puts "\nUser Already exist\n"
              return false
            else
              reg_id=Validations.checkReg_id()
              CSV.open("User_Details.csv", "ab") do |csv|
                csv << [@username,@email_id,@contact,@password,0,reg_id]
              end
              puts "\nRegistration Successfully Done\n"
              print "\nYour Registration ID: ",reg_id,"\n"
              return true
            end
        else
             reg_id=10000
             CSV.open("User_Details.csv", "ab") do |csv|
                 csv << [@username,@email_id,@contact,@password,0,reg_id]
                 return true
             end
        end
  end


end