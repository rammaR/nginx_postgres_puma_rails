class ReportsController < ApplicationController

  PATH = Rails.root.join('public') + "/reports"

  def index
    @reports = Dir["public/reports/*"]
  end
   
  def create
    ReportJob.perform_later

    flash[:notice] = "Estamos processando seu relatório \\o/"
    redirect_to '/reports'
  end

  private
    def check_directory
      unless File.directory?("#{Rails.root.join('public')}/reports")
        Dir.mkdir "#{Rails.root.join('public')}/reports"
      end
    end

    def create_new_report
      code = (0...8).map { (65 + rand(26)).chr }.join
      
      out_file = File.new("#{Rails.root.join('public')}/reports/report#{code}.html", "w")
      out_file.puts("<p>Your Report Here - code: <b>#{code}</b></p>")
      out_file.puts("<hr>")
      out_file.puts("e-Book: Guia de Gems OneBitCode - <a href='https://onebitcode.com/guia-onebitcode-de-gems/'>Baixar Agora :)</a>")
      out_file.close

      out_file
    end    

end
