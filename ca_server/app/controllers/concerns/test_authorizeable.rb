module TestAuthorizeable
    extend ActiveSupport::Concern

    def test_authorize!
        unless request.headers['Authorization'] == 'TEST123'
            render json: {error: 'Not Authorized'}, code: 401
        end
    end
end