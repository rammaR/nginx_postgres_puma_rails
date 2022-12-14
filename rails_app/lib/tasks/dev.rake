namespace :dev do
  
  DEFAULT_PASSWORD = "senhadmin"
  DEFAULT_FILES_PATH = File.join(Rails.root, 'lib', 'tmp')

  desc "init"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando BD....") { %x(rails db:drop:all) }
      show_spinner("Criando BD...") { %x(rails db:create:all) }
      show_spinner("Migrando BD...") { %x(rails db:migrate) }
      show_spinner("Cadastrando usuário admin") { %x(rails dev:add_default_admin) }
      show_spinner("Cadastrando usuário user") { %x(rails dev:add_default_user) }
      show_spinner("Cadastrando outros usuarios") { %x(rails dev:add_others_admins) }
      show_spinner("Cadastrando assuntos padrões") { %x(rails dev:add_subjects) }
      show_spinner("Cadastrando clientes") { %x(rails dev:add_customers) }
    else
      puts "Você não esta em ambiente de desenvolvimento!"
    end
  end

  desc "Adiciona o administrador padrão"
    task add_default_admin: :environment do
      Admin.create!(
        email: "admin@admin.com",
        password: DEFAULT_PASSWORD,
        password_confirmation: DEFAULT_PASSWORD
      )
    end

  desc "Adiciona o usuário padrão"
    task add_default_user: :environment do
      User.create!(
        email: "user@user.com",
        password: DEFAULT_PASSWORD,
        password_confirmation: DEFAULT_PASSWORD
      )
    end

  desc "Adiciona outros usuarios e admins"
    task add_others_admins: :environment do
      10.times do |i|
        Admin.create!(
          email: Faker::Internet.email,
          password: DEFAULT_PASSWORD,
          password_confirmation: DEFAULT_PASSWORD
        )
      end
    end

  desc "Adiciona assuntos (categorias)" 
    task add_subjects: :environment do
      file_name = 'subjects.txt'
      file_path = File.join(DEFAULT_FILES_PATH, file_name)
      File.open(file_path, 'r').each do |line|
        Subject.create!(description: line.strip)
      end
    end

  desc "Adicionando clientes..."
    task add_customers: :environment do
      20.times do |i|
        Customer.create!(name: Faker::Name.name, 
                         email: Faker::Internet.email, 
                         address: Faker::Address.street_address, 
                         phone: Faker::PhoneNumber.cell_phone, 
                         avatar: Faker::Avatar.image(slug: "my-own-slug", size: "50x50", format: "jpg"),
                         smoking: [true, false].sample)
      end
    end

  private
    def show_spinner(msg_start, msg_end = "Concluído")
      spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
      spinner.auto_spin
      yield
      spinner.success("(#{msg_end})")
    end
end