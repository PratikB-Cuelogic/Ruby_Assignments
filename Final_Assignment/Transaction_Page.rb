require_relative 'User_Login'
require_relative 'Validations'

class Transaction_Page

  def withdraw_transaction(user)      #WITHDRAW MONEY
    user_data=Validations.readFile
    regId=Integer(user)
    details=user_data.find { |d| d[:reg_id].eql? regId}
    local_balance=details[:balance]
    if local_balance==0
      puts "You dont have Sufficient amount to Withdraw"
    else
      valid=false
      while(valid==false)
        puts "How much amount you have to withdraw"
        withdraw_amount=Integer(gets.chomp)
        if(withdraw_amount>0)
          valid=true
        end
      end

      if withdraw_amount> local_balance
        puts "You have less amount to withdraw than you request"
      else
        local_balance=local_balance-withdraw_amount
        Validations.update_File(local_balance,user)
        puts "Money has been Withdraw Successfully"
      end
    end
  end


  def deposit_transaction(user)   #DEPOSIT MONEY
    user_data=Validations.readFile
    regId=Integer(user)
    details=user_data.find { |d| d[:reg_id].eql? regId}
    local_balance=details[:balance]
    valid=false
      while(valid==false)
        puts "How much amount you have to deposit"
        deposit_amount=Integer(gets.chomp)
        if(deposit_amount>0)
          valid=true
        end
      end
      local_balance=local_balance+deposit_amount
      Validations.update_File(local_balance,user)
      puts "Money has been Deposited Successfully"
  end

  def transfer_transaction(user)    #SEND MONEY
    user_data=Validations.readFile
    regId=Integer(user)
    user_details=user_data.find { |d| d[:reg_id].eql? regId}
    user_balance=user_details[:balance]
    if user_balance==0
      puts "You dont have Sufficient amount to Transfer"
    else
      valid=false
      while(valid == false)
        puts "Reg_id to whom you have to transfer"
        receiver=gets.chomp
        if(!Validations.validateRegId(receiver))
          puts "Enter Reg_id to whom you have to transfer properly"
          next
        else
          rec=Integer(receiver)
          sender_details=user_data.find { |d| d[:reg_id].eql? rec}
          if(user_data.any? {|d|  (d[:reg_id].eql? rec)})
            valid=true
          else
            puts "Invalid Reg_id"
            next
          end
        end
      end

      if(valid==true)
        valid=false
        while(valid==false)
          puts "How much amount you have to transfer"
          withdraw_amount=Integer(gets.chomp)
          if(withdraw_amount>0)
            valid=true
          end
        end
        if withdraw_amount> user_balance
          puts "You have less amount to transfer than you request"
        else
          user_balance=user_balance-withdraw_amount
          sender_balance=sender_details[:balance]+withdraw_amount
          #puts sender_balance
          Validations.update_money_transfer(user_balance,sender_balance,user,receiver)
          puts "Money has been Transferred Successfully"
        end
      end
    end
  end

end