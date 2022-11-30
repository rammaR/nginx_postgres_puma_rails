namespace :dev do
  
  DEFAULT_PASSWORD = "senhadmin"

  desc "init"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando BD....") { %x(rails db:drop) }
      show_spinner("Criando BD...") { %x(rails db:create) }
      show_spinner("Migrando BD...") { %x(rails db:migrate) }
      show_spinner("Cadastrando usuário admin") { %x(rails dev:add_default_admin) }
      show_spinner("Cadastrando usuário user") { %x(rails dev:add_default_user) }
      show_spinner("Cadastrando outros usuarios") { %x(rails dev:add_others_admins) }
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

  private
    def show_spinner(msg_start, msg_end = "Concluído")
      spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
      spinner.auto_spin
      yield
      spinner.success("(#{msg_end})")
    end
end