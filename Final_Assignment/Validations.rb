require 'csv'

module Validations

  def self.readFile       #READ FILE
    begin
      data= CSV.read("User_Details.csv",{encoding:"UTF-8",headers:true,header_converters: :symbol,converters: :all})
      user_data=data.map{|d| d.to_hash}
      return user_data
    end
  end

  def self.checkContent(user_data)    #CHECKING FILE CONTENT
    if user_data==[]
      return false
    else
      return true
    end
  end

  def self.checkReg_id()    #GENERATING REG_ID
      user_data=readFile
      reg_id=user_data.max_by{|d| d[:reg_id]}
      reg_id[:reg_id] += 1
    reg_id[:reg_id]
  end
  
  def self.checkName(name)     #VALIDATE NAME
   if /^[A-Za-z]+$/.match(name) == nil
     puts "\nName should contain characters only."
     return false
   else
     return true
   end
  end

  def self.checkEmail(email)     #VALIDATE EMAIL
    if  /^[a-z0-9]+(\.[_a-z0-9]+)*@[a-z0-9]+(\.[a-z0-9]+)*(\.[a-z]{2,3})$/.match(email) == nil
      return false
    else
      return true
    end
  end

  def self.checkContact(contact)    #CONTACT
    if  /^[0-9]{10}$/.match(contact) == nil
      puts "\nContact no should contain digits of length 10."
      return false
    else
      return true
    end
  end

  def self.checkMenuOption(ch)    #CHECK MENU OPTIONS
    if  /^[1,2,3]$/.match(ch) == nil
      puts "\nEnter your option between (1-3)."
      return false
    else
      return true
    end
  end

  def self.validateRegId(reg_id)    #VERIFIY REG_ID
    if  /^[0-9]{5}$/.match(reg_id) == nil
      puts "\nReg_id not proper."
      return false
    else
      return true
    end
  end

  def self.checkPassword(password,cPassword)    #VALIDATE PASSWORD
    if password == cPassword
        if  /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}$/.match(password) == nil
        puts "\nPassword length should be atleast 6 and should contain 1 Uppercase, 1 lowercase, 1 Digit"
        return false
      else
        return true
        end
    else
      puts "\nPassword length should be atleast 6 and should contain 1 Uppercase, 1 lowercase, 1 Digit"
      return false
    end
  end

  def self.update_File(balance,user)    #BALANCE UPDATE TO FILE
    contents = CSV.read( "User_Details.csv",{ headers: true, header_converters: :symbol})
    contents.each do |row|
      if(row[:reg_id].eql?user)
        row[:balance]=balance
      end
    end
    CSV.open("User_Details.csv", "wb",{ write_headers: true, headers: ["Name","Email","Contact","Password","Balance","Reg_id"], header_converters: :symbol}) do |csv|
      contents.each  do |row|
        csv << row
      end
    end
  end

  def self.update_money_transfer(user_balance,sender_balance,user,sender)   #TRANSFER DEATAILS UPDATE
    contents = CSV.read( "User_Details.csv",{ headers: true, header_converters: :symbol})
    contents.each do |row|
      puts row[:reg_id].class
      puts sender.class
      if(row[:reg_id].eql?user)
        #puts user
        row[:balance]=user_balance
      else
        if(row[:reg_id].eql?sender)
          puts sender
          row[:balance]=sender_balance
        end
      end
    end
    CSV.open("User_Details.csv", "wb",{ write_headers: true, headers: ["Name","Email","Contact","Password","Balance","Reg_id"], header_converters: :symbol}) do |csv|
      contents.each  do |row|
        csv << row
      end
    end
  end

end