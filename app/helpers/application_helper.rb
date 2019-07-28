module ApplicationHelper
    def city_select()
        options = [
            ["Melbourne, Australia"],
            ["Sydney, Australia"], 
            ["Bristol, UK"],
            ["London, UK"]
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
end