require_relative '../../models/users.rb'

describe Users do

    describe 'valid?' do

        context 'given valid params' do
            it 'should return not nil' do
                users = Users.new('@naufalrdj', 'Hello', 'test@gmail.com')

                expect(users).not_to be_nil
            end
        end

    end

end
