ActiveAdmin.register Question do
    permit_params :content, :answer

    filter :content
end
