json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :location_id, :section, :row, :seat, :link, :local, :asking
  json.url ticket_url(ticket, format: :json)
end
