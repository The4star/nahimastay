module ApplicationHelper
    def city_select()
        options = [
            ["Melbourne"],
            ["Sydney"], 
            ["Brisbane"],
            ["Hobart"],
            ["Perth"],
            ["Adelaide"],
            ["Darwin"],
            ["Auckland"],
            ["Wellington"],
            ["Christchurch"],
            ["Queenstown"],
            ["London"],
            ["Bristol"],
            ["Leeds"],
            ["Manchester"],
            ["Liverpool"],
            ["Glasgow"],
            ["Edinburgh"],
            ["Dundee"],
            ["Belfast"],
        ]
        return options
    end

    def country_select()
        options = [
            ["Australia"],
            ["United Kingdom"], 
            ["New Zealand"]
        ]
        return options
    end

    def accomtype_select()
        options = []
        Accomtype.all.entries.each do |accom|
            options << [ accom.name, accom.id]
        end
        # raise
        return options
    end

    def convert_float_to_1sf(float)
        if float != 0
            remainder = ((float * 100) % 10)
            if remainder < 5
                new_num = (float * 100) - remainder
            else 
                new_num = ((float * 100) - remainder) + 10
            end

            new_num = new_num / 100
        else
            new_num = 0
        end

        return new_num
    end

    def profile_complete(profile)
        profile.first_name && profile.last_name && profile.bio && profile.uploaded_image.attached?
    end    
end