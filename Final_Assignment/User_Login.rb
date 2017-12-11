module User_Login
  def self.user_menu_display      #LOGIN_MENU
    logPage=Login_Page.new
    transactionPage=Transaction_Page.new
    if(logPage.checkLogin)
      option=logPage.getMenu
      while option<=6
        logPage.showDetails if option==1    #SHOW USER DETAILS

        logPage.getBalance if option==2     #SHOW BALANCE

        transactionPage.withdraw_transaction(logPage.login_reg_id) if option==3   #WITHDRAW

        transactionPage.deposit_transaction(logPage.login_reg_id) if option==4    #DEPOSIT

        transactionPage.transfer_transaction(logPage.login_reg_id) if option==5   #TRANSFER

        user_Option(Integer(Home_Page.new.welcome)) if option==6     #LOGOUT

        option=logPage.getMenu
      end
    end
  end

end
