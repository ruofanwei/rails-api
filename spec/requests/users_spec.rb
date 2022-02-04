require 'rails_helper'

describe 'Users api', type: :request do
    describe "GET /users" do
        before do
            FactoryBot.create(:user, username: 'rose', email: 'rose@gmail.com')
            FactoryBot.create(:user, username: 'jennie', email: 'jennie@gmail.com')
        end

        it 'returns all users' do

            get '/api/v1/users'
            expect(response).to have_http_status(:success)
            expect(response_body.size).to eq(2)
        end
    end

    describe "POST /users" do
        it 'create a new user' do
            expect{
                post '/api/v1/users', params: {user: {username: 'tanten', email: 'tanten@gmail.com'}}
        }.to change {User.count}.from(0).to(1)


            expect(response).to have_http_status(:created)
            expect(response_body).to eq(
                {
                    "id" => 1,
                    "username" => "tanten",
                    "email" => "tanten@gmail.com"
                }
            )
        end
    end

    describe "DELETE /users/:id" do
        let!(:user){ FactoryBot.create(:user, username: 'rose', email: 'rose@gmail.com') }
        it 'delete a user' do
            expect{
                delete "/api/v1/users/#{user.id}"
            } .to change {User.count}.from(1).to(0)

            expect(response).to have_http_status(:no_content)
        end
    end
end