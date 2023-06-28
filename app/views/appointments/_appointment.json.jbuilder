json.extract! appointment, :id, :meet_date, :meet_time, :meet_motive, :meet_state, :medico_id, :user_id, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
