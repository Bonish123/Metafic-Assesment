require 'rails_helper'

RSpec.describe "Blog", type: :request do

  describe '#create' do

    def create_request(params: {})
      post '/blogs', params: params  
    end
    
    context 'create blog' do
      context 'valid params' do

        before do
          params = {
            "blog": {
                "title":"Metafic New Blog",
                "description": "Metafic description",
                "author_name": "Metafic Author",
                "is_active": false
            }
          }
          create_request(params: params)
        end

        it 'returns response with 200 status code' do
          expect(response.code).to eq('200')
        end

        it 'returns a successfull message' do
          expect(JSON.parse(response.body)['message']).to eq('Blog is created successfully')
        end
      end

      context 'invalid params' do
        before do
          params = {
            "blog": {
                "title":"",
                "description": "Metafic description",
                "author_name": "Metafic Author",
                "is_active": false,
            }
          }
          create_request(params: params)
        end

        it 'returns response with 400 status code' do
          expect(response.code).to eq('400')
        end


        #since title is required as per our model validations
        it 'returns an error message' do
          expect(JSON.parse(response.body)['message']).to eq('Unable to create blog')
        end
      end
    end
  end

end