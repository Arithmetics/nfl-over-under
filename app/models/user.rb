class User < ApplicationRecord
  attr_accessor :remember_token, :activation_token, :reset_token
  before_save :downcase_email # was { self.email.downcase!} when we set up initially but cleaned up a little now
  before_create :create_activation_digest
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false }
  #this automatically associated the password_digest with the password
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  has_many :picks, dependent: :destroy


  # returns the hash digest of a given string, think this is a class method
  # all that I can see we did with this was use it to make fixtures with the correct password_digest
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end


  #this will be used to make random tokens for cookies and emails that reset stuff
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  #sets remember_digest in the database and makes the matching token on the user object
  def remember
    self.remember_token = User.new_token
    #so @user.remember_token = some random string
    update_attribute(:remember_digest, User.digest(remember_token))
    #so the User in the database has its remember_digest collumn updated to the Bcrypt of the remember_token
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  #this has nothing to do with the password authenticate method
  #basically says is the token entered equal to the remember_digest in the database for the user
  #updated this with meta programming to accept difference types of tokens
  def authenticated?(token_type, entered_token)
    digest = send("#{token_type}_digest")
    #remember_digest here is actually self.remember_digest [AR Magic again]
    return false if digest.nil?
    #same here
    BCrypt::Password.new(digest).is_password?(entered_token)
  end

  #activates an account
  def activate
    update_attribute(:activated, true)
    update_attribute(:activated_at, Time.zone.now)
  end

  #send activation email
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  #sets the password_reset_digest
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest, User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  #send password reset email
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  def password_reset_expired?
    #It is idiomatic to prefer to omit self. when invoking methods; it is generally never needed.
    #so this could be self.reset_sent_at
    #if we were setting it, it would have to be self.reset_sent_at because otherwise it would
    #think it was another local variable
    reset_sent_at < 20.hours.ago
  end

  def projected_points
    points = 0
    self.picks.each do |pick|
      standing_status = Standing.where(team_name: pick.title).last.win_loss_pct
      standing_goal = Standing.where(team_name: "#{pick.title} Goal").last.win_loss_pct
      if standing_status
        if pick.selection == "over"
          if standing_status > standing_goal && pick.super
            points += 2
          elsif standing_status > standing_goal
            points += 1
          end
        elsif pick.selection == "under"
          if standing_status < standing_goal && pick.super
            points += 2
          elsif standing_status < standing_goal
            points += 1
          end
        end
      end
    end
    points
  end

  def self.sorted_by_projected_points
    User.all.sort_by(&:projected_points).reverse!
  end

  ############################################################################

  private

  def downcase_email
    self.email = email.downcase
  end

  #creates and assigns the activation_token and digest
  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest(activation_token)
  end

end
