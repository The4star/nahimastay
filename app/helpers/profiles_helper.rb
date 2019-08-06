module ProfilesHelper
    def increase_karma(coins)
        update_attributes(:karma_coins => karma_coins += coins)
    end
  
    def decrease_karma(coins)
        update_attributes(:karma_coins => karma_coins -= coins)
    end
end
