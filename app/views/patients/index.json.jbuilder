json.array!(@patients) do |patient|
  json.extract! patient, 
  json.url patient_url(patient, format: :json)
end
