class AdminMailerPreview < ActionMailer::Preview

    def update_email
        AdminMailer.update_email(Admin.all.sample, Admin.last)
    end

    def send_message
        AdminMailer.send_message(Admin.all.sample, Admin.last, "subject text", "message text")
    end
end