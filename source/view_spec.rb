require_relative 'view'

describe 'View' do
  describe 'welcome_msg' do
    it 'should return a welcome message' do
      expect(View.welcome_msg).to receive(:puts).with("Welcome")
    end
  end
end
