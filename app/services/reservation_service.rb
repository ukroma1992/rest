class ReservationService

  def self.get_reservations
    Reservation.includes(:table).all
  end

  def self.make_reservation(name, requested_timestamp)
    tables = get_available_tables(requested_timestamp)
    raise Exceptions::CapacityError.new if tables.nil? || tables.none?

    reservation = Reservation.create(table: tables.first, requested_datetime: requested_timestamp)
  end

  private

  def self.get_available_tables(timestamp)
    datetime = DateTime.parse(timestamp)
    time_range = (datetime)..(datetime+59.minutes)
    reserved_tables = Table.includes(:reservations).where(reservations: {requested_datetime: time_range})
    #todo
  end

end
