require 'Student'
require 'Course'

describe "Students and Courses Stubs", type: :stubs do
    
    it '#has finished?' do
        student = Student.new
        course = Course.new

        allow(student).to receive(:has_finished?)
            .with(an_instance_of(Course))
            .and_return(true)

        course_finished = student.has_finished?(course)
        expect(course_finished).to be_truthy
    end

    it 'Argumentos dinâmicos' do
        student = Student.new

        allow(student).to receive(:foo) do |arg|
            if arg == :hello
                "Olá"
            elsif arg == :hi
                "Hi" 
            end
        end

        expect(student.foo(:hello)).to eq('Olá')
        expect(student.foo(:hi)).to eq("Hi")
    end

    it 'Qualquer instancia de Classe' do
        student = Student.new
        other_student = Student.new

        allow_any_instance_of(Student).to receive(:bar).and_return(true)

        expect(student.bar).to be_truthy
        expect(other_student.bar).to be_truthy
    end

    it 'Should trigger errors' do
        student = Student.new

        allow(student).to receive(:bar).and_raise(RuntimeError)

        expect{
            student.bar
        }.to raise_error(RuntimeError)
    end

end 