require_relative '../../models/users.rb'

describe Users do

    describe 'valid?' do

        context 'given valid params' do
            it 'should return true' do
                users = Users.new('@naufalrdj', 'Hello', 'test@gmail.com')

                expect(users).to eq(true)
            end
        end

    end

end
