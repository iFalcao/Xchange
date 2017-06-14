class AdminMailerPreview < ActionMailer::Preview

    def update_email
        AdminMailer.update_email(Admin.all.sample, Admin.last)
    end

end