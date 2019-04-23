require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :id, :title, :year, :playwright_id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id, self.id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end

  def self.find_by_title(title)
    PlayDBConnection.instance.execute(<<-SQL, self.title)
      SELECT
        title
      FROM
        plays
      WHERE
        title = title
    SQL
  end

  def self.find_by_playwright(name)
    PlayDBConnection.instance.execute(<<-SQL, self.playwright_id)
      SELECT
        playwright_id
      FROM
        plays
      WHERE
        playwright_id = name
    SQL
  end
end

class Playwright
  def self.all
   PlayDBConnection.instance.execute("SELECT playwright_id FROM plays")
  end

  def self.find_by_name(name)
    Play.find_by_playwright(name)
  end

  def initialize
    @id = id
    @playwright_id = playwright_id
  end

  def create
    raise "#{self} already in database" if self.playwright_id
    PlayDBConnection.instance.execute(<<-SQL, self.id,  self.playwright_id)
      INSERT INTO
        play (id, playwright_id)
      VALUES
        (?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
     raise "#{self} not in database" unless self.playwright_id
    PlayDBConnection.instance.execute(<<-SQL, self.playwright_id, self.id)
      UPDATE
        plays.playwright_id
      SET
        playwright_id = ?
      WHERE
        id = ?
    SQL
  end

  def get_plays
    PlayDBConnection.instance.execute(<<-SQL, self.playwright_id)
      SELECT
        title
      FROM
        plays
      WHERE
        playwright_id = ?;
    SQL
  end
end
