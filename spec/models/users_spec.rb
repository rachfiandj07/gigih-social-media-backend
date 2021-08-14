require_relative '../../models/users.rb'

describe Users do

    describe 'initialize' do
        it 'should return not nil' do
            it 'should return not nil' do
                users = Users.new('@naufalrdj', 'Hello', 'test@gmail.com')

                expect(users).not_to be_nil
            end
        end
    end

    describe 'valid?' do

        context 'given valid params' do

        end

        context 'given invalid params' do
            it 'should return false when username is nil' do
                users = Users.new(nil, 'Hello', 'test@gmail.com')

                expect(users.valid?).to eq(false)
            end
            it 'should return false when bio is nil' do
                users = Users.new('@naufalrdj', nil, 'test@gmail.com')

                expect(users.valid?).to eq(false)
            end
            it 'should return false when email is nil' do
                users = Users.new('@naufalrdj', 'Hello', nil)

                expect(users.valid?).to eq(false)
            end
        end

    end

end
