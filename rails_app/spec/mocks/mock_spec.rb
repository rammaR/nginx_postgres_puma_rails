require 'student'
require 'course'

describe 'Mocks', type: :mocks do

    context "Student" do
           
        it 'Student has to responde to bar method' do
            student = Student.new

            expect(student).to receive(:bar)

            student.bar
        end

        it 'Student has to invoke foo once' do
            student = Student.new

            expect(student).to receive(:foo).with(123).once

            student.foo(123)
        end

        it 'Has to send entrance and exit' do
            student = Student.new
            
            expect(student).to receive(:bater_ponto).with('226').exactly(2).times.and_return('válido')

            student.bater_ponto('226')
            student.bater_ponto('226')
        end

    end

end