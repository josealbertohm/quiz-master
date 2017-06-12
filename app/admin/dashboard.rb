ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

    columns do
      column do
        panel "Quiz" do
          ul do
            Question.select("id, content").order("RANDOM()").limit(10).map do |question|
              li question.content
            end
          end
          form :partial => "form"
        end
      end
    end
  end
end
