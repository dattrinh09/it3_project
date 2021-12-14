json.extract! teacher, :id, :name, :age, :email, :subject, :created_at, :updated_at
json.url teacher_url(teacher, format: :json)
