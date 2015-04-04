require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "Omniauth" do
    it "can sign in with Omniauth" do
      OmniAuth.config.test_mode = true
      omniauth_hash = { 'provider' => 'github',
        'uid' => '12345',
        'info' => {
          'name' => 'Chang',
          'nickname' => 'Chang'
        },
        'extra' => {'raw_info' =>
          { 'location' => 'San Francisco',
            'gravatar_id' => '123456789'
          }
        }
      }

      OmniAuth.config.add_mock(:github, omniauth_hash)
      request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:github]
      request.env["HTTP_REFERER"] = "github"
      expect {
        post :create_oauth, provider: :github
      }.to change{ User.count }.by(1)

    end
  end

end
