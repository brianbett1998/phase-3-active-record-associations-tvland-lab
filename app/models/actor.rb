class Actor < ActiveRecord::Base
    has_many :characters 
    has_many :shows, through: :characters

    def say_that_thing_you_say
        "#{self.name} always says: #{self.catchphrase}"
    end  

    def full_name
        "#{self.first_name} #{self.last_name}"
    end

    def list_roles
        self.characters.collect do |char|
            "#{char.name} - #{char.show.name}"
        end.join
    end
end