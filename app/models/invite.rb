class Invite < ApplicationRecord
    belongs_to :post
    belongs_to :sender, class_name: 'User'
    belongs_to :recipient, class_name: 'User'
    
    before_create :generate_token
    before_save :check_user_existence
    
    def generate_token
        self.token = Digest::SHA1.hexdigest([self.post_id, Time.now, rand].join)
    end
    
    def check_user_existence
        recipient = User.find_by(email: self.email)
        if recipient
            self.recipient_id = recipient.id # establishing the association
        end
    end
end
