json.extract! movie, :id, :title, :genre, :description, :director, :release_date, :run_time, :production_company, :review, :user_id, :created_at, :updated_at
json.url movie_url(movie, format: :json)
