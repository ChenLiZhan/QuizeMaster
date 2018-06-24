require 'rails_helper'

RSpec.describe 'Questions API', type: :request do
  # initialize test data 
  let!(:questions) { create_list(:question, 10) }
  let(:question_id) { questions.first.id }

  # Test suite for GET /api/v1/questions
  describe 'GET /api/v1/questions' do
    # make HTTP get request before each example
    before { get '/api/v1/questions' }

    it 'returns questions' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /api/v1/questions/:id
  describe 'GET /api/v1/questions/:id' do
    before { get "/api/v1/questions/#{question_id}" }

    context 'when the record exists' do
      it 'returns the question' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(question_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:question_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Question/)
      end
    end
  end

  # Test suite for POST /api/v1/questions
  describe 'POST /api/v1/questions' do
    # valid payload
    let(:valid_attributes) { { content: 'How many vowels are there in the English alphabet?', answer: '5' } }

    context 'when the request is valid' do
      before { post '/api/v1/questions', params: valid_attributes }

      it 'creates a question' do
        expect(json['content']).to eq('How many vowels are there in the English alphabet?')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/v1/questions', params: { foo: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Content can't be blank/)
      end
    end
  end

  # Test suite for PUT /api/v1/questions/:id
  describe 'PUT /api/v1/questions/:id' do
    let(:valid_attributes) { { content: 'changed question contented' } }

    context 'when the record exists' do
      before { put "/api/v1/questions/#{question_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /api/v1/questions/:id
  describe 'DELETE /api/v1/questions/:id' do
    before { delete "/api/v1/questions/#{question_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end